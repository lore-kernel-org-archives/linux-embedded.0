From: Ashoka K <ashok.vinu@gmail.com>
Subject: Re: Need help to measure and tune the latency in Linux RT
Date: Wed, 29 May 2013 11:32:11 +0530
Message-ID: <CALJd4caArUaP=ecmdb53tO0wTQaDOfnSeiMNOFssoMpPyTudRw@mail.gmail.com>
References: <CALJd4cbfqRFiGHshv8A+0A8kFo_qW=rvREsdgj3jQ=-0Rix0-g@mail.gmail.com>
	<CAPo1LyXaqrGW0rqgvtaEJMoR1Y6NrTdVhV4Jb_gAp_N1ggwu0Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-newbie-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=k22UrGYAbqCGSHojG1GAoIsWzS2siLUt1B/ffqmhkxo=;
        b=DwrBusPeH+O6RveFtUo6U1HFt5WRDs91U8iBY5zeeiq0HiVDqelDKupJyFZwrvHZiO
         L+H6YU5xuTSKKyGINxdwJGbACZaMY8K9vdt48K95r2XHbnucLoNRkCIEVFsei7Ikq86F
         x1MoLuOiYHqmpENj3/T6GA48lZGxQGF8/Qo1OpcYphT3wC0liVgj6VyP5SieY3+GQPVB
         37reY2HjBjGn18x03wkZWlem/YPCnRC1//gBqpZvQ1FGZcIeppegn0M+80ZTvlQEP155
         1xLFKWC65BeXZEqqdsq9WkZHrxrwPFQSEJtmPEAa8gx+4GvHEpbC9tRFBeBiEaCYlkL7
         cAEA==
In-Reply-To: <CAPo1LyXaqrGW0rqgvtaEJMoR1Y6NrTdVhV4Jb_gAp_N1ggwu0Q@mail.gmail.com>
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Android Techies <android.techies@gmail.com>
Cc: linux-embedded@vger.kernel.org, linux-newbie@vger.kernel.org

Hello Android Techies and others,

I am still debugging this issue to understand the traces generated. I
am debugging at this level for first time, and now i am bit familiar
with traces.

To summarize again:

I have ARM OMAP embedded system, running vanilla Linux 2.6.33-29 cross
compiled with PREEMPT patch. There is a application, say Thread_1 (RR,
with highest priority) which need to send and receive data every 2ms,
or 4ms or 8 ms etc. (configurable). This data is small and atmost it
will be 1 ethernet frame (1500 bytes). So i expect this application to
execute for very short time but regularly without missing deadlines
(There is deviation allowed with watchdog timeout but in worst cases).
There is another process running (RR, lower pri than Thread_1) on same
system which transfers images on request from outside users/HMI. When
this is enabled and i see a frequesnt timeout for the time critical RT
thread_1. Even if this image transfer is not enabled then also i see
Kernel Oops after long time, say 1 day.
All data is flowing on ethernet.

I had increaed the KSOFTIRQD policy and priority to be more than my
time critical application , but it didn't help much. Now i am trying
to understand the debug traces generated to know where the latency is
coming from.

Any suggestions is greatly appreciated.

Regards
Ashoka.  K


On Mon, May 20, 2013 at 12:32 AM, Android Techies
<android.techies@gmail.com> wrote:
> Hello Ashoka,
> You can try to measure the hrtimer latency and see whether there is a delay
> in hrtimer itself. I will suggest to try and make Oprofile working. If you
> have already figured out a way please let me know as well as I need similar
> stuff.
>
>
>
> On Tue, Apr 30, 2013 at 1:27 AM, Ashoka K <ashok.vinu@gmail.com> wrote:
>>
>> Hi,
>>
>> I have an embedded system running 2.6.33 cross compiled for ARM OMAP
>> with 1 GHZ uni-processor system.
>>
>> The application has many threads and processes (around 15 total). In
>> that 1 thread is time critical and must run every interval confiurable
>> as 2, 4 or 8 milli sec etc. There is another thread which transfers
>> Images to a FTP or to HMI etc, whoever requested the image.
>> With this image transfer enabled my critical process misses the
>> deadline and timesout. This critical thread is at RR priority 50. I
>> used a HR timer thread with RR pri 55 to wakeup the critical thread
>> every 1 milli sec to do the job.
>> If image transfer is enabled i see that real time thread misses deadlines.
>>
>> All traffic is flowing on common ethernet connection. Does it affect
>> in any way ?
>>
>> How to find out where the kernel is waiting or delaying to schedule
>> the critical thread even though it is at higher RR priority. How to
>> measure the latency ?
>>
>> I am trying to use Oprofile tool, but got some error in cross
>> compiling. Doesn't these tools add their own latency to the original
>> problem ?
>>
>> Any tools ? which one is better. Please provide your input on this.
>>
>>
>> Regards
>> Ashoka.  K
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
>>
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at http://www.linux-learn.org/faqs
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
