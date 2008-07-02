From: "Dan Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 2/6] dmaengine: Add dma_chan_is_in_use() function
Date: Tue, 1 Jul 2008 19:00:55 -0700
Message-ID: <e9c3a7c20807011900x7b2ac3dx7536e0450202e3c0@mail.gmail.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	 <1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
	 <1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
	 <e9c3a7c20807011831n74eb69b8r3095b62515fe5c9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=VXyG0LE2YHgvQzYYmbUh0GWy2RK3zOE+358LYDNO6oU=;
        b=NeKGUOhZmiaNCSj8aSmwfqEwjyjivIQ2fOIdj9O2SKg3u7yBVLmsCGnptQ+cSfsl0c
         bGb0ptpAG5kg4GTXZaJL3HWVDe/8Nt/jiepzs3eRa17sLtBOhwjsBZfgfhmD6wFa2UMU
         Wg6OgDPZknsYnQ1Qq2M7AXiz/EFIoQRYJY/jY=
In-Reply-To: <e9c3a7c20807011831n74eb69b8r3095b62515fe5c9@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, David Brownell <david-b@pacbell.net>

On Tue, Jul 1, 2008 at 6:31 PM, Dan Williams <dan.j.williams@intel.com> wrote:
> On Thu, Jun 26, 2008 at 6:23 AM, Haavard Skinnemoen
> <haavard.skinnemoen@atmel.com> wrote:
>> This moves the code checking if a DMA channel is in use from
>> show_in_use() into an inline helper function, dma_is_in_use(). DMA
>> controllers can use this in order to give clients exclusive access to
>> channels (usually necessary when setting up slave DMA.)
>>
>> I have to admit that I don't really understand the channel refcounting
>> logic at all... dma_chan_get() simply increments a per-cpu value. How
>> can we be sure that whatever CPU calls dma_chan_is_in_use() sees the
>> same value?
>
> As Chris noted in the comments at the top of dmaengine.c this is an
> implementation Rusty's 'bigref'.  It seeks to avoid the
> cache-line-bouncing overhead of maintaining a single global refcount
> in hot paths like tcp_v{4,6}_rcv().  When the channel is being
> removed, a rare event, we transition to the accurate, yet slow, global
> method.
>
> Your observation is correct, dma_chan_is_in_use() may lie in the case
> when the current cpu is not using the channel.  For this particular
> test I think you can look to see if this channel's resources are
> already allocated.  If they are then some other client got a hold of
> this channel before the current attempt.  Hmm... that would also
> require that we free the channel's resources in the case where the
> client replies with DMA_NAK, probably something we should do anyways.
>
> Thoughts?
>

Actually we will probably need something like the following.
->client_count is protected by the dma_list_mutex.

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 99c22b4..10de69e 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -183,9 +183,10 @@ static void dma_client_chan_alloc(struct
dma_client *client)
 				/* we are done once this client rejects
 				 * an available resource
 				 */
-				if (ack == DMA_ACK)
+				if (ack == DMA_ACK) {
 					dma_chan_get(chan);
-				else if (ack == DMA_NAK)
+					chan->client_count++;
+				} else if (ack == DMA_NAK)
 					return;
 			}
 		}
@@ -272,8 +273,10 @@ static void dma_clients_notify_removed(struct
dma_chan *chan)
 		/* client was holding resources for this channel so
 		 * free it
 		 */
-		if (ack == DMA_ACK)
+		if (ack == DMA_ACK) {
 			dma_chan_put(chan);
+			chan->client_count--;
+		}
 	}

 	mutex_unlock(&dma_list_mutex);
@@ -313,8 +316,10 @@ void dma_async_client_unregister(struct dma_client *client)
 			ack = client->event_callback(client, chan,
 				DMA_RESOURCE_REMOVED);

-			if (ack == DMA_ACK)
+			if (ack == DMA_ACK) {
 				dma_chan_put(chan);
+				chan->client_count--;
+			}
 		}

 	list_del(&client->global_node);
@@ -394,6 +399,7 @@ int dma_async_device_register(struct dma_device *device)
 		kref_get(&device->refcount);
 		kref_get(&device->refcount);
 		kref_init(&chan->refcount);
+		chan->client_count = 0;
 		chan->slow_ref = 0;
 		INIT_RCU_HEAD(&chan->rcu);
 	}
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index d08a5c5..6432b83 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -139,6 +139,7 @@ struct dma_chan_percpu {
  * @rcu: the DMA channel's RCU head
  * @device_node: used to add this to the device chan list
  * @local: per-cpu pointer to a struct dma_chan_percpu
+ * @client-count: how many clients are using this channel
  */
 struct dma_chan {
 	struct dma_device *device;
@@ -154,6 +155,7 @@ struct dma_chan {

 	struct list_head device_node;
 	struct dma_chan_percpu *local;
+	int client_count;
 };

 #define to_dma_chan(p) container_of(p, struct dma_chan, dev)
