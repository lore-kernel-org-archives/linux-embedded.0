From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Wed, 18 Jun 2008 09:08:16 -0700
Message-ID: <485932F0.5050108@am.sony.com>
References: <48580116.9070504@am.sony.com> <4858A659.8030502@codefidence.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4858A659.8030502@codefidence.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilad Ben-Yossef <gilad@codefidence.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

Gilad Ben-Yossef wrote:
> This may sound like a stupid question, but why are you compiling the
> modules statically?
> 
> I mean, it sounds to me like the perfect way to do what you want is to
> compile the modules dynamically (you can store them in a an in kernel
> initramfs if you want to keep them attached to the kernel binary for
> ease of maintenance) and simply call a script that calls modprobe when
> it's OK to load them?

I'm not positive, but I think we link them statically for size and
time reasons.  Statically linking the modules means we can eliminate
the module load code from the kernel, and also save ourselves the ELF
sections (in each module) which hold relocation information, etc.
Also, insmod-ing (or modprobe-ing) the modules takes extra time
overhead for the symbol relocation step.  Since this would be
deferred in our case, this might not be a big deal, but it does
add to the total length of time required to boot.

> Sounds a hell of lot simpler to me...
Our patch isn't that big or complicated now.  I just didn't like
the ioctl().  Replacing the ioctl with some other lightweight
mechanism shouldn't complicate the code too much.

I'm not sure requiring a shell interpreter (to run the script)
a script, a program (modprobe) and a whole new set of memory
operations (to handle the initramfs), is simpler than a single
ioctl. (It might be, in the non-embedded case, where the
presence of these things is taken for granted.)

 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

