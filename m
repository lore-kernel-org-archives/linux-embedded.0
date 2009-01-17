From: Marco <marco.stornelli@coritel.it>
Subject: Re: ramfs/tmpfs for application partition
Date: Sat, 17 Jan 2009 16:55:18 +0100
Message-ID: <4971FF66.6080709@coritel.it>
References: <FF584854D6FFE547AB2F7515A798AC3A045716A1B4@venus.imagineil.tv> <556445368AFA1C438794ABDA8901891C0A5A0C8E@USA0300MS03.na.xerox.net> <FF584854D6FFE547AB2F7515A798AC3A045716A1F8@venus.imagineil.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <FF584854D6FFE547AB2F7515A798AC3A045716A1F8@venus.imagineil.tv>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jacob Avraham <jacob@imaginecommunications.com>
Cc: "Leisner, Martin" <Martin.Leisner@Xerox.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hi Jacob,

only another idea, why do you think to use a persistant ram filesystem
(like pramfs) mounted on /my/application/partition? If you use a simple
ram you can repopulate after a power off/on the directory with a simple
untar of the archive. In this way you haven't to repopulate the
filesystem after each reboot. What do you think about it? Could it be a
solution?

Marco

Jacob Avraham ha scritto:
>> Not sure I fully understand....
>>
>> You basically want two blobs -- the initramfs and the application?
>>
> Yes, I want to keep on the flash a stable, rarely changed, OS image, which is in initramfs
> format, and another application image, which is changing frequently.
> 
>> You can expand the initramfs by copying to it...so you mount the
>> application and run a script to copy it to initramfs before running it.
>>
> When you say 'you mount the application' it means that the application
> image on the flash has to be in some filesystem format, right? Like cramfs?
> On the other hand, if I want the application directory tree to reside
> in memory (and handle application persistency needs via the JFFS2 partition),
> maybe all I need is to keep a compressed tar image of the application on the flash,
> and untar it into /my/application/partition, which will be in initramfs?
> So I don't need to create another tmpfs filesystem as suggested in another post?
> Is there a better way to handle this?
> 
>> marty
>>
>>>   Hi,
>>>
>>>   I have a system with 128M RAM and a flash partitioned so that 10M
>> is
>>>   dedicated to initramfs image,
>>>   6M to application partition. And another 6M for JFFS2.
>>>   As I have plenty of RAM, I'd like to have my application directory
>>>   mounted on RAM, from a pre-populated
>>>   filesystem that resides in the 6M application partition.
>>>   So basically I want to use the same mechanism as initramfs, but
>> mounted
>>>   on /my/app/partition instead of root.
>>>   Does it make sense? How do I go about and do that?
>>>
>>>
>>>   Jacob Avraham
>>>
> 
> 
> 
>  
>  
> ************************************************************************************
> This footnote confirms that this email message has been scanned by
> PineApp Mail-SeCure for the presence of malicious code, vandals & computer viruses.
> ************************************************************************************
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
