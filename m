From: Lasse Collin <lasse.collin@tukaani.org>
Subject: XZ (LZMA2) decoder
Date: Sun, 22 Mar 2009 15:57:33 +0200
Message-ID: <200903221557.33588.lasse.collin@tukaani.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

(Please CC your replies to me, I'm not on the list.)

An initial version of the .xz file format decoder for Linux is now 
available at <git://ctrl.tukaani.org/xz-embedded.git>. It supports both 
stateful and single-call decoding using the LZMA2 algorithm.

Two buffers (1.2 KiB and 28 KiB) are allocated with kmalloc() for 
internal data. For stateful decoding, also a dictionary is allocated 
with vmalloc(), which probably will usually be from 64 KiB to 1 MiB. The 
dictionary is allocated when the decoder is created, so the decoder 
never allocates memory in the middle of decoding. This means that if the 
preallocated dictionary was too small for the input stream, decoding 
will fail. In single-call mode, the destination buffer is used as the 
dictionary, thus a separate dictionary doesn't need to be allocated.

On x86, xz_dec.ko is 11-14 KiB. Stack usage is around 120-240 bytes, 
depending on the GCC version and compiler flags. I hope it is not too 
much, but I can try to reduce it slightly if needed.

BCJ filters are not added yet. They will increase the code size a little 
but they should save more space by increasing compression ratio of 
executables (and naturally it will be possible to disable these filters 
in the kernel config).

There is some code (mostly in xz_boot.c), which hopefully makes it 
easier to add support for XZ compressed kernel and initramfs. I hope 
that someone else does the actual work to get XZ support in the arch-
specific trees (IIRC, there were some patches to add bzip2 and LZMA 
support already), but I'm happy to help if my code needs some 
adjustments to support that work.

I have tried to follow to the kernel coding style as well as I can, but 
if there are style issues that should be fixed, please let me know. I 
want to keep the code usable outside Linux, which why there are some 
extra #ifdefs and such. I hope this is OK.

I haven't tested the code much yet. It appears to work in userspace. The 
kernel module compiles cleanly on x86, but I haven't tested it in kernel 
space, because I currently have no code to feed data to the XZ decoder 
in the kernel space.

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
