From: Leon Pollak <leonp@plris.com>
Subject: U-Boot <-> Kernel; NAND operation proposal
Date: Wed, 04 Dec 2013 18:39:48 +0200
Message-ID: <18990519.GPctzMhBYx@leonp.plris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hello, all.

I beg your pardon ahead for possible stupidity and inconsistency of what 
I am going to say - this may be simply because of the lack of 
experience. Below is my story and proposal as the result.

During the last 2 years, my product, which is based on DM368 (ARM7 based 
TI CPU) and Micron's NAND flashes (256MiB, 2K page) behaves unstably. 
This means that some units from time to time refuse to boot for 
different reasons.

Today, after so long time and so many corrections, I can say that most 
of the problems (not all!), which lead to the unit unable to start to 
the end (to the application) where because of the incompatible modes of 
NAND operating between u-boot and kernel.

For example, in the configuration I started from, which was supplied by 
some vendor as evaluation board, u-boot was configured to use 4-bit HW 
ECC, while kernel used 1-bit SW ECC.

The OOB layouts used in both systems were different.
Also BBT were configured differently.

There were several other "small things", which combination was 
inconsistent and produced the incorrect NAND functioning, which finally 
in some cases made the unit inoperative.

--

The major issue here is that such inconsistencies are not manifested in 
some way, until the unit suddenly refuse to boot up after 2 weeks or 2 
years.

All this lead me to the following thought (very draftly):

Each NAND has the "spare free" area in the first (zero) block, which is 
used for storing CIS information. This information does not occupy all 
the block, which usually is several hundreds of kilobytes.
So, this "spare" place may be used for storing some descriptive 
information of ALL possible NAND flash and its service parameters.
I am speaking about ECC bits, Sw/HW, OOB layout, BBT layout, patter 
places, bad block marks, and everything else you can imagine.

Further, this information must be used both by u-boot and kernel. Or 
even by other components, for example, RBL/UBL in DM36x from TI.

Thanks to all who read this.
Best Regards
-- 
Leon Pollak
