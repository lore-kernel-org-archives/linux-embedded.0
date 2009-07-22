From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 3/5] Add support for LZO-compressed kernels
Date: Wed, 22 Jul 2009 09:08:31 -0700
Message-ID: <4A67397F.8080705@zytor.com>
References: <0022152d7fe9b6dbcf046f4d04a6@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753557AbZGVQcb@vger.kernel.org>
In-Reply-To: <0022152d7fe9b6dbcf046f4d04a6@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: kevin.granade@gmail.com
Cc: Albin Tonnerre <albin.tonnerre@free-electrons.com>, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

kevin.granade@gmail.com wrote:
>  >
>  > So for a compression ratio that is still relatively close to gzip, it's
>  > much faster to extract, at least in that case.
> 
> Is that "time to run the extraction algorithm", or "time to read in 
> image from media and extract"? I think the time to read from the media 
> would tend to dominate the decompression time.
> Either way, could you provide the other time for each algorithm in order 
> to give a sense of how this might scale to other CPU speeds/media read 
> speeds?
> 

If you have very slow media, you probably want to use LZMA.  If you have 
a very slow CPU and comparatively fast media, LZO might be a good 
option... I have heard people asking for *uncompressed* kernels for this 
reason, but LZO runs at a significant fraction of memcpy() speed.

	-hpa
