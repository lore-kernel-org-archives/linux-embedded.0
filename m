From: Jacob Avraham <jacob@imaginecommunications.com>
Subject: ramfs/tmpfs for application partition
Date: Thu, 15 Jan 2009 18:43:17 +0200
Message-ID: <FF584854D6FFE547AB2F7515A798AC3A045716A1B4@venus.imagineil.tv>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>


Hi,

I have a system with 128M RAM and a flash partitioned so that 10M is dedicated to initramfs image,
6M to application partition. And another 6M for JFFS2.
As I have plenty of RAM, I'd like to have my application directory mounted on RAM, from a pre-populated
filesystem that resides in the 6M application partition.
So basically I want to use the same mechanism as initramfs, but mounted on /my/app/partition instead of root.
Does it make sense? How do I go about and do that?


Jacob Avraham



 
 
************************************************************************************
This footnote confirms that this email message has been scanned by
PineApp Mail-SeCure for the presence of malicious code, vandals & computer viruses.
************************************************************************************


