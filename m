From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [U-Boot] 2013 Plumber's CFP: Fastboot
Date: Tue, 14 May 2013 16:00:50 +0200
Message-ID: <20130514160050.38d591d3@skate>
References: <371E240E6FC1D44DA5E51EE9DCDCB7845E3D0BF9@NA-MBX-03.mgc.mentorg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <371E240E6FC1D44DA5E51EE9DCDCB7845E3D0BF9@NA-MBX-03.mgc.mentorg.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Mehaffey, John" <John_Mehaffey@mentor.com>
Cc: "tim.bird@am.sony.com" <tim.bird@am.sony.com>, "wd@denx.de" <wd@denx.de>, "mzjro@0pointer.net" <mzjro@0pointer.net>, "Kay.Sievers@vrfy.org" <Kay.Sievers@vrfy.org>, "Pomerantz, Brian" <Brian_Pomerantz@mentor.com>, "yoush@cs.msu.su" <yoush@cs.msu.su>, "systemd-devel@lists.freedesktop.org" <systemd-devel@lists.freedesktop.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "genivi-dev@mail.genivi.org" <genivi-dev@mail.genivi.org>, "celinux-dev@lists.celinuxforum.org" <celinux-dev@lists.celinuxforum.org>

Dear Mehaffey, John,

On Mon, 13 May 2013 23:51:46 +0000, Mehaffey, John wrote:

> I am proposing a microconference on fastboot at the Linux Plumber's
> conference 2013 in New Orleans. The goal is to get to sub 1S boot
> times for a large (IVI) system using NAND flash. This pushes the
> state of the art, and will require innovative solutions in may areas
> of Linux plumbing, including bootloader, kernel init, UBI, and
> systemd.

Beware that the 'fastboot' you're talking about (making Linux boot
fast), especially written this way, may easily be confused with
'fastboot', which is the Android-specific protocol to flash a system
through USB (see
http://en.wikipedia.org/wiki/Android_software_development#Fastboot).

Besides this minor comment, I'm looking forward for the notes of this
discussion on this very interesting topic.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
