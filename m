From: Ran Shalit <ranshalit@gmail.com>
Subject: Re: Q: file system for embedded
Date: Thu, 14 Jun 2012 15:58:31 +0300
Message-ID: <CAJ2oMhKB6684j2_ZzRopCxipnUnuu9GbACCMg08OsHBJ7u6=_g@mail.gmail.com>
References: <CAJ2oMh++ji7YBrx6UcLdhPVDmLuTZCr8kGQR8aEAYWyob_ccBQ@mail.gmail.com>
	<CAJ2oMhLpMJZ_UT1Z+12s7=5hGjRbA9WNvv3CU4m9B2rDp9yr3Q@mail.gmail.com>
	<4FD9A22B.7060207@acn-group.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=/9yfKSPDaPU0Qtj27BiYkVv32v/4fvIMhBJHV5qwEIA=;
        b=bL6TO9PsBvaAZoGZwDViHKtsy4OPhdDwif7chV4UdR6u8WWpoH+1/GaU2vVMVB/ST+
         jGX7c2WiwIRMODZ/RHGDHoIJQ00YRYbU2IqqgwYM4TxCvzG99lRFojwc5phwCk9839m6
         CnUUB1dCRLxXp/Y+w25Xyd3UfhEPGsDspo2VTw/zfDEGSmeaRtPMkbpWkNG3tphVV0F8
         PH09+GwmyRrY4Bj5+oWjUmu85roSdHeNIH2ehGRMEmMlt8lqN9kXwu9+BdW5K0NyU8p7
         jbmrXxK7OEByBDSFese921wViVdpqGwi+XAA6TuuKuPWTXCnZChKyspThRfvr4obi9Zo
         kU9w==
In-Reply-To: <4FD9A22B.7060207@acn-group.ch>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
Cc: linux-embedded@vger.kernel.org

On Thu, Jun 14, 2012 at 11:34 AM, Christophe Aeschlimann
<c.aeschlimann@acn-group.ch> wrote:
> Hi,
>
> Le 13.06.2012 23:31, Ran Shalit a =E9crit :
>
>> Hello,
>>
>> I hope you can help main understand issue of file system for embedde=
d linux.
>> I read free-electrons "Embedded Linux system development training" a=
nd
>> some of the files recommended there such as cramfs, are aceesing the
>> flash during execution of apllications. As far as I understand
>> accessing the flash after initilization is not good in embedded
>> system.
>
>
> Define not good... some applications requires write accesses to the
> flash. (how would you program music in your MP3 player ? Where do you
> store crash dumps so they are persistent across reboot ? Where do you
> store your user configurable options, etc.)
>
> There are different kinds of flash memory but each have a limited num=
ber
> of program/erase cycle so you have to use them sparingly. (e.g. make
> sure the write accesses are distributed across the chip that's called
> "wear levelling", detect when bits have toggled and correct the error
> using some extra redundancy stored in the out-of-band area of each bl=
ock
> (e.g. ECC). If the error cannot be repaired mark the block as unusabl=
e.
>
> When you access the bare memory chips then these issues are solved in
> the different layers of MTD [1] and the specific flash file system [2=
] :
> JFFS2, UBIFS, etc.
>
> If you don't access the bare memory chips e.g. you use eMMC or an SSD
> these problems are left to a dedicated controller/firmware.
>
> [1] http://www.linux-mtd.infradead.org/index.html
> [2] http://elinux.org/File_Systems
>
> Best regards,
>
> --
> Christophe Aeschlimann
>

Hi Christophe,

Thanks for the reply.
I have no need to write to flash during the main application
execution: I will program the configuration and executable before
start of execution, and after initialization there is no need to write
again to flash.
What I still do not understand is why cramfs, ubifs are recommended
for embedded if they access the flash.
Is accessing the flash not a problem in embedded linux ? What does it
mean using mlockall with cramfs ?
Regards, Ran
