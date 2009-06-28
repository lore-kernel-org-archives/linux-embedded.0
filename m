From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Sun, 28 Jun 2009 19:33:02 +0200
Message-ID: <4A47A94E.4020808@gmail.com>
References: <4a4254e2.09c5660a.109d.46f8@mx.google.com> <4A425907.2060105@gmail.com> <4A42649D.6080509@gmail.com> <20090624175943.GB6618@elf.ucw.cz> <2ea1731b0906242330t5f379322sdff9880788e9b181@mail.gmail.com> <20090628085932.GA20169@elf.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=qF5XVnWRBZEqzfFinCbtyyfoS//RkBbYwP+GjcQvgRs=;
        b=W/3cDR+HoT3JW9dSixdXRjp4gweFKSs7D/WuV8WzyoTieCjD20RuS/8iM6nv/UHeGo
         z7Wo8IafgDAGEDQaDVy+lPACEc7SySCfm5T8SXGtxizYARzzGTrpzDWmeOMKwZKFHmYB
         qM0nAEk65flbhEJmtoY1cb0Jcl3lDxo450ceM=
In-Reply-To: <20090628085932.GA20169@elf.ucw.cz>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: tim.bird@am.sony.com, jamie@shareable.org, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Pavel Machek wrote:
>>>>> Ah now the write protection is a "needed feature", in your previous
>>>>> comment you talked about why not use ext2/3.......
>>>>>
>>>>> Marco
>>>>>
>>>> Just for your information I tried the same test with pc in a virtual machine with 32MB of RAM:
>>>>
>>>> Version 1.03e       ------Sequential Output------ --Sequential Input- --Random-
>>>>                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
>>>> Machine   Size:chnk K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
>>>> hostname     15M:1k 14156  99 128779 100 92240 100 11669 100 166242  99 80058  82
>>>>                     ------Sequential Create------ --------Random Create--------
>>>>                     -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
>>>>               files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
>>>>                   4  2842  99 133506 104 45088 101  2787  99 79581 101 58212 102
>>>>
>>>> These data are the proof of the importance of the environment, workload and so on when we talk
>>>> about benchmark. Your consideration are really superficial.
>>> Unfortunately, your numbers are meaningless.
>> I don't think so.
>>
>>> (PCs should have cca 3GB/sec RAM transfer rates; and you demosstrated
>>> cca 166MB/sec read rate; disk is 80MB/sec, so that's too slow. If you
>>> want to prove your filesystem the filesystem is reasonably fast,
>>> compare it with ext2 on ramdisk.)
>>>
>> This is the point. I don't want compare it with ext2 from performance
>> point of view. This comparison makes no sense for me. I've done this
>> test to prove that if you change environment you can change in a
>> purposeful way the results.
> 
> Yes, IOW you demonstrated that the numbers are machine-dependend and
> really meaningless.
> 
> ext2 comparison would tell you how much pramfs sucks (or not).
> 									Pavel

Here the test with ext2 (same environment):

Version 1.03e       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine   Size:chnk K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
hostname     15M:1k 10262  83 40847  82 38574  82  9866  92 62252  98 25204  81
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                  1 19859  98 44804  61 68830 100 13566  99 157129 100 30431  98

Marco
