From: Daniel Walker <dwalker@mvista.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk
	output for crash logging
Date: Fri, 08 Aug 2008 13:47:44 -0700
Message-ID: <1218228464.19162.194.camel@localhost.localdomain>
References: <489BAD5C.2080009@cisco.com>
	 <1218210904.19162.144.camel@localhost.localdomain>
	 <8bd0f97a0808080905u1b515556gd68c2ba1d0b47cb4@mail.gmail.com>
	 <1218212266.19162.149.camel@localhost.localdomain>
	 <8bd0f97a0808081109q693f6f1at650a9be0547b7f9b@mail.gmail.com>
	 <1218226225.19162.189.camel@localhost.localdomain>
	 <8bd0f97a0808081313v4df788b9xcd25308ca64b0862@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0808081313v4df788b9xcd25308ca64b0862@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: dvomlehn@cisco.com, linux-embedded@vger.kernel.org

On Fri, 2008-08-08 at 16:13 -0400, Mike Frysinger wrote:

> same sort of things as the point of David's code.  early/crash
> scenarios for people to safely extract portions of the kernel log
> buffer for transmission/storage elsewhere.  as was explained in the
> original thread behind the commit.

How is that code suppose to help anyone if you aren't calling it from
anyplace in the kernel? Clearly your using it, right? Where is the code
your calling these functions from?

Daniel
