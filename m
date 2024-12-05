Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8071DF745
	for <linux-embedded@vger.kernel.org>; Thu,  5 Dec 2024 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733404652; cv=pass; b=AKn0+7uEl0rnU3yglq67OR6sPvtYFKtuWhrMtL1qwYCk7rYvhkwzVc3Y/h2Aod6NwY9oaWldM9DBZJJHtY7CXyvwxCVlGFglSt5NZK778dVd3dT5F5o7Xtw71QFgbMkiIP0K6meGwuhPJa/C0mjsn9tDoZ1wM5m7YK4MzwbbiP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733404652; c=relaxed/simple;
	bh=SBcyYWD9ydJCHu1PBxMWkQUnBmjZF6gkX1mNHDzMla8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QFggrdTlx9itaeTbVyjOIcwRWeCdLrB2as5B43jAAC2YvxDB0lL9q5wRevYozJIubHcRz8DlIFi0krRWeVvztpE+Zu8C3TduD3l0nHwtkESFNWfBWnWUFrQeEJinKInOhKFxiTrUd9DwyQ4QfHyrD/q8pxRgZYSeViw1RJvBvuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=FcxLFug6; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="FcxLFug6"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-bdmq.prod.antispam.mailspamprotection.com; s=arckey; t=1733404649;
	 b=bH4bbw3q08zLVsyN0N3xn9hlwSKrkJtSDwJOKZsxJILp9jJUVzXPSrHzaCMmKbGK625SdALlvZ
	  JKUOQgutEzvFKhy1XAON2oSgWZXvnRmlpwTP7sZi7lTNmYfknhWzCW7ryTHxJozkl6TxwoS3Wd
	  l/TRKLtkiQKFcJzVwg3KI0l2x042Z+BQBsK/6mnIwpNwyxkFw496PaT5k4BMiEHAw0EG03RrvQ
	  zHLjb6FpbPAHXot3/ai/njTG4oS1cZSdQuUu9UFcgtDK0zdYHhqsq8ZGGpNXit7dXRT/UnoWIv
	  cfZuDj2OKHbywgAboPZq80c8TTDPT/PVUCAU57DfJS/3oQ==;
ARC-Authentication-Results: i=1; instance-europe-west4-bdmq.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-bdmq.prod.antispam.mailspamprotection.com; s=arckey; t=1733404649;
	bh=SBcyYWD9ydJCHu1PBxMWkQUnBmjZF6gkX1mNHDzMla8=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:To:From:DKIM-Signature;
	b=c2ozAd6LlWzDm0N3pBAjxoqvoCSWVP7+KFYlEyJ7hpY8oqYOPIzktKVX48lD1G+ehBoJ5rja3T
	  +q9yDNx+30K63f2fIqKA/CZ4p1PEG/7KH27Cg4tf6kiZpL5rfGX92l+itKB5iINUqCoJygEBev
	  UvFPo+56KiwezrxxuLB+kNCjmkj7xs1O5bhiQcZZ2gMSLTWrAdXn2ebB9Lvs3TPFiC2g07doAd
	  KkSf9oDdu+o+qenADWUvIsKSArcdCqAkZHW8/fDHBcjVGYyK2kmbQJu1Aj3FGsskTSok4+N9bs
	  H1/aZxwLvKVQ5EHh0rmhHeRzk1QxCannRUhbrmqotQ4awQ==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-bdmq.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tJBYM-000000072B4-2bNW
	for linux-embedded@vger.kernel.org;
	Thu, 05 Dec 2024 13:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=iA3s81e6pcHSRLoEhtm7/ifT1/HqQuG2QCV6XRvmuxE=; b=FcxLFug6wxfbTY8nz71+D8ZkmM
	/BeI7HqnnBdHWh2re16BdhHAJZeTjvblAydkHMajBNY1A7TXYVHpPhLKvcNsSX7HMGP5h4vNEG2n9
	3TCUsTP3WR74EPutHTWna4nJlGu5invrF/YCZKLlJ9NtB4iruoz65eYmVg98EZKsVDXA=;
Received: from [176.200.182.84] (port=6322 helo=fedora.localnet)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tJBYG-00000000D70-34ph;
	Thu, 05 Dec 2024 13:05:52 +0000
From: Francesco Valla <francesco@valla.it>
To: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] [RFC] analyze-initcall-debug.py - a tool to analyze the
 initcall debug output
Date: Thu, 05 Dec 2024 14:05:53 +0100
Message-ID: <9797282.eNJFYEL58v@fedora>
In-Reply-To:
 <MW5PR13MB563206FC92B1CACCD85DA33BFD372@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box>
 <MW5PR13MB563206FC92B1CACCD85DA33BFD372@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 9d525903dd0cd1fa2facc49dee9a77cb
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-bdmq.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Tim,

On Wednesday, 4 December 2024 at 01:29:18 Bird, Tim <Tim.Bird@sony.com> wrote:
> 
> > -----Original Message-----
> > From: Francesco Valla <francesco@valla.it>
> > Dear fellow boot time optimizers,
> > 
> > following the first boot time SIG meeting, which I lurked with much pleasure
> > (but didn't participate to, as I was a bit in awe among such authorities), I'd
> > like to introduce myself with code rather than a presentation or resume.
> > 
> > Here is a python script which can analyze a dmesg output with initcall_debug
> > option enabled and extract some useful information. It can for example be used
> > to analyze the output of the grab-boot-data.sh tool that Tim presented on this
> > list [1] just a few days ago.
> > 
> > Usage is very simple, as the output of dmesg can be piped directly to it:
> > 
> >     dmesg | analyze-initcall-debug.py
> > 
> > If no option is specified, it outputs a brief summary, like the following one
> > (obtained on my Beagleplay):
> > 
> > 1758 drivers has been initialized, of which 1758 before userspace
> > 119 probes happened outside of the init of their driver
> > 0 deferred probes pending
> > ---
> > Top 10 init/probes durations:
> >  * 30200000.dss -> 523002us
> >  * deferred_probe_initcall -> 487483us
> >  * fd00000.gpu -> 162859us
> >  * 8000f00.mdio -> 142521us
> >  * 44043000.system-controller -> 71390us
> >  * 2-004c -> 71178us
> >  * 40900000.crypto -> 59350us
> >  * 8000000.ethernet -> 58419us
> >  * 44043000.system-controller:clock-controller -> 56599us
> >  * jent_mod_init -> 52140us
> > 
> > A more complete output, reporting all durations as well as statuses, impact of
> > probe deferral and so on, can be produced either in HTML or Markdown format,
> > using respectively the --html or --markdown parameters.
> > 
> > Note: it hasn't (yet?) been used in a "production" environment, as I never
> > found the motivation to write a script and always analyzed manually the
> > initcall_debug output.
> > 
> > If you have time to take a look, please tell me what you think and what
> > can be added.
> > 
> > Thank you!
> > 
> > Regards,
> > Francesco
> > 
> > [1] https://lore.kernel.org/linux-
> > embedded/MW5PR13MB5632F54DCBDA0C74370E531FFD5C2@MW5PR13MB5632.namprd13.prod.outlook.com/
> > 
> > --- analyze-initcall-debug.py script follows ---
> > 
> > #!/usr/bin/env python3
> > # -*- coding: utf-8 -*-
> > 
> > """
> > This script can be used to analyze a Linux kernel dmesg output when the
> > initcall_debug command line output is used. It extract various information,
> > such as init durations, impact of probe deferral and so on.
> > """
> > 
> > import argparse
> > import re
> > import sys
> > 
> > ERRCODE_PROBE_DEFER = 517
> > 
> > parser = argparse.ArgumentParser()
> > 
> > parser.add_argument('--dmesg', nargs='?', type=argparse.FileType('r'),
> >                     default=sys.stdin)
> > parser.add_argument('--html', action='store_true')
> > parser.add_argument('--markdown', action='store_true')
> > args = parser.parse_args()
> > 
> > class Run:
> >     def __init__(self, start_time:int, end_time:int = -1, duration:int = 0, retval:int = 0):
> >         self._start_time = start_time
> >         self._end_time = end_time
> >         self._duration = duration
> >         self._retval = retval
> >         self._ended = (end_time >= 0)
> > 
> >     @property
> >     def start_time(self) -> int:
> >         return self._start_time
> > 
> >     @property
> >     def end_time(self) -> int:
> >         return self._end_time
> > 
> >     @end_time.setter
> >     def end_time(self, time:int):
> >         self._end_time = time
> >         self._ended = True
> > 
> >     @property
> >     def duration(self) -> int:
> >         return self._duration
> > 
> >     @duration.setter
> >     def duration(self, time:int):
> >         self._duration = time
> > 
> >     @property
> >     def retval(self) -> int:
> >         return self._retval
> > 
> >     @retval.setter
> >     def retval(self, val:int):
> >         self._retval = val
> > 
> >     @property
> >     def running(self) -> bool:
> >         return (not self._ended or abs(self.retval) == ERRCODE_PROBE_DEFER)
> > 
> >     @property
> >     def failed(self) -> bool:
> >         return ((self.retval != 0) and not self.running)
> > 
> > 
> > class Entity:
> >     def __init__(self, name:str, start_time:int = 0, end_time:int = 0, duration:int = 0, retval:int = 0):
> >         self._name = name
> >         self._runs = [ Run(start_time, end_time, duration, retval) ]
> > 
> >     @property
> >     def name(self) -> str:
> >         return self._name
> > 
> >     @property
> >     def first_start_time(self) -> int:
> >         return self._runs[0].start_time
> > 
> >     @property
> >     def last_start_time(self) -> int:
> >         return self._runs[-1].start_time
> > 
> >     @property
> >     def first_end_time(self) -> int:
> >         return self._runs[0].end_time
> > 
> >     @property
> >     def last_end_time(self) -> int:
> >         return self._runs[-1].end_time
> > 
> >     @property
> >     def duration(self) -> int:
> >         return sum([ r.duration for r in self._runs ])
> > 
> >     @property
> >     def wasted_time(self) -> int:
> >         return sum([ r.duration for r in filter(lambda x: x.failed or abs(x.retval) == ERRCODE_PROBE_DEFER, self._runs) ])
> > 
> >     @property
> >     def retval(self) -> int:
> >         return self._runs[-1].retval
> > 
> >     @property
> >     def failed(self) -> bool:
> >         return self._runs[-1].failed
> > 
> >     @property
> >     def running(self) -> bool:
> >         return self._runs[-1].running
> > 
> >     @property
> >     def deferred_probe_pending(self) -> bool:
> >         return (abs(self._runs[-1].retval) == ERRCODE_PROBE_DEFER)
> > 
> >     @property
> >     def num_deferred_probes(self) -> int:
> >         return len(list(filter(lambda r: abs(r.retval) == ERRCODE_PROBE_DEFER, self._runs)))
> > 
> >     def addStart(self, start_time: int):
> >         self._runs.append( Run(start_time) )
> > 
> >     def addEnd(self, end_time:int = 0, duration:int = 0, retval:int = 0):
> >         self._runs[-1].end_time = end_time
> >         self._runs[-1].duration = duration
> >         self._runs[-1].retval = retval
> > 
> >     def addRun(self, start_time: int, end_time:int = 0, duration:int = 0, retval:int = 0):
> >         self._runs.append( Run(start_time, end_time, duration, retval) )
> > 
> > 
> > class Driver (Entity):
> >     def __init__(self, name: str, start_time: int):
> >         super().__init__(name, start_time)
> > 
> >     def addInit(self, init_time: int):
> >         self.addStart(init_time)
> > 
> >     def addReturn(self, return_time: int, duration: int, retval: int):
> >         self.addEnd(return_time, duration, retval)
> > 
> > 
> > class Probe (Entity):
> >     def __init__(self, name: str, return_time: int, duration: int, retval: int):
> >         super().__init__(name, return_time, return_time, duration, retval)
> > 
> > 
> > class Init (Entity):
> >     def __init__(self, name: str, start_time: int):
> >         super().__init__(name, start_time)
> > 
> > 
> > # Regex for 'calling' messages
> > # "[    0.466115] calling  pci_sysfs_init+0x0/0xa8 @ 1"
> > calling_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] calling  ([0-9a-zA-Z_]+)\+(0x[0-9a-fA-F]+\/0x[0-9a-fA-F]+) @ ([0-9]+)')
> > 
> > # Regex for 'initcall ... returned' messages
> > # "[    0.466115] initcall pci_sysfs_init+0x0/0xa8 returned 0 after 5 usecs"
> > returned_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] initcall ([0-9a-zA-Z_]+)\+(0x[0-9a-fA-F]+\/0x[0-9a-fA-F]+) returned ([\-0-9]+) after ([0-
> > 9]+) usecs')
> > 
> > # Regex for 'probe ... returned' messages
> > # "[    0.466115] probe of cpufreq-dt returned 517 after 140 usec"
> > probe_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] probe of ([0-9a-zA-Z_\-\.\:@]+) returned ([\-0-9]+) after ([0-9]+) usecs')
> > 
> > # Regex for
> > # "[    1.060329] Run /sbin/init as init process"
> > init_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] Run ([/0-9a-zA-Z_]+) as init process')
> > 
> 
> I'm a little worried about the fragility of these regex lines.  If a dmesg line doesn't
> match, then it is silently ignored.  It might be worth checking for a simpler match first,
> then trying for the full regex match.  See below.
> 

You are right - in fact this version of the tool is not matching probes for drivers
built as modules. I'll post an updated version once I solved all the other concerns.

> > drivers = list()
> > probes = list()
> > init = None
> > 
> > # Extract data from dmesg
> > for line in args.dmesg:
> It might be nice to keep track of the line number here, for more detail
> when reporting parsing errors.
> 

Agreed.

> >     match = calling_prog.match(line)
> 
> if "] calling" in line:
>    match = calling_prog.match(line)
> 

Yes, that would be better.

> >     if match is not None:
> 
> if match:
> is better here, IMHO.
> 

Noted (for the other occurrences below, too).

> >         time = float(match.group(1)) * float(10^6)
> >         name = str(match.group(2))
> >         try:
> >             time = float(match.group(1)) * float(10^6)
> >             name = str(match.group(2))
> >         except Exception as e:
> >             print(f'Failed parsing line "{line.rstrip()}" as call')
> >             raise e
> >         else:
> >             for d in filter(lambda x: x.name == name, drivers):
> This is a bit strange.
> Why not use a dictionary for drivers here, with name as the key, instead
> of a list where you have to do a search?
> 

Force of habit, probably - I code 99% of the time in C. A dictionary would be more efficient.

> >                 d.addInit(time)
> >                 break
> >             else:
> >                 drivers.append(Driver(name, time))
> If the driver names are unique, then this can be:
>   drivers[name] = Driver(name, time)
> Otherwise:
>   drivers[name] = drivers.get(name, []).append(Drivers(name, time))
> 
> which is equivalent to:
>   if name in drivers:
>       drivers[name].append(Driver(name, time))
>  else:
>       drivers[name] = [Drivers(name, time)]
> 

Noted. I need to think about the .get().append() syntax, is not so intuitive to me.

> >         finally:
> >             continue
> > 
> >     match = returned_prog.match(line)
> >     if match is not None:
> if match:
> 
> >         try:
> >             time = float(match.group(1)) * float(10^6)
> >             name = str(match.group(2))
> >             retval = int(match.group(4))
> >             duration = int(match.group(5))
> >         except:
> >             print(f'Failed parsing line "{line.rstrip()}" as call return')
> >         else:
> >             for d in filter(lambda x: x.name == name, drivers):
> Same thing here - should use a dictionary with name as key.
> 

Yes -  see above.

> >                 d.addReturn(time, duration, retval)
> >                 break
> >             else:
> >                 print(f'Detected return for driver {name}, for which an init was never recorded')
> >         finally:
> >             continue
> > 
> >     match = probe_prog.match(line)
> >     if match is not None:
> if match:
> >         try:
> >             time = float(match.group(1)) * float(10^6)
> >             name = str(match.group(2))
> >             retval = int(match.group(3))
> >             duration = int(match.group(4))
> >         except:
> >             print(f'Failed parsing line "{line.rstrip()}" as probe return')
> >         else:
> >             for d in filter(lambda x: x.name == name, probes):
> Should use a dictionary here.
> >                 d.addRun(time, time, duration, retval)
> >                 break
> >             else:
> >                 probes.append(Probe(name, time, duration, retval))
> >         finally:
> >             continue
> > 
> >     if init is None:
> if not init:
> >         match = init_prog.match(line)
> >         if match is not None:
> if match:
> >             try:
> >                 time = float(match.group(1)) * float(10^6)
> >                 name = str(match.group(2))
> >             except:
> >                 print(f'Failed parsing line "{line.rstrip()}" as probe return')
> >             else:
> >                 init = Init(name, time)
> >             finally:
> >                 continue
> > 
> > if args.markdown:
> >     print('| Name | Type [^1] | Status [^2] | Duration (us) | Before userspace | Num deferred probes | Time spent in failed inits (us) |')
> >     print('| -----| --------- | ----------- | ------------- | ---------------- | ------------------- | ------------------------------- |')
> >     for d in sorted(filter(lambda k: k.duration > 0, drivers + probes), key=lambda k: k.duration, reverse=True):
> >         etype = 'I' if d in drivers else 'P'
> >         run_status = 'D' if d.deferred_probe_pending else 'R' if d.running else f'F({abs(d.retval)})' if d.failed else 'K'
> >         before_init = 'Y' if d.last_start_time < init.last_start_time else 'N'
> >         print(f'| {d.name} | {etype} | {run_status} | {d.duration} | {before_init} | {d.num_deferred_probes} | {d.wasted_time} |')
> >     print('[^1]: I=Init function, P=device Probe')
> >     print('[^2]: D=Deferred probe pending, R=still Running, F(N)=Failed (with errcode N), K=init oK')
> > elif args.html:
> >     print(
> > '''
> > <!DOCTYPE HTML>
> > <html>
> > <head>
> >   <meta charset="utf-8" />
> >   <title>Initcall analysis</title>
> >   <meta name="viewport" content="width=device-width, initial-scale=1" />
> >   <style>
> >     table, th, td {
> >       border: 1px solid;
> >     }
> >   </style>
> > </head>
> > <body>
> > 
> I'd like a version of this where it just emits the HTML for the body, and not the full
> page.  I could use this in my birdcloud boot-time wiki.
> 
> Maybe add an option to select full HTML page vs HTML snippet?
> 

I'll add an option to do just that.

> > <table>
> >   <tr>
> >     <th>Name</th>
> >     <th>Type <a href="#note1">[1]</a></th>
> >     <th>Status <a href="#note2">[2]</a></th>
> >     <th>Duration (us)</th>
> >     <th>Before userspace</th>
> >     <th>Num deferred probes</th>
> >     <th>Time spent in failed inits (us)</th>
> >   </tr>''')
> > 
> >     for d in sorted(filter(lambda k: k.duration > 0, drivers + probes), key=lambda k: k.duration, reverse=True):
> >         etype = 'I' if d in drivers else 'P'
> >         run_status = 'D' if d.deferred_probe_pending else 'R' if d.running else f'F({abs(d.retval)})' if d.failed else 'K'
> >         before_init = 'Y' if d.last_start_time < init.last_start_time else 'N'
> >         print(
> > f'''
> >   <tr>
> >     <td>{d.name}</td>
> >     <td>{etype}</td>
> >     <td>{run_status}</td>
> >     <td>{d.duration}</td>
> >     <td>{before_init}</td>
> >     <td>{d.num_deferred_probes}</td>
> >     <td>{d.wasted_time}</td>
> >   </tr>''')
> > 
> >     print(
> > '''
> > </table>
> > <p id="note1">[1] I=Init function, P=device Probe</p>
> > <p id="note2">[2] D=Deferred probe pending, R=still Running, F(N)=Failed (with errcode N), K=init oK</p>
> > </body>
> > </html>
> > ''')
> > 
> > else:
> >     print(f'{len(drivers)} drivers has been initialized, of which {len(list(filter(lambda d: d.last_start_time < init.last_start_time, drivers)))}
> > before userspace')
> >     print(f'{len(probes)} probes happened outside of the init of their driver')
> > 
> >     print(f'{len(list(filter(lambda d: d.deferred_probe_pending, drivers + probes)))} deferred probes pending')
> > 
> >     print('---')
> > 
> >     print('Top 10 init/probes durations:')
> >     for d in sorted(filter(lambda k: k.duration > 0, drivers + probes), key=lambda k: k.duration, reverse=True)[0:10]:
> >         print(f' * {d.name} -> {d.duration}us')
> > 
> > 
> > 
> > 
> 
> Just my 2 cents...
>  -- Tim
> 

Thank you!

Regards,

Francesco




