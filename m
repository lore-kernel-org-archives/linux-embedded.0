From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Android mainlining project
Date: Tue, 20 Dec 2011 15:37:44 -0800
Message-ID: <4EF11C48.4060809@am.sony.com>
References: <4EEFD926.3040201@am.sony.com>  <CABiHV1Q2SyXX3h99tAo6Z4tmd1HUsj0KaQB5OV3qqm4Yn8P2ag@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABiHV1Q2SyXX3h99tAo6Z4tmd1HUsj0KaQB5OV3qqm4Yn8P2ag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geunsik Lim <leemgs1@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On 12/20/2011 03:27 PM, Geunsik Lim wrote:
> On Tue, Dec 20, 2011 at 9:39 AM, Tim Bird <tim.bird@am.sony.com> wrote:
>> The wiki page for this effort (still under construction) is
>> at: http://elinux.org/Android_Mainlining_Project
> Actually, current linux-next tree is not including ashmem(anonymous
> shared memory).
> When I checked android kernel features of linux-next(20111219),
> Wakelock API feature(./kernel/power/*lock.c) still isn't appeared in
> linux-next tree.

Both of these (wakelocks and ashmem) are listed as "not mainlined"
in the table on the wiki page.  Ashmem is apparently being
worked on (see the lwn.net article).
 -- Tim


=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
