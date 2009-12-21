From: alucero@os3sl.com
Subject: Re: CELF Project Proposal - Feasibility analisys of Android 
	introduction in a completely tested industrial device
Date: Mon, 21 Dec 2009 10:55:45 +0100
Message-ID: <20091221105545.uy83h4mw84sswkko@webmail.os3sl.com>
References: <ade1bdc0912180814m7fd3c02cp7d99a1943c2da37e@mail.gmail.com>
	<ade1bdc0912190746h320ef36fpc01f3976d78aae65@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <ade1bdc0912190746h320ef36fpc01f3976d78aae65@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes	format=flowed"
To: CE Linux Developers List <celinux-dev@tree.celinuxforum.org>, linux-embedded <linux-embedded@vger.kernel.org>, elc10@tree.celinuxforum.org

I'm more interested in the debugging part based on QEMU than in =20
Android but I can see the importance Android is going to have in the =20
future.

I have been using QEMU for some embedded projects and for linux =20
embedded teaching. Having a wider micro/cpu coverage plus devices with =
=20
QEMU would be a great thing.

At this point I'm working in a QEMU port and I'd like to contribute in =
=20
the general effort to have QEMU as a main tool for embedded Linux.

Raffaele Recalcati <lamiaposta71@gmail.com> ha escrito:

> 2009/12/18 Raffaele Recalcati <lamiaposta71@gmail.com>:
>> Summary: Feasibility analisys of Android introduction in a completel=
y
>> tested industrial device.
>>
>> Description: By now Android has been ported to 600Mhz Cortex A8 cpu =
=20
>>  or similar.
>> The declared Android requirements are instead lower, about 200Mhz Ar=
m9
>> cpu with 100Mhz Ram bus.
>> So I think the growing interest in this O.S. lacks some porting to
>> less powerful cpus.
>> The reasons to do this porting are commercial because of Google mark=
et
>> power, but are also technnical, because Android debugging environmen=
t
>> is very nice for not embedded developers.
>> This could help the diffusion of opensource embedded Linux.
>>
>> The porting will be maybe against the 2.6.31 kernel for pxa270.
>> The idea is to preserve industrial tested development but adding
>> Android graphical interface.
>>
>> The cpu dependency of the porting will be as small as possible.
>>
>> Related work:
>> =A0* Android Porting - http://www.kandroid.org/<wbr></wbr>android_pd=
k/
>> =A0* Android Pxa270 - http://android-pxa270.sourceforge.net/
>>
>> Scope:
>> This should take more than 1 month for feasibility analysis.
>>
>>
>> --
>
>
> Anybody can give me his idea about this proposal?
> Thx
>
> Bye,
> Recalcati
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

