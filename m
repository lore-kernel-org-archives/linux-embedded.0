From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RFC 1/3] Decompressors: Add XZ decompressor module
Date: Wed, 24 Nov 2010 14:51:18 -0800
Message-ID: <4CED96E6.70808@zytor.com>
References: <201011242251.52927.lasse.collin@tukaani.org> <20101124142549.c1b9ad14.akpm@linux-foundation.org> <4CED96A4.1080608@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4CED96A4.1080608@zytor.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lasse Collin <lasse.collin@tukaani.org>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Alain Knaff <alain@knaff.lu>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, Phillip Lougher <phillip@lougher.demon.co.uk>

On 11/24/2010 02:50 PM, H. Peter Anvin wrote:
> 
> Logically it should be an additional CONFIG option like we currently
> have for the other compression formats.
> 

And so it is (it's in the latter patches).

	-hpa
