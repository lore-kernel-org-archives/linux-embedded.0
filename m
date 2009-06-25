From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Thu, 25 Jun 2009 08:30:41 +0200
Message-ID: <2ea1731b0906242330t5f379322sdff9880788e9b181@mail.gmail.com>
References: <4a4254e2.09c5660a.109d.46f8@mx.google.com>
	 <4A425907.2060105@gmail.com> <4A42649D.6080509@gmail.com>
	 <20090624175943.GB6618@elf.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=PAdDozASreVScECN9apZI8c6M3F4Th3P6bpoB6guLjA=;
        b=Qh2PMksEDNFqRXNA5Ku931CPa+KZPtud/OOZ7tFnLAyr05wpiEl+L58meNu9AAHQ+5
         auZoXe6Hr2Q8MfO8qTPrueEyq8vGoATDNc3EfsUvYevbjqeJSGAXlfQ+ECdQbbU0qDQ4
         iY2wrN7OVIQ0jFYFNgpl28lweOCb4qmvLxIys=
In-Reply-To: <20090624175943.GB6618@elf.ucw.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pavel Machek <pavel@ucw.cz>
Cc: tim.bird@am.sony.com, jamie@shareable.org, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

2009/6/24 Pavel Machek <pavel@ucw.cz>:
> On Wed 2009-06-24 19:38:37, Marco wrote:
>> >>> Pavel Machek wrote:
>> >>>> On Mon 2009-06-22 14:50:01, Tim Bird wrote:
>> >>>>> Pavel Machek wrote:
>> >>>>>>> block of fast non-volatile RAM that need to access data on i=
t using a
>> >>>>>>> standard filesytem interface."
>> >>>>>> Turns a block of fast RAM into 13MB/sec disk. Hmm. I believe =
you are
>> >>>>>> better with ext2.
>> >>>>> Not if you want the RAM-based filesystem to persist over a ker=
nel
>> >>>>> invocation.
>> >>>> Yes, you'll need to code Persistent, RAM-based _block_device_.
>> >>> First of all I have to say that I'd like to update the site and =
make it
>> >>> clearer but at the moment it's not possible because I'm not the =
admin
>> >>> and I've already asked to the sourceforge support to have this p=
ossibility.
>> >>>
>> >>> About the comments: sincerely I don't understand the comments. W=
e have
>> >>> *already* a fs that takes care to remap a piace of ram (ram, sra=
m,
>> >>> nvram, etc.), takes care of caching problems, takes care of writ=
e
>> >> Well, it looks pramfs design is confused. 13MB/sec shows that cac=
hing
>> >> _is_ useful for pramfs. So...?
>> >
>> > caching problems means to avoid filesystem corruption, so dirty pa=
ges in
>> > the page cache are not allowed to be written back to the backing-s=
tore
>> > RAM. It's clear that there is a performance penalty. This penalty =
should
>> > be reduced by the access speed of the RAM, however the performance=
 are
>> > not important for this special fs as Tim Bird said, so this questi=
on is
>> > not relevant for me. If this issue is not clear enough on the web =
site,
>> > I hope I can update the information in the future.
>> >
>> >>> You are talked about journaling. This schema works well for a di=
sk, but
>> >>> what about a piece of ram? What about a crazy kernel that write =
in that
>> >>> area for a bug? Do you remember for example the e1000e bug? It's=
 not
>> >> I believe you need both journaling *and* write protection. How do=
 you
>> >> handle power fault while writing data?
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Pavel
>> >
>> > Ah now the write protection is a "needed feature", in your previou=
s
>> > comment you talked about why not use ext2/3.......
>> >
>> > Marco
>> >
>>
>> Just for your information I tried the same test with pc in a virtual=
 machine with 32MB of RAM:
>>
>> Version 1.03e =A0 =A0 =A0 ------Sequential Output------ --Sequential=
 Input- --Random-
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -Per Chr- --Block-- -Rewrite=
- -Per Chr- --Block-- --Seeks--
>> Machine =A0 Size:chnk K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec =
%CP =A0/sec %CP
>> hostname =A0 =A0 15M:1k 14156 =A099 128779 100 92240 100 11669 100 1=
66242 =A099 80058 =A082
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ------Sequential Create-----=
- --------Random Create--------
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -Create-- --Read--- -Delete-=
- -Create-- --Read--- -Delete--
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 files =A0/sec %CP =A0/sec %CP =A0/sec %C=
P =A0/sec %CP =A0/sec %CP =A0/sec %CP
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 4 =A02842 =A099 133506 104 45088=
 101 =A02787 =A099 79581 101 58212 102
>>
>> These data are the proof of the importance of the environment, workl=
oad and so on when we talk
>> about benchmark. Your consideration are really superficial.
>
> Unfortunately, your numbers are meaningless.

I don't think so.

> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
Pavel
>
> (PCs should have cca 3GB/sec RAM transfer rates; and you demosstrated
> cca 166MB/sec read rate; disk is 80MB/sec, so that's too slow. If you
> want to prove your filesystem the filesystem is reasonably fast,
> compare it with ext2 on ramdisk.)
>
This is the point. I don't want compare it with ext2 from performance
point of view. This comparison makes no sense for me. I've done this
test to prove that if you change environment you can change in a
purposeful way the results.

Marco
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
