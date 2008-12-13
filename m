From: Florian Fainelli <florian@openwrt.org>
Subject: Re: FPGA programming driver architecture
Date: Sat, 13 Dec 2008 13:58:01 +0100
Message-ID: <200812131358.03010.florian@openwrt.org>
References: <20081212150314.6ea24996.hugo@hugovil.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version
         :content-disposition:content-type:content-transfer-encoding
         :message-id;
        bh=+1FJUuBX7toyUwcK4hXi/TywxwX2smKMDTurkq0sx2M=;
        b=fBH7unhupsHfr2quHwG436f2k7E9uuk9nT6ZocYk2uGZb/UE97dxuHISC4UuSKy0JN
         cx9eyhfVii8dkJMfDuG5HlyVgDxbk5qWTsefQj/AvNHDA3DjxLrCYLukr07hqWH6MZTY
         w+jS8obv2cs0kWlA1XUry2Sjoweti3hr0O/M8=
In-Reply-To: <20081212150314.6ea24996.hugo@hugovil.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

(CC'ing linux-embedded)

Salut Hugo,

Le Friday 12 December 2008 21:03:14 Hugo Villeneuve, vous avez =E9crit=A0=
:
> Hi,
> I have written some code to program a FPGA in Linux, for two differen=
t
> types of boards: one uses a serial interface (SPI) and the second a
> parallel interface. I have been able to sucessfully program both boar=
ds.
> I'm now trying to clean my code and make it more generic, as well as =
better
> in line with the Linux driver model. I would also like to include it =
in the
> mainline kernel if there is interest.

Is it a platform-driver ? What do you provide in platform_data ?

>
> Here is a description of the current architecture (refer to diagrams
> below): The fpgaload module controls one output GPIOs (PROG), and two=
 input
> GPIOs (INIT and DONE). These GPIOs are specified in board setup code.=
 Both
> fpgaload_ser and fpgaload_par modules export a single function to wri=
te a
> byte. The fpgaload driver is a char device to which we can write
> (/dev/fpgaload) to program a bitstream (FPGA firmware) inside the FPG=
A.=20

You should probably consider using request_firmware to load the bitstre=
am from=20
the userspace and possibly add a /sys interface to export some attribut=
es=20
like :

- GPIOs being used between the host and the FPGA
- status (i.e : programmed, not programmed ...)
- FPGA vendor, type ...

> The=20
> fpgaload driver will toggle the GPIOs to initiate programming and the=
 then
> call the corresponding write_byte function based on the interface typ=
e
> specified in board setup code (serial or parallel, or any future inte=
rface
> desired).

> The problem with that approach is that when loading the fpgaload modu=
le
> with modprobe, it will automatically try to load the fpgaload_ser and
> fpgaload_par modules, even if only serial interface was specified in =
board
> setup code for example. This is not good when building a kernel for s=
imilar
> but different boards.

What about something like that :

- fpgaload-core which contains all the code that can be shared between =
the=20
drivers like requesting firmware, providing sysfs attributes,=20
- fpgaload-spi would handle the low-level SPI connection
- fpgaload-par would handle the low-level parallel connection

fpgaload-ser and par would register with fpgaload-core and they could r=
egister=20
a fpga loading callback which is low-level specific for instance. Platf=
orm=20
code would instantiate the core driver. That way, adding support for ot=
her=20
loading protocols like slave serial or master serial can be done easily=
=2E

>
> Probably a better approach would be for the fpgaload_Ser and fpgaload=
_par
> modules to register themselves with the fpgaload module. Then, should=
 the
> fpgaload module be built using a BUS driver structure? Or anyone havi=
ng any
> suggestions on how it should be implemented?
--=20
Best regards, Florian Fainelli
Email : florian@openwrt.org
http://openwrt.org
-------------------------------
