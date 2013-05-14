From: "Mehaffey, John" <John_Mehaffey@mentor.com>
Subject: RE: 2013 Plumber's CFP: Fastboot
Date: Tue, 14 May 2013 16:08:52 +0000
Message-ID: <371E240E6FC1D44DA5E51EE9DCDCB7845E3D248C@NA-MBX-03.mgc.mentorg.com>
References: <371E240E6FC1D44DA5E51EE9DCDCB7845E3D0BF9@NA-MBX-03.mgc.mentorg.com>,<CAFLxGvxUFBHV4Y9vEVvhRR73tgLKFiRxHKo2F9p_5ZtYDDC_fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFLxGvxUFBHV4Y9vEVvhRR73tgLKFiRxHKo2F9p_5ZtYDDC_fw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Cc: "tim.bird@am.sony.com" <tim.bird@am.sony.com>, "wd@denx.de" <wd@denx.de>, "mzjro@0pointer.net" <mzjro@0pointer.net>, "Kay.Sievers@vrfy.org" <Kay.Sievers@vrfy.org>, "Pomerantz, Brian" <Brian_Pomerantz@mentor.com>, "yoush@cs.msu.su" <yoush@cs.msu.su>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "genivi-dev@mail.genivi.org" <genivi-dev@mail.genivi.org>, "systemd-devel@lists.freedesktop.org" <systemd-devel@lists.freedesktop.org>, "celinux-dev@lists.celinuxforum.org" <celinux-dev@lists.celinuxforum.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

> From: richard -rw- weinberger [richard.weinberger@gmail.com]
> Sent: Tuesday, May 14, 2013 8:10 AM
> To: Mehaffey, John
> Cc: tim.bird@am.sony.com; wd@denx.de; mzjro@0pointer.net; Kay.Sievers@vrfy.org; Pomerantz, Brian; yoush@cs.msu.su; u-boot@lists.denx.de; genivi-dev@mail.genivi.org; systemd-devel@lists.freedesktop.org; celinux-dev@lists.celinuxforum.org; linux-kernel@vger.kernel.org; linux-embedded@vger.kernel.org
> Subject: Re: 2013 Plumber's CFP: Fastboot
> 
> On Tue, May 14, 2013 at 1:51 AM, Mehaffey, John
> <John_Mehaffey@mentor.com> wrote:
> > Hello All,
> >
> > I am proposing a microconference on fastboot at the Linux Plumber's conference 2013 in New Orleans. The goal is to get to sub 1S boot times for a large (IVI) system using NAND flash. This pushes the state of the art, and will require innovative solutions in may areas of Linux plumbing, including bootloader, kernel init, UBI, and systemd.
> >
> > Note that fastboot improvements will (generally) help all architectures so I am not limiting this to automotive systems.
> >
> > Please visit http://wiki.linuxplumbersconf.org/2013:fastboot for more information or if you want to submit a topic.
> >
> > If you want to reply to this message, please trim the cc list!
> 
> Why trimming the CC? Changing the CC list is a _very_ bad habit.

Thanks for the advice.

> Anyway, a few notes on UBI fastmap.
> Before we talk about optimizing it we have to make sure that it is stable.
> Currently it has not much users because embedded folks are a few
> kernel releases behind.
> I expect that we'll face some issues (hey it's software!). Instead of
> making the code more complicated we have to
> make very sure that it works well.
> Fastmap got much more complicated than I thought while developing the
> first proof of concept implementation.

This is good software practice, but is out of scope for this uconf. Fastmap will be getting more usage in the future as systems deploy using it.

I think that low-hanging fruit to speed things up, such as Brian's RB-tree lookup, can proceed in parallel with testing and stabilization (hey, it's open-source software :)

> We also have to think more about userland support, e.g. making tools
> like ubinize fastmap aware...
> User want ready to use fastmap UBI images and not images which have to
> be converted by the kernel on the very first boot.
> 
> Sharing UBI EBA table between U-Boot and the kernel would be a nice
> feature, but we also have to make sure
> that we can share the EBA table between two kernels (think of kexec).
> So, a more general solution is needed.
> 
> --
> Thanks,
> //richard

Thanks for your feedback, I agree that these are things that should also be looked at!

-mehaf
