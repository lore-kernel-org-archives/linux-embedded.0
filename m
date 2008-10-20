From: Christian SCHWARZ <christian.schwarz@st.com>
Subject: Re: UIO - interrupt performance
Date: Mon, 20 Oct 2008 12:30:02 +0200
Message-ID: <48FC5DAA.7070505@st.com>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Douglas, Jim (Jim)" <jdouglas@avaya.com>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

Hi Jim,

> The obvious disadvantages of user mode device drivers are security /
> isolation. 
without going back to the endless discussion of micro-kernels vs
monolithic OS's, the main *advantage* is security and isolation: faults
in the driver will not or to a lesser degree impact the kernel and thus
overall system stability. And drivers are isolated from each other, if
the OS is doing at least an OK job.

> Do you know what the *technical* disadvantages of this approach might
> be? I am most concerned about possible impact on interrupt handling. 
The main obstacles for driver development in my opinion are:
- additional context switches (user -> user, user <-> kernel)
- you need to have a decent user <-> kernel interface, since partial INT
handling must be done in kernel mode
- a "Device driver framework" generally helps having clean drivers and
reduces code duplication and "spaghetti code" and especially reduce
context switching times

Apart from that the kernel might need to implement mechanisms like
"priority inheritance" or other scheduling policies in order to make
sure the user mode interrupt handler gets to run (with a minimal delay).

//Christian
