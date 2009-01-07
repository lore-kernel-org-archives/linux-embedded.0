From: Grant Erickson <gerickson@nuovations.com>
Subject: Re: [PATCH/RFC] Add Alternative Log Buffer Support for printk Messages
Date: Tue, 06 Jan 2009 18:11:11 -0800
Message-ID: <C5894F3F.13C20%gerickson__13050.396301742$1231294408$gmane$org@nuovations.com>
References: <1231286642.14860.35.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <1231286642.14860.35.camel@pasglop>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>, Wolfgang Denx <wd@denx.de>, linux-embedded@vger.kernel.org

On 1/6/09 4:04 PM, Benjamin Herrenschmidt wrote:
> On Tue, 2008-11-25 at 10:34 -0800, Grant Erickson wrote:
>> This merges support for the previously DENX-only kernel feature of
>> specifying an alternative, "external" buffer for kernel printk
>> messages and their associated metadata. In addition, this ports
>> architecture support for this feature from arch/ppc to arch/powerpc.
>> 
>> Signed-off-by: Grant Erickson <gerickson@nuovations.com>
> 
> Considering the extensive changes to generic code, this patch will
> have to be submitted via the linux-kernel mailing list.
> 
> I suggest you split the generic core change from the powerpc specific
> implementation.
> 
> I'm not sure whether I like the idea myself or not there, so you'll have
> to convince the powers that be to take it.

Ben:

Thanks for the feedback. Matt Sealey had some good feedback
<http://ozlabs.org/pipermail/linuxppc-dev/2008-November/065594.html> which I
have on my to-do list to evaluate.

In the interim, I'll hold off on pushing up to linux-kernel until I've done
that.

Regards,

Grant
