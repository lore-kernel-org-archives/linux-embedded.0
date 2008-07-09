From: Wolfgang Denk <wd@denx.de>
Subject: Re: building Rootfs
Date: Wed, 09 Jul 2008 08:21:39 +0200
Message-ID: <20080709062139.1510424304@gemini.denx.de>
References: <63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: Your message of "Wed, 09 Jul 2008 01:53:46 +0200."
             <63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-embedded@vger.kernel.org

In message <63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com> you wrote:
> 
> >> 3. Getting files into the filesystem when the development
> >> system does not allow root access.
> 
> > 3. is a non-issue for most common file systems.
> 
> The only one thing I ever ran into trouble with was device nodes,

No, this is not a problem.

> these cannot be reproduced any way, not even with fakeroot

Most tools support a "device table", i. e. a plain text file
describing needed device nodes, owners, permissions etc., so no root
permissins are needed.

For details please see
http://www.denx.de/wiki/view/DULG/RootFileSystemOnARamdisk

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Beware of the Turing Tar-pit in  which  everything  is  possible  but
nothing of interest is easy.
