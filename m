From: Wolfgang Denk <wd@denx.de>
Subject: Re: building Rootfs
Date: Tue, 08 Jul 2008 16:00:34 +0200
Message-ID: <20080708140034.B2B7424681@gemini.denx.de>
References: <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: Your message of "Mon, 07 Jul 2008 18:24:48 CDT."
             <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Haller, John H (John)" <jhaller@alcatel-lucent.com>
Cc: Linus Walleij <linus.ml.walleij@gmail.com>, linux-embedded@vger.kernel.org

In message <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com> you wrote:
>
> There are three issues in building an embedded cross-filesystem:
> 1. Identification of the files to put into the filesystem.
> 2. Stripping or extracting debug symbols from the filesystem.
> 3. Getting files into the filesystem when the development
> system does not allow root access.

3. is a non-issue for most common file systems.

> The third item is easy for an initramfs, but not well handled
> by existing tools for an initrd (although I haven't looked
> recently). One possibility is to modify a mkfs program, such

genext2fs has been around for a long, long time.

And there are similar tools for other file system types  like  cramfs
or jffs2 ...

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
The human race is a race of cowards; and I am not  only  marching  in
that procession but carrying a banner.                   - Mark Twain
