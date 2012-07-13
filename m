From: David Cullen <David.Cullen-fr0PuLqsQ4HoKIiMyRuXRw@public.gmane.org>
Subject: Help with testing "flash-kernel" for stable release update (SRU)
Date: Fri, 13 Jul 2012 17:30:41 +0000
Message-ID: <50005B41.9070600@koe-americas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Language: en-US
Content-ID: <5295940D81B5B8409D52A64FB3EF30E0-fr0PuLqsQ4HoKIiMyRuXRw@public.gmane.org>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "ubuntu-devel-discuss-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org" <ubuntu-devel-discuss-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hello,

I submitted a patch for "flash-kernel" to Ubuntu to solve this problem:

> Kernel /boot/vmlinuz-3.4.0-1-linaro-lt-omap does not match your subarchitecture
> omap4, therefore not writing it to flash.

The problem has been reported as

    https://bugs.launchpad.net/ubuntu/+source/flash-kernel/+bug/1023952

I submitted a patch, but for the patch to be included in a "stable
release update" (aka SRU), it needs to be tested on a BeagleBoard-xM.

If you are running Ubuntu on a BeagleBoard-xM, will you help me test
this patch?

-- 
Thank you,
David Cullen
