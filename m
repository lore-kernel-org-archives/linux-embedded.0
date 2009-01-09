From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: FPGA programming driver architecture
Date: Fri, 9 Jan 2009 12:24:08 +0000
Message-ID: <88sj36-s3t.ln1@woodchuck.wormnet.eu>
References: <20081212150314.6ea24996.hugo@hugovil.com> <82ecf08e0901081414u15af3c2dy9c88a242db024dc7@mail.gmail.com> <c384c5ea0901081447i5ad807b3yb0ec3adebeaa46a0@mail.gmail.com> <200901082357.24432.florian@openwrt.org> <c384c5ea0901081507v5d186eai5ec71d56b4c7a972@mail.gmail.com> <4966C125.10604@duaneellis.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Duane Ellis <duane@duaneellis.com> wrote:
> >> [various FPGA config methods]
> 
> Don't forget JTAG, and playing back an SVF files, or BIT files.
> 
On the board we have, the FPGA is programmable over JTAG which is 
conveniently strapped to the GPIO pins of the CPU.

http://www.embeddedarm.com/products/board-detail.php?product=TS-7800

Cheers

Alex

-- 
Alexander Clouter
.sigmonster says: This screen intentionally left blank.
