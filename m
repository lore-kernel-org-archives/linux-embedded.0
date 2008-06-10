From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 16:01:39 +0200
Message-ID: <20080610140139.9817F2430C@gemini.denx.de>
References: <87a5b0800806100647r178e54c0qd34cbf26f6ce24d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: Your message of "Tue, 10 Jun 2008 14:47:20 BST."
             <87a5b0800806100647r178e54c0qd34cbf26f6ce24d@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Will Newton <will.newton@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Jamie Lokier <jamie@shareable.org>, Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

In message <87a5b0800806100647r178e54c0qd34cbf26f6ce24d@mail.gmail.com> you wrote:
>
> I would be surprised if it was possible to compile Linux with gcc 4.2
> with 32MiB of total system memory.

Hint: if memory really gets tight, you can use swap space. Either  to
a  local  drive  (either through PCI or PCMCIA/PCCard or USB or FW or
...), or over the network. This just adds  another  level  of  stress
testing  to  areas in the kernel that are not so well covered by some
other tests.

Guess who found out that swap on MPC8xx was broken for  a  long,  long
time, and how it was detected?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
You Don't Have To Be 'Damned' To Work Here, But It Helps!!!
                                             - Terry Pratchett, _Eric_
