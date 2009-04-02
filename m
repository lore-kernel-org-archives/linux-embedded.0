From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: Sources of entropy?
Date: Thu, 2 Apr 2009 13:45:53 +0200
Message-ID: <20090402114553.GA7568@opentech.at>
References: <200903241847.29104.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200903241847.29104.rgetz@blackfin.uclinux.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Getz <rgetz@blackfin.uclinux.org>
Cc: linux-embedded@vger.kernel.org

On Tue, 24 Mar 2009, Robin Getz wrote:

> I'm just wondering what people using on standard embedded/headless/diskless 
> targets (which do not have hw random number generators) as a source of 
> entropy - since networking was removed as an entropy source circa 2.6.26
>
without claiming that this is actually usable at this point but a simple
source of entropy that looks quite good is simply to use the timer-counter/TSC
or what ever available. The attached trng.c has been tested on a few X86
systems and produces remarkably good random numbers - this might be suitable
if you have no other sources available.

The actual source of randomness simply is that sampling the LSB of what ever
timer source is available is of lower granularity than the system jitter 
(scheduling jitter actually) - so this should be quite generally applicable.
In fact on some of the tested X86 system the randomness was good up to the
10 or 11th bit of the TSC.

 
/* naive true random number generator in software - this seems to be doing
 * better than /dev/random on most linux boxes ;)
 *
 * Copyright OpenTech EDV Research GmbH 2009
 * Author Der Herr Hofrat, <der.herr@hofr.at>
 * License GPL V2 - see http://www.gnu.org/copyleft/gpl.html for more
 *
 * cmpile: gcc -O2 trng.c -o trng
 * usage: ./trng > rand_data
 *
 * what is this doing ?
 * Simply take the non-determinism of intel architectures at the instruction
 * level and sample the TSCs LSB - bit shift it into an array and through
 * most of it away again (this could be optimized - but thats not essential
 * here) - the output is by all standards truly random 
 *
 * first "test"
 *
 * aetsch:~# ./trng > 1
 * ls -aetsch:~# ls -l 1
 * -rw-r--r-- 1 root root 8192 2008-10-19 14:03 1
 * aetsch:~# bzip2 1
 * aetsch:~# ls -l 1.bz2
 * -rw-r--r-- 1 root root 8679 2008-10-19 14:03 1.bz2
 *
 * indicate very good randomness as bzip is not able to compress anything!
 */

#include <stdio.h>

/* read the tsc snip of the LSB and shift it into a long long
 * usleep(something) to ensure that the CPU is sufficiently randomized
 * so we have NO deterministic (periodic) and thus non-random access
 */
__inline__ unsigned long long int sample_tsc(void)
{
	unsigned long long int x,res;
	int i;
	res=0;
	for(i=0;i<32;i++){
		__asm__ __volatile__("rdtsc\n\t":"=A" (x));
		res|=((x&0x01LL)<<i);
		usleep(10);
	}
	return res;
}

int main(int argc, char **argv)
{
	unsigned int n;

	n=0;
	/* simply dump the bit patters to stdout */
	while(n++ < 8192){
		printf("%c",(sample_tsc()&0x00FFLL));
	}
	return 0;
}
