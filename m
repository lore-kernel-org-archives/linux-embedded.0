From: richard -rw- weinberger <richard.weinberger@gmail.com>
Subject: Re: 2013 Plumber's CFP: Fastboot
Date: Tue, 14 May 2013 17:10:55 +0200
Message-ID: <CAFLxGvxUFBHV4Y9vEVvhRR73tgLKFiRxHKo2F9p_5ZtYDDC_fw@mail.gmail.com>
References: <371E240E6FC1D44DA5E51EE9DCDCB7845E3D0BF9@NA-MBX-03.mgc.mentorg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type:content-transfer-encoding;
        bh=M39SqMgVsh7iMsx3n3QgW55i4/wtg8eIgI3afDpsJhM=;
        b=0d+MBhxFMv5wVYJtTev8Rk8ZKTIqLYnOX586+63kAH9eyxWhP2nSoK1JyX5/ortO0R
         twortkS1VSEu7Rl2WJsOAXlcj3MyHu0SVP3MMUfNpU/kTyIocEsvNtGDDw8n7Ax7qQxE
         n5/i2ooLI2NebRF0QvCsGp6ZeeuZBVgmYHle7SYMxf+Jfprq8ViUMAmvVCNN91IFIPf9
         5S9LN97ws1o3fGpBCUIPFZzV7aGHnAMslmAFwgKwyC32WDRakhbYuy2hYwdu+y0L04lp
         2mCvb3YlCqX9+IlPAhIfjh1wxJvtzCZH+CyTxhK7DlFC5pro6WlHJkhsmO9TYzsr7uUn
         xqKA==
In-Reply-To: <371E240E6FC1D44DA5E51EE9DCDCB7845E3D0BF9@NA-MBX-03.mgc.mentorg.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Mehaffey, John" <John_Mehaffey@mentor.com>
Cc: "tim.bird@am.sony.com" <tim.bird@am.sony.com>, "wd@denx.de" <wd@denx.de>, "mzjro@0pointer.net" <mzjro@0pointer.net>, "Kay.Sievers@vrfy.org" <Kay.Sievers@vrfy.org>, "Pomerantz, Brian" <Brian_Pomerantz@mentor.com>, "yoush@cs.msu.su" <yoush@cs.msu.su>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "genivi-dev@mail.genivi.org" <genivi-dev@mail.genivi.org>, "systemd-devel@lists.freedesktop.org" <systemd-devel@lists.freedesktop.org>, "celinux-dev@lists.celinuxforum.org" <celinux-dev@lists.celinuxforum.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Tue, May 14, 2013 at 1:51 AM, Mehaffey, John
<John_Mehaffey@mentor.com> wrote:
> Hello All,
>
> I am proposing a microconference on fastboot at the Linux Plumber's conference 2013 in New Orleans. The goal is to get to sub 1S boot times for a large (IVI) system using NAND flash. This pushes the state of the art, and will require innovative solutions in may areas of Linux plumbing, including bootloader, kernel init, UBI, and systemd.
>
> Note that fastboot improvements will (generally) help all architectures so I am not limiting this to automotive systems.
>
> Please visit http://wiki.linuxplumbersconf.org/2013:fastboot for more information or if you want to submit a topic.
>
> If you want to reply to this message, please trim the cc list!

Why trimming the CC? Changing the CC list is a _very_ bad habit.

Anyway, a few notes on UBI fastmap.
Before we talk about optimizing it we have to make sure that it is stable.
Currently it has not much users because embedded folks are a few
kernel releases behind.
I expect that we'll face some issues (hey it's software!). Instead of
making the code more complicated we have to
make very sure that it works well.
Fastmap got much more complicated than I thought while developing the
first proof of concept implementation.

We also have to think more about userland support, e.g. making tools
like ubinize fastmap aware...
User want ready to use fastmap UBI images and not images which have to
be converted by the kernel on the very first boot.

Sharing UBI EBA table between U-Boot and the kernel would be a nice
feature, but we also have to make sure
that we can share the EBA table between two kernels (think of kexec).
So, a more general solution is needed.

--
Thanks,
//richard
