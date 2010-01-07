From: Hein_Tibosch <hein_tibosch@yahoo.es>
Subject: Re: [PATCH V2 6/8] lzma: Make lzma ... thunderbird ok
Date: Thu, 07 Jan 2010 15:43:52 +0800
Message-ID: <4B4590B8.80604@yahoo.es>
References: <E1NIuOW-0001ol-RC@dylan.lougher.demon.co.uk>	 <20100106140409.ba0f63d1.akpm@linux-foundation.org>	 <4B4528C8.3020603@lougher.demon.co.uk>	 <20100106163113.637e47db.akpm@linux-foundation.org> <bffbecbb1001061637i31260775ja14523458cc1ed51@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <bffbecbb1001061637i31260775ja14523458cc1ed51@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip.lougher@gmail.com>
Cc: linux-embedded@vger.kernel.org

On 7-1-2010 08:37, Phillip Lougher wrote:
> Sorry, I was worried it might do that - the curse of Thunderbird.  I
> normally use a
> really dumb client like mailx to send patches, but I obviously didn't have the
> email thread under mailx to do that.
>   
Thunderbird: not a real curse for patches. Try the following:

Tools -> Options -> Advanced -> General -> Config Editor

mailnews.send_plaintext_flowed  user  boolean  false
mailnews.display.disable_flowed_support user  boolean  true
mailnews.wraplength user integer 512

And see this patch below:

---
diff --git a/thunderbird b/thunderbird
+++
---
	if (using_thunderbird) {
		you can send patches safely
	}
---

Hein


