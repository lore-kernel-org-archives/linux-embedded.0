From: Behan Webster <behanw@websterwood.com>
Subject: Re: embedded rootfs utility
Date: Thu, 14 Aug 2008 10:35:46 -0400
Message-ID: <48A442C2.2060309@websterwood.com>
References: <488FCF7D.5010005@websterwood.com>	 <Pine.LNX.4.64.0808061345080.28556@vixen.sonytel.be>	 <489C7C69.5060209@websterwood.com> <fa686aa40808132329k49dee24br1d5c83c0d90ea113@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40808132329k49dee24br1d5c83c0d90ea113@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linux-embedded@vger.kernel.org

Grant Likely wrote:
> Hey Behan, a few more comments...
>
> On Fri, Aug 8, 2008 at 11:03 AM, Behan Webster <behanw@websterwood.com> wrote:
>   
>> Geert Uytterhoeven wrote:
>>     
>>> Thanks for this useful tool!
>>> I'm used to plain debootstrap, but decided to give your elbs-rootfs a try for
>>> creating up a mipsel and a powerpc NFS root file system. It worked fine,
>>> except for one minor nit. As an NFS root file system is mounted read-only by
>>> default, I had to manually do
>>>
>>> | mount -n proc /proc -t proc
>>> | mount -n -o remount -w /
>>>
>>> before running finish.sh. Perhaps this can be added to the top of finish.sh?
>>>
>>>       
>> Odd.  I never had this issue.  It has always just worked for me.
>>     
>
> I had to do this also, and I had to explicitly "export PATH" to get
> the finish script to work.  Otherwise I dpkg complains
>   
I've also never had this issue, but I will add it to the script.
> What I probably did differently is that I booted the system with
> "init=/bin/bash" on the command line instead of letting it just run
> init.  I needed to do this because if I let it run init, I got
> complaints about PAM failures when trying to log in as root.  How are
> you booting the system on first run?
>   
There's your problem.  You may have had pam failures before you used
elbs-rootfs, but you shouldn't when using it.  My script twiddles with
inittab to give you a getty with a bash shell without a password, and
then fixes it in the finish.sh script.  If you just boot with it
normally it should just work.  I'm too lazy to type init=/bin/bash, so
the script does it for you. :)

> Also, when booting on something like a 5200 with an uncommon serial
> ports name (ttyPSC0), I had to manually add the /dev/ttyPSC0 device
> file before it would boot.
>   
You're using an older version then.  The latest (v1.2) allows you to
specify the serial port/baud rate when running the tool.

Behan

-- 
Behan Webster
behanw@websterwood.com
