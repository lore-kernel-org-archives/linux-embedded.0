From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: XZ (LZMA2) decoder
Date: Thu, 26 Mar 2009 15:34:41 +0200
Message-ID: <200903261534.41887.lasse.collin@tukaani.org>
References: <200903221557.33588.lasse.collin@tukaani.org> <c384c5ea0903251439k2ba46bffq729c013a48e2d6b9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <c384c5ea0903251439k2ba46bffq729c013a48e2d6b9@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Cc: linux-embedded@vger.kernel.org

On 2009-03-25 Leon Woestenberg wrote:
> Is this something the linux-embedded community must pick up, or maybe
> even the LKML?

In December, there was some discussion on linux-embedded about getting 
LZMA decoder into Linux. I understood that some of the existing patches 
had trouble meeting the kernel quality standards. There were also 
requirements like support for multi-call decoding, which should be 
useful at least in Squashfs. I promised to write a nice-looking .xz file 
format decoder for Linux (.xz will replace the .lzma format) and post to 
linux-embedded when I have something to show.

Assuming there still is interest like there was in December, hope I will 
get some feedback to know if my code looks promising and possibly how it 
should be improved to be good for in-kernel use. This is my first Linux 
kernel related coding project, so there probably are things (other than 
plain bugs) that need to be fixed before the code can be considered for 
inclusion.

If linux-embedded is not the best list for this, I can post to LKML too. 
However, since I promised to post at least to linux-embedded, and the 
discussion on this list in December was very helpful for me to 
understand what is required from an in-kernel decompressor, starting a 
new discussion first on linux-embedded sounded obvious to me.

Stable userspace tools to handle .xz files are still not available. I 
simply haven't worked on them much in the past two months. I naturally 
hope to get the stable release out soon, but my ability work on these 
projects depends on a couple of other things in my life, so it's better 
I don't promise anything detailed. On the positive side, the latest XZ 
Utils beta should be quite good already.

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
