From: "Leisner, Martin" <Martin.Leisner@xerox.com>
Subject: RE: ramfs/tmpfs for application partition
Date: Thu, 15 Jan 2009 11:55:24 -0500
Message-ID: <556445368AFA1C438794ABDA8901891C0A5A0C8E@USA0300MS03.na.xerox.net>
References: <FF584854D6FFE547AB2F7515A798AC3A045716A1B4@venus.imagineil.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <FF584854D6FFE547AB2F7515A798AC3A045716A1B4@venus.imagineil.tv>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jacob Avraham <jacob@imaginecommunications.com>, linux-embedded@vger.kernel.org

Not sure I fully understand....

You basically want two blobs -- the initramfs and the application?

You can expand the initramfs by copying to it...so you mount the application and run a script to copy it to initramfs before running it.

marty

>   -----Original Message-----
>   From: linux-embedded-owner@vger.kernel.org [mailto:linux-embedded-
>   owner@vger.kernel.org] On Behalf Of Jacob Avraham
>   Sent: Thursday, January 15, 2009 11:43 AM
>   To: linux-embedded@vger.kernel.org
>   Subject: ramfs/tmpfs for application partition
>   
>   
>   Hi,
>   
>   I have a system with 128M RAM and a flash partitioned so that 10M is
>   dedicated to initramfs image,
>   6M to application partition. And another 6M for JFFS2.
>   As I have plenty of RAM, I'd like to have my application directory
>   mounted on RAM, from a pre-populated
>   filesystem that resides in the 6M application partition.
>   So basically I want to use the same mechanism as initramfs, but mounted
>   on /my/app/partition instead of root.
>   Does it make sense? How do I go about and do that?
>   
>   
>   Jacob Avraham
>   
>   
>   
>   
>   
>   ************************************************************************
>   ************
>   This footnote confirms that this email message has been scanned by
>   PineApp Mail-SeCure for the presence of malicious code, vandals &
>   computer viruses.
>   ************************************************************************
>   ************
>   
>   
>   
>   --
>   To unsubscribe from this list: send the line "unsubscribe linux-
>   embedded" in
>   the body of a message to majordomo@vger.kernel.org
>   More majordomo info at  http://vger.kernel.org/majordomo-info.html
