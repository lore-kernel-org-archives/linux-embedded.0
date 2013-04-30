From: ddegraff <ddegraff@neb.rr.com>
Subject: Re: Need help to measure and tune the latency in Linux RT
Date: Tue, 30 Apr 2013 07:02:16 -0500
Message-ID: <517FB2C8.10705@neb.rr.com>
References: <CALJd4cbfqRFiGHshv8A+0A8kFo_qW=rvREsdgj3jQ=-0Rix0-g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-newbie-owner@vger.kernel.org>
In-Reply-To: <CALJd4cbfqRFiGHshv8A+0A8kFo_qW=rvREsdgj3jQ=-0Rix0-g@mail.gmail.com>
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ashoka K <ashok.vinu@gmail.com>
Cc: linux-embedded@vger.kernel.org, linux-newbie@vger.kernel.org


On 04/30/2013 03:27 AM, Ashoka K wrote:
> Hi,
>
> I have an embedded system running 2.6.33 cross compiled for ARM OMAP
> with 1 GHZ uni-processor system.

A project I am working on is using the same vintage kernel with RT 
patches applied, though on DaVinci (omap l138).

I, myself, however, have not dealt with any of that work, but I will ask 
the other developer if he has any suggestions.


>
> The application has many threads and processes (around 15 total). In
> that 1 thread is time critical and must run every interval confiurable
> as 2, 4 or 8 milli sec etc. There is another thread which transfers
> Images to a FTP or to HMI etc, whoever requested the image.
> With this image transfer enabled my critical process misses the
> deadline and timesout. This critical thread is at RR priority 50. I
> used a HR timer thread with RR pri 55 to wakeup the critical thread
> every 1 milli sec to do the job.
> If image transfer is enabled i see that real time thread misses deadlines.
>
> All traffic is flowing on common ethernet connection. Does it affect
> in any way ?
>
> How to find out where the kernel is waiting or delaying to schedule
> the critical thread even though it is at higher RR priority. How to
> measure the latency ?
>
> I am trying to use Oprofile tool, but got some error in cross
> compiling. Doesn't these tools add their own latency to the original
> problem ?
>
> Any tools ? which one is better. Please provide your input on this.
>
>
> Regards
> Ashoka.  K
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
