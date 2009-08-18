From: Wolfgang Denk <wd@denx.de>
Subject: architecture-independent I/o accessors
Date: Tue, 18 Aug 2009 23:07:01 +0200
Message-ID: <20090818210701.84125833DBD2@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-embedded@vger.kernel.org

Dear Arnd,

Josh Boyer suggested you might provide some insight...

I'm currently looking for a solution how to provide architecture
independent I/O accessor functions to U-Boot. In the past, lots of
code used direct pointer accesses, relying on the idea that "volatile"
would be sufficient to convince the compiler and the hardware to do
what was expected; some architectures (like ARM and others) used
readl() / writel(), while others (like PPC) used in_8, in_le16,
in_be16, in_le32, in_be32, in_le64, in_be64 etc.

As we like to borrow code from Linux, I'm trying to find out what the
big plan for Linux is.

My understanding is that in Linux the ioreadX() / iowriteX() /
ioreadXbe() / iowriteXbe() functions are supposed to provide
architecture independent I/O accessors, and that the plain ioreadX()
/ iowriteX() functions (without the "be") are always guaranteed to be
little-endian on all architectures, while the "be" functions are,
well, big-endian.  Is this understanding correct?

If yes, does that mean that in the future we will see more Linux code
using ioreadX[be]() / iowriteX[be]()? So far I did not find much
hints that support this aproach - only memory-barriers.txt has only a
short sentence about these functions, with basicly no explanation.


What I liked from the in_[le]X() / out_[le]X() accessors on PPC was
that they allowed for type checking - the compiler would raise a
warning when you used in_[le]16() to read from a 32 bit wide register.
However, ioreadX[be]() / iowriteX[be]() use a void * "iomem cookie",
so no type checking can be done.


Basicly I have two questions:

1) Can you make a statement which direction Linux is heading to?
   Will more (new) code use ioreadX() / iowriteX()?

2) What would be your recommendation what we should do in U-Boot?
   Provide for all architectures in_8, in_le16, in_be16, in_le32,
   in_be32, in_le64, in_be64 etc. similar to what we have for the
   Power architecture, well knowing that Linux will not follow that
   route, or use ioreadX[be]() / iowriteX[be]() which does not provide
   type checking, and which eventually does not find wider use in
   Linux either? Or even something else - like ioreadX[be]() /
   iowriteX[be]() with type checking added?

Thanks in advance.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
The ideal situation is to have massive computing power right at home.
Something that dims the streetlights and shrinks the picture  on  the
neighbours' TVs when you boot it up.
