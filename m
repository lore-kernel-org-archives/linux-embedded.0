From: Ashoka K <ashok.vinu@gmail.com>
Subject: Need help to measure and tune the latency in Linux RT
Date: Tue, 30 Apr 2013 13:57:21 +0530
Message-ID: <CALJd4cbfqRFiGHshv8A+0A8kFo_qW=rvREsdgj3jQ=-0Rix0-g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-newbie-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=G6lT9HA4JVHMlzlYUgQPMOWcMmq8M4pFsphxKdqlX/A=;
        b=ej3r0Ar5/bx5/K8EgwF0dHSY2ClQFfvMXEWknIRH8SGLgwY90AlTLeHGn1pcts8c6F
         ItEpR4MGRQyTCZF1actZp+tLxHwSObCiiZ+tYdzO+1MQbADsCn80w3mgsjHWHUR0NMO9
         Xhc/1ovfxngCZ5RUxg9iY7ZwvlqveKWrLWZi9CJfupi/mLeyqrRB9Arh+V6jEdK3vZH1
         V1Q4VKEcH8W4Nmc7NYu34WLViQsbFEoKQRiaTcjHmriyun+0D+hph9Hhrozn2fy45/Oz
         Fw7tDUFKePLEG44dGyjvnschPMFpTqVlEkszI9Y9fSpU0jAnAx/IZ/u382EWmL/aLtBg
         +hOg==
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org, linux-newbie@vger.kernel.org

Hi,

I have an embedded system running 2.6.33 cross compiled for ARM OMAP
with 1 GHZ uni-processor system.

The application has many threads and processes (around 15 total). In
that 1 thread is time critical and must run every interval confiurable
as 2, 4 or 8 milli sec etc. There is another thread which transfers
Images to a FTP or to HMI etc, whoever requested the image.
With this image transfer enabled my critical process misses the
deadline and timesout. This critical thread is at RR priority 50. I
used a HR timer thread with RR pri 55 to wakeup the critical thread
every 1 milli sec to do the job.
If image transfer is enabled i see that real time thread misses deadlines.

All traffic is flowing on common ethernet connection. Does it affect
in any way ?

How to find out where the kernel is waiting or delaying to schedule
the critical thread even though it is at higher RR priority. How to
measure the latency ?

I am trying to use Oprofile tool, but got some error in cross
compiling. Doesn't these tools add their own latency to the original
problem ?

Any tools ? which one is better. Please provide your input on this.


Regards
Ashoka.  K
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
