From: David Wagner <david.wagner@free-electrons.com>
Subject: Re: Flash filesystems benchmarks
Date: Thu, 28 Jul 2011 22:05:46 +0200
Message-ID: <4E31C11A.8050105@free-electrons.com>
References: <4E3131AE.7010408@free-electrons.com> <CAAfyv35zgDLpf6Hs0G0wESh0-BjoiWMH+4wA7+anSwR0rREtbA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CAAfyv35zgDLpf6Hs0G0wESh0-BjoiWMH+4wA7+anSwR0rREtbA@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Belisko Marek <marek.belisko@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux Embedded <linux-embedded@vger.kernel.org>, tim.bird@am.sony.com

	Hi,

On 28/07/2011 21:14, Belisko Marek wrote:
> Hi,
> Great job ;). Maybe small README how to use scripts. I try to run
> ./performance-test.py but got en error because test.cfg doesn't exist.
 > Shouldn't there be input argument for specific board something like:
 > [...]

Thanks for the feedback. You're right, READMEs are missing ; they'll come.

The current procedure, regarding the configuration file, is:
  * write a configuration file (like those already provided as examples)
  * cp it to test.cfg
  * launch performance-test.py
why the cp ? because it allows to tweak it without changing the original.
But it would certainly be best to use a proper argument parsing 
(argparse, like for gnuplotize_*.py and generate_graphs.py) and have an 
optional configuration file.


The material and documentation to reproduce the tests isn't fully 
available yet but will be very soon.  I can already give you a link to 
the debian root filesystem (to be exported through NFS) that was used ; 
however I can't guarantee yet that it will work. 
http://free-electrons.com/~david/pub/RFS-benchmarks.tar.lzma (1.1GB)


David.

--
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
