From: "Will Newton" <will.newton@gmail.com>
Subject: Re: Alignment on XScale ARM
Date: Sat, 8 Nov 2008 14:22:26 +0000
Message-ID: <87a5b0800811080622o1210d77et802e678847d48c88@mail.gmail.com>
References: <1733787858@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=NrpP4QEdQCullCOwTUwCCrX4iUcDUX0WPtADKXvjbhM=;
        b=v3T7D36LoyTslSdO0CHGdnGZnQDnQE2wmQpb4qXjad81hCOAe2NeyboMmMu9O3dinJ
         YE7eAu922cI4O8tfszrw3Dbmou/KbdatXljeI5PNqgG00XPN6CI0TITsOrDgPr7GDV7Z
         qq7RbLR6oDp0OEm3p4g6Yo14I0Y8ZJmEEAhY4=
In-Reply-To: <1733787858@web.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marcus Tangermann <Marcus.Tangermann@web.de>
Cc: linux-embedded@vger.kernel.org

On Fri, Nov 7, 2008 at 10:52 PM, Marcus Tangermann
<Marcus.Tangermann@web.de> wrote:
> Hi,
>
> we use an XScale 422 (ARM) with a big endian Linux system based on the buildroot environment. It seems there is an alignment problem we have. I've tracked down the problem to the following.
> 1. The data received via a netlink communication from the kernel is stored into a buffer buf. The data is correct.
> 2. The address of the buffer is converted to a pointer to nlmsghdr:
>         struct nlmsghdr *h;
>         h = (struct nlmsghdr*) buf;
>         printf("IPSECTOOLS: Length  %04d\n", h->nlmsg_len);
>         printf("IPSECTOOLS: Type %02d\n", h->nlmsg_type);
>   The results of printf are nonsens. The first fields seem to have an offset of 2 bytes, at the end there also seem to be swapped bytes.
> 3. To test what might happen, I've created an own struct
>       struct aligntest{
>                __u32 first;
>                __u32 int second;
>                __u32 third;
>                __u32 fourth;
>       };
>     When you now set a point to a buffer, again the values are wrong:
>         s1 = (struct aligntest*) buf;
>         printf("1: %08X\n", s1->first);
>         printf("2: %08X\n", s1->second);
>         printf("3: %08X\n", s1->third);
>         printf("4: %08X\n", s1->fourth);
>
> It seems, that there is a problem with the unsigned int values. When you add the attribute "packed" to the definition of struct aligntest ( __attribute__(__packed__) ), all values are displayed correctly.
> So, any hints what the problem can be?

I'm not sure what the problem is? You can't generally misalign a
struct pointer safely.
