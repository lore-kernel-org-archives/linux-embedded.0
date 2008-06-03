From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: initramfs size limitation
Date: Tue, 3 Jun 2008 17:54:38 -0400
Message-ID: <8bd0f97a0806031454g6d8fe57ahca942b2a81b737aa@mail.gmail.com>
References: <4841481E.8090406@cox.net> <200806011903.47135.rob@landley.net>
	 <8bd0f97a0806011725u3dc70e2cy1b317b2b6564f5c8@mail.gmail.com>
	 <200806031559.55526.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=psMZ28biYLVSk3KhmN2Eojjd4fePIlaVL+SQPTRlObc=;
        b=mAonBFd/OUQjBYyhioM+io9htXoomZwAz8gEUSrwwAmRYwO9c91tuOE1gW//9bWzGOHVJyF7Zt4oOh07p3kG9AQpWz5AYHW8/8DiQdWQ/QK1yXuiV0RKxnkUIEo6/qGgxNKPNQaL92X14dhJlmq7Ncdd0LJAS19YHBE2hel3xQU=
In-Reply-To: <200806031559.55526.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: pwilshire@cox.net, linux-embedded@vger.kernel.org

On Tue, Jun 3, 2008 at 4:59 PM, Rob Landley wrote:
> On Sunday 01 June 2008 19:25:11 Mike Frysinger wrote:
>> On Sun, Jun 1, 2008 at 8:03 PM, Rob Landley wrote:
>> > fact it would be really nice if qemu grew blackfin support because
>> > messing
>>
>> i imagine it would be ... too bad qemu lacks real documentation
>
> Actually there was documentation on the old stuff if you knew where to dig it
> up (a good starting point was Fabrice's old usenix paper and then I had some
> links I'd collected from there)

yes, but spotiness doesnt help

> but they just ripped out the old code
> generator in favor of a new one
> (See http://lists.gnu.org/archive/html/qemu-devel/2008-02/msg00011.html ) so
> there's not much point in going there right now.  (Hopefully they'll have a
> 1.0 release within our lifetimes.)

i'm aware the tcg stuff exists, but that's about it.  only hope for
new ports atm is to contract a qemu guy.  not that the qemu guys would
mind.  thanks for the link.
-mike
