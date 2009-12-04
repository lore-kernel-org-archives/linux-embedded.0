From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Fri, 4 Dec 2009 11:34:25 +0000
Message-ID: <1n8nu6-4va.ln1@chipmunk.wormnet.eu>
References: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756164AbZLDMIb@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-embedded@vger.kernel.org

Linus Walleij <linus.walleij@stericsson.com> wrote:
> 
> [snipped]
> 
> Is probably not very elegant. (Or is it?) Would it be permissible to
> pass in a table like:
> 
> cat >/sys/.../v_vs_cap <<EOF
> x0,y0
> x1,y1
> x2,y2
> EOF
> 
> And have the kernel parse x,y pairs up to EOF?
> 
> Or would it be preferable to do this thing by creating some
> misc device node like /dev/battery0 and a custom ioctl()?
> 
> Or is there some other way I haven't thought of?
> 
Although I'm a 'nobody' I would probably go for:
----
echo x0,y0:x1,y1:....
----

Pairs are seperated by ':' whilst values with ','.  I guess you could 
just use comma's all the way but I personally say that reduces 
readability...also means that maybe one day you want to pass only one or 
three values...the format could still work.

Easy to parse, a one liner, no fixed length, fits in with the existing 
use, etc etc.

Cheers

-- 
Alexander Clouter
.sigmonster says: You'll be sorry...
