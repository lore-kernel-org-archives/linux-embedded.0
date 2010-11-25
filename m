From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH RFC 2/3] Decompressors: Add boot-time XZ support
Date: Thu, 25 Nov 2010 07:06:25 +0000
Message-ID: <4CEE0AF1.7030208@lougher.demon.co.uk>
References: <201011242254.41176.lasse.collin@tukaani.org> <4CEE02EE.1050102@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4CEE02EE.1050102@lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Lasse Collin <lasse.collin@tukaani.org>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alain Knaff <alain@knaff.lu>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, Andrew Morton <akpm@linux-foundation.org>

On 25/11/10 06:32, Phillip Lougher wrote:
>> +
>> + for (i = 0; i< size; ++i)
>
> The kernel uses either "i < size" or "i<size" ...
>

Disregard these, looks like my email client (Mozilla Thunderbird)
is eating spaces... Very odd

>> + if (fill == NULL&& flush == NULL) {
>

and this.
