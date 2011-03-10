From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PWM v7 3/3] PWM: Atmel PWMC driver
Date: Thu, 10 Mar 2011 08:36:53 +0100
Message-ID: <201103100836.54361.alexander.stein@systec-electronic.com>
References: <1299701596-24665-1-git-send-email-bgat@billgatliff.com> <1299701596-24665-4-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1299701596-24665-4-git-send-email-bgat@billgatliff.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Wednesday 09 March 2011, 21:13:16 Bill Gatliff wrote:
> Driver to allow the Atmel PWMC peripheral found on various
> AT91 SoCs to be controlled using the Generic PWM framework.
> Tested on the AT91SAM9263.

As far as I can see, the previosly support for pwm_channel_handler has been 
dropped. The new API doesn't support such things.
What do you think about adding this? It might be important to change the PWM 
setup after a specific amount of time.

Alexander
