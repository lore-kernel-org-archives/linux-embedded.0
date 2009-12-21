From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 0/9] Squashfs: Add support for LZMA compressed filesystems
Date: Mon, 21 Dec 2009 23:47:30 +0000
Message-ID: <4B300912.5060905@lougher.demon.co.uk>
References: <E1NHZ6K-00029J-Sw@dylan.lougher.demon.co.uk> <20091221231645.GA32141@wolff.to>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20091221231645.GA32141@wolff.to>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bruno Wolff III <bruno@wolff.to>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com

Bruno Wolff III wrote:
> On Mon, Dec 07, 2009 at 08:37:48 +0000,
>   Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
>> Hi,
>>
>> The following patches add LZMA decompression support to Squashfs, using the
>> in-kernel LZMA decompression library.
> 
> Do these still have a chance to make 2.6.33?
> 

It's very unlikely.  Andrew wanted it to spend a cycle in linux-next.  I'll then
try for 2.6.34 merge.  I'm happy with that.

Phillip

