From: Mark Miller <mark@mirell.org>
Subject: Versatile PB Board Support for ARMv6 and ARMv7
Date: Tue, 7 Apr 2009 22:37:25 -0500
Message-ID: <6F1ECC5B-A247-4328-892E-1620FF5E2172@mirell.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-kernel@vger.kernel.org
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, qemu-devel@nongnu.org

(Apologies if this appeared twice for some. My mail client was  
misbehaving and sending HTML messages)

In late October 2008, according to the git logs, the methodology for  
selecting a processor on several boards, at least the Versatile PB  
board was changed so that it automatically selects CPU_ARM926T as a  
hidden symbol.

The reason I have a question, is since QEMU currently can emulate a  
Versatile PB board with other processors than just the ARM926T (Such  
as the ARM1136 (ARMv6) and Cortex-A8 (ARMv7), is there a good way to  
allow that in the mainstream kernel? Previously the patch was to just  
add extra potential dependencies on CPU_V6 and CPU_V7, so that by  
selecting MACH_VERSATILE_PB, you could select ARMv6/v7 support.

Currently I'm just deleting the select statement, and having all the  
CPUs appear, as no longer hidden symbols. My question is, what is the  
best way to allow for other processors for this board in Kconfig, so  
it could be submitted to the mainstream kernel?

-- 
Mark A. Miller
mark@mirell.org


