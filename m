From: "Mehaffey, John" <John_Mehaffey@mentor.com>
Subject: RE: GPIO triggers kernel reboot
Date: Sat, 25 Jan 2014 20:24:33 +0000
Message-ID: <371E240E6FC1D44DA5E51EE9DCDCB7845E5EA0E1@NA-MBX-01.mgc.mentorg.com>
References: <52E3E031.6040709@denx.de>
 <371E240E6FC1D44DA5E51EE9DCDCB7845E5EA0A1@NA-MBX-01.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <371E240E6FC1D44DA5E51EE9DCDCB7845E5EA0A1@NA-MBX-01.mgc.mentorg.com>
Content-Language: en-US
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "hs@denx.de" <hs@denx.de>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Cc: Wolfgang Denk <wd@denx.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

> -----Original Message-----
> From: linux-embedded-owner@vger.kernel.org 
> [mailto:linux-embedded-owner@vger.kernel.org] On Behalf Of Heiko 
> Schocher
> Sent: Saturday, January 25, 2014 8:03 AM
> To: linux-embedded@vger.kernel.org
> Cc: Wolfgang Denk; linux-arm-kernel@lists.infradead.org
> Subject: GPIO triggers kernel reboot
> 
> Hello all,
> 
> is it possible to reboot current mainline kernel triggered from a GPIO in kernel space?
> 
> If not, how can be done this, so that it has a chance to go into mainline?
> 
> Thanks for any suggestions
> 
> bye,
> Heiko

Hi Heiko,
Call kexec() from the GPIO driver.
It will take some effort to get it right :)

Or if a simple reboot is all that you want, examine the several reboot APIs in kernel/reboot.c

Sincerely,
John Mehaffey
Principal Engineer, Automotive
Mentor Graphics
> -- 
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> --
> To unsubscribe from this list: send the line "unsubscribe 
> linux-embedded" in the body of a message to majordomo@vger.kernel.org 
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
