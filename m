From: Ben Nizette <bn@niasdigital.com>
Subject: Re: [PATCH v2 RESEND] gpiolib: Add pin change notification
Date: Fri, 24 Oct 2008 11:28:17 +1100
Message-ID: <1224808097.7082.3.camel@moss.renham>
References: <1224543007.3954.71.camel@moss.renham>
	 <20081021133106.be5cc01c.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081021133106.be5cc01c.akpm@linux-foundation.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david-b@pacbell.net, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org


On Tue, 2008-10-21 at 13:31 -0700, Andrew Morton wrote:
> On Tue, 21 Oct 2008 09:50:06 +1100
> Ben Nizette <bn@niasdigital.com> wrote:
> > +static irqreturn_t gpio_irq_handler(int irq, void *dev_id)
> > +{
> > +	struct gpio_desc *desc = dev_id;
> > +	int gpio = desc - gpio_desc;
> > +	int new, old;
> > +
> > +	if (!gpio_is_valid(gpio))
> > +		return IRQ_NONE;
> > +
> > +	new = gpio_get_value(gpio);
> > +	old = desc->val;
> > +
> > +	if ((new && !old && test_bit(ASYNC_RISING, &desc->flags)) ||
> > +	    (!new && old && test_bit(ASYNC_FALLING, &desc->flags)))
> > +		sysfs_notify(&desc->dev->kobj, NULL, "value");
> 
> eekeekeek!  sysfs_notify() does mutex_lock() and will die horridly if
> called from an interrupt handler.
> 
> You should have got a storm of warnings when runtime testing this code.
> Please ensure that all debug options are enabled when testing code. 
> Documentation/SubmitChecklist has help.

0_o yea that isn't great...  Thanks - shall respin and repost shortly.


	--Ben.
