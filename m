From: Nicolas Pitre <nico@cam.org>
Subject: Re: Alignment on XScale ARM
Date: Sat, 08 Nov 2008 10:37:27 -0500 (EST)
Message-ID: <alpine.LFD.2.00.0811081029500.13034@xanadu.home>
References: <1733787858@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <1733787858@web.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Marcus Tangermann <Marcus.Tangermann@web.de>
Cc: linux-embedded@vger.kernel.org

On Fri, 7 Nov 2008, Marcus Tangermann wrote:

> Hi,
> 
> we use an XScale 422 (ARM) with a big endian Linux system based on the 
> buildroot environment. It seems there is an alignment problem we have. 
> I've tracked down the problem to the following. 1. The data received 
> via a netlink communication from the kernel is stored into a buffer 
> buf. The data is correct. 2. The address of the buffer is converted to 
> a pointer to nlmsghdr:
>          struct nlmsghdr *h;
>          h = (struct nlmsghdr*) buf; 
>          printf("IPSECTOOLS: Length  %04d\n", h->nlmsg_len);
>          printf("IPSECTOOLS: Type %02d\n", h->nlmsg_type);
> The results of printf are nonsens. The first fields seem to have an 
> offset of 2 bytes, at the end there also seem to be swapped bytes. 3. 
> To test what might happen, I've created an own struct
>        struct aligntest{
>                 __u32 first;
>                 __u32 int second;
>                 __u32 third;
>                 __u32 fourth;
>        };
> When you now set a point to a buffer, again the values are wrong:
>          s1 = (struct aligntest*) buf;
>          printf("1: %08X\n", s1->first);
>          printf("2: %08X\n", s1->second);
>          printf("3: %08X\n", s1->third);
>          printf("4: %08X\n", s1->fourth);
> 
> It seems, that there is a problem with the unsigned int values. When 
> you add the attribute "packed" to the definition of struct aligntest ( 
> __attribute__(__packed__) ), all values are displayed correctly. So, 
> any hints what the problem can be?

The ARM processor traditionally cannot access misaligned short and int 
values in memory.  By using the packed attribute you tell the compiler 
that the structure should not have inserted padding to align its 
members, and that accesses are to be performed wth byte accesses and the 
value reconstructed that way.


Nicolas
