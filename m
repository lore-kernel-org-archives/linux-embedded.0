From: "Alan C. Assis" <acassis@gmail.com>
Subject: Re: File system robustness
Date: Tue, 18 Jul 2023 09:56:34 -0300
Message-ID: <CAG4Y6eQX8wE6ErByZmWFN+a_ekR09q8NzP+jJyEey4Ficqdosg@mail.gmail.com>
References: <20230717075035.GA9549@tomerius.de> <CAG4Y6eTU=WsTaSowjkKT-snuvZwqWqnH3cdgGoCkToH02qEkgg@mail.gmail.com>
 <20230718053017.GB6042@tomerius.de>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689684995; x=1692276995;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a+0X0iJnqmGwLeZZKHvvTwxTTecPY5lyxNZQeh8dZFg=;
        b=hHDnz9GZY3LbhcWhRmlM9JlzfhIK4dF9EukEMjKsJeBsjHumsWBQHWfgm32KZbUETq
         rAhsK1Hle/ygFwxyHxlBXRLC/M36rAkGU1Z+hEjI8aZniAiQPsB4tOfjo3B8U5sO1hnZ
         gHyqZiSYhekBWbM1B1nyIuMhXyIc8X8RGxROx65S1POnb9oDFV6/vTs1FV94sOhgNg+i
         V+baPhFCkRxFHyVX2dk+CnxzLPohwNsErlpff9ivGVp1R2Izl7ObfN83ApIMSuIvTtoY
         Ggl/EVVnTKasoOH3MKTtpBV4llo5rHVHqnTV/daaBzGIGASIs6I1g/HGiqY+zS95Xsm1
         0PjA==
In-Reply-To: <20230718053017.GB6042@tomerius.de>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kai Tomerius <kai@tomerius.de>
Cc: linux-embedded@vger.kernel.org, Ext4 Developers List <linux-ext4@vger.kernel.org>, dm-devel@redhat.com

Hi Kai,

I never used that, but please take a look at F2FS too.

BR,

Alan

On 7/18/23, Kai Tomerius <kai@tomerius.de> wrote:
> Hi Alan,
>
> thx a lot.
>
> I should have mentioned that I'll have a large NAND flash, so ext4
> might still be the file system of choice. The other ones you mentioned
> are interesting to consider, but seem to be more fitting for a smaller
> NOR flash.
>
> Regards
> Kai
>
>
>
> On Mon, Jul 17, 2023 at 10:50:50AM -0300, Alan C. Assis wrote:
>> Hi Kai,
>>
>> On 7/17/23, Kai Tomerius <kai@tomerius.de> wrote:
>> > Hi,
>> >
>> > let's suppose an embedded system with a read-only squashfs root file
>> > system, and a writable ext4 data partition with data=journal.
>> > Furthermore, the data partition shall be protected with dm-integrity.
>> >
>> > Normally, I'd umount the data partition while shutting down the
>> > system. There might be cases though where power is cut. In such a
>> > case, there'll be ext4 recoveries, which is ok.
>> >
>> > How robust would such a setup be? Are there chances that the ext4
>> > requires a fsck? What might happen if fsck is not run, ever? Is there
>> > a chance that the data partition can't be mounted at all? How often
>> > might that happen?
>> >
>>
>> Please take a look at this document:
>>
>> https://elinux.org/images/0/02/Filesystem_Considerations_for_Embedded_Devices.pdf
>>
>> In general EXT4 is fine, but it has some limitation, more info here:
>> https://opensource.com/article/18/4/ext4-filesystem
>>
>> I think Linux users suffer from the same problem we have with NuttX (a
>> Linux-like RTOS): which FS to use?
>>
>> So for deep embedded systems running NuttX I follow this logic:
>>
>> I need better performance and wear leveling, but I don't need to worry
>> about power loss: I choose SmartFS
>>
>> I need good performance, wear leveling and some power loss protection:
>> SPIFFS
>>
>> I need good performance, wear leveling and good protection for
>> frequent power loss: LittleFS
>>
>> In a NuttShell: There is no FS that 100% meets all user needs, select
>> the FS that meets your core needs and do lots of field testing to
>> confirm it works as expected.
>>
>> BR,
>>
>> Alan
>
