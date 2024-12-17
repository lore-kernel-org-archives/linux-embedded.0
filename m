Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127BF1482E7
	for <linux-embedded@vger.kernel.org>; Tue, 17 Dec 2024 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448371; cv=pass; b=GJRKjTrcuYc3cYJ8tr2BUY9xE8jNwtqnZMUXC8zE9q0istXZkpbBUzoPVcGpoNoC3IUd6erC0Qsx04MWXzjwtKEog8WOGRNMoKKoiNJ4q9JxXfkTxiaCLtTnGNGH9T4GQGx/Vtc011GdRyZi2DQu0cTL9KmWW6vBo3OhT+piUco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448371; c=relaxed/simple;
	bh=p3oHJdMmcQ7gP87+Pn533XqJjnXC6ILC5UxesxIxTNE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OC1BuQXOjoFk/sFvO8Y1tURTtgKyhH8sd46aBejPVN6tklKG/rKwemtfYzSaoIYb7R5Pz+f6EIBchrYlqslI5GoxF1CaQn/i2LCDGK3la5kEP07wzHitVVm1lteE92/6JKfVPyCTgLGkv9pDsjayw18NHt+pCYnH01kDChn/pyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=d9ZIwNSY; arc=pass smtp.client-ip=185.56.87.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="d9ZIwNSY"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-zs5v.prod.antispam.mailspamprotection.com; s=arckey; t=1734448368;
	 b=r92E9zGjRJbODAXHw7s4mCxGRr71QslwD4gLxtGE1A2sWfRLVa67MjBIvxRwOdF8QtxJGTrlsa
	  2rQGh47vAIne63ZzeSHqhvqE4MujhGgf5kyAr0qMkdPs1Wqnx1+9F+FpWFRSXNBMlhB3gu8Ul2
	  uPILXLO4RNzqo3SLuXcSCUNSTjTsIWvcmHhrMhXSYiXVF7aFlIXRwAOZi084UtS51uwE8kqJty
	  YTEfF/mmBMfvoxOhtE3ZEet+SRNvCrfadHVcRpbKIQRDENxbK03820jWhWXvAQQ6TXP9WhT32G
	  T893TbC7e2K8tenxGzD8RS3qAA/f9v3wJ+hTdizrQTSAHg==;
ARC-Authentication-Results: i=1; instance-europe-west4-zs5v.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-zs5v.prod.antispam.mailspamprotection.com; s=arckey; t=1734448368;
	bh=p3oHJdMmcQ7gP87+Pn533XqJjnXC6ILC5UxesxIxTNE=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	  To:From:DKIM-Signature;
	b=Lmc6IzrB6luAl0QauEvFNrOmLY0DiaLs1qcX40zvCLHkhWqkOEkaHPZOIf82YbKwbVPVancs0S
	  NlnEbhmtxpR05K8XYZ0a5/AuvfUv7GnNM6Tfxyoiy5cd7S01aSZBbGY4Q4ZAy182AZZWdC+KKO
	  01ZqVsTAjbJNlDyh9KEj08b7euyvtetjbzTZewZ6+cpzkn4wdnqfErIOavIvTjNqJfMZ+061rm
	  XQmuRoiRZLwHaNSDE8ueZkYVnf2+N08VAE+tMlAOZNt1HDov6bzaaKpSadOVIQG6S3NJiqAQ4d
	  8RTu77fV3e1o9SCyNsKZAWBvBm1W8Tu+LfjfSO9aVLhTdA==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-zs5v.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tNX8t-00000004M0T-0XEm
	for linux-embedded@vger.kernel.org;
	Tue, 17 Dec 2024 12:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=eQPYDDH/2uV8Q2n3JalToSeXpDLyb0EzjKDdHwsHAKs=; b=d9ZIwNSYkp/k5xapetQLJLuzM4
	smXbxkp46GgZZCA9k5dSA1WSJ62BHBpy7e/fmT8wx5D2HJBXLHnjoufhy0uvZ5Cv8YgJTa+F1r8dN
	LpiRvkJlgpS4VJhSudWU+MY//wTRludC6I2KRijFUJQGFrdKEtn/L5MP7wVU15fdO5Qg=;
Received: from [176.200.129.89] (port=25211 helo=fedora.localnet)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tNX8m-000000000IK-1biA
	for linux-embedded@vger.kernel.org;
	Tue, 17 Dec 2024 12:57:32 +0000
From: Francesco Valla <francesco@valla.it>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: [boot-time] [SCRIPT v2] analyze-initcall-debug.py
Date: Tue, 17 Dec 2024 13:57:31 +0100
Message-ID: <1955396.7Z3S40VBb9@fedora>
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
X-SGantispam-id: 7445b73d9ef9f285d80f2712afda4007
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-zs5v.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

this is the second version of the analyze-initcall-debug.py script, which can
be used to analyze the kernel output when booting with initcall_debug
to extract some human-readable data from it.

The first version ca be found at:
https://lore.kernel.org/linux-embedded/1964175.7Z3S40VBb9@fedora.fritz.box/

Regards,

Francesco

---

Differences v1 -> v2:

- added a list of failed driver probes in the plain text output
- added a preliminary comparison on read lines to avoid false negatives in
  regex-based matches
- added the --body-only option to output only the raw HTML body
- use of dictionaries instead of filter() constructs

------ the analyze-initcall-debug.py script follows ------

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
This script can be used to analyze a Linux kernel dmesg output when the
initcall_debug command line output is used. It extract various information,
such as init durations, impact of probe deferral and so on.
"""

import argparse
import re
import sys

ERRCODE_PROBE_DEFER = 517

parser = argparse.ArgumentParser(description='Analyze a Linux kernel dmesg with the initcall_debug option enabled')

parser.add_argument('--dmesg', nargs='?', type=argparse.FileType('r'),
                    default=sys.stdin, help='The dmesg file to analyze (default: stdin)')
format_group = parser.add_mutually_exclusive_group()
format_group.add_argument('--html', action='store_true',
                          help='Output analysis result as HTML table')
format_group.add_argument('--markdown', action='store_true',
                          help='Output analysis result as Markdown table')
parser.add_argument('--body-only', action='store_true',
                    help='Do not add header and footer to HTML output')
args = parser.parse_args()

class Run:
    def __init__(self, start_time:int, end_time:int = -1, duration:int = 0, retval:int = 0):
        self._start_time = start_time
        self._end_time = end_time
        self._duration = duration
        self._retval = retval
        self._ended = (end_time >= 0)

    @property
    def start_time(self) -> int:
        return self._start_time

    @property
    def end_time(self) -> int:
        return self._end_time

    @end_time.setter
    def end_time(self, time:int):
        self._end_time = time
        self._ended = True

    @property
    def duration(self) -> int:
        return self._duration

    @duration.setter
    def duration(self, time:int):
        self._duration = time

    @property
    def retval(self) -> int:
        return self._retval

    @retval.setter
    def retval(self, val:int):
        self._retval = val

    @property
    def running(self) -> bool:
        return (not self._ended or abs(self.retval) == ERRCODE_PROBE_DEFER)

    @property
    def failed(self) -> bool:
        return ((self.retval != 0) and not self.running)


class Entity:
    def __init__(self, name:str, start_time:int = 0, end_time:int = 0, duration:int = 0, retval:int = 0):
        self._name = name
        self._runs = [ Run(start_time, end_time, duration, retval) ]

    @property
    def name(self) -> str:
        return self._name

    @property
    def first_start_time(self) -> int:
        return self._runs[0].start_time

    @property
    def last_start_time(self) -> int:
        return self._runs[-1].start_time

    @property
    def first_end_time(self) -> int:
        return self._runs[0].end_time

    @property
    def last_end_time(self) -> int:
        return self._runs[-1].end_time

    @property
    def duration(self) -> int:
        return sum([ r.duration for r in self._runs ])

    @property
    def wasted_time(self) -> int:
        return sum([ r.duration for r in filter(lambda x: x.failed or abs(x.retval) == ERRCODE_PROBE_DEFER, self._runs) ])

    @property
    def retval(self) -> int:
        return self._runs[-1].retval

    @property
    def failed(self) -> bool:
        return self._runs[-1].failed

    @property
    def running(self) -> bool:
        return self._runs[-1].running

    @property
    def deferred_probe_pending(self) -> bool:
        return (abs(self._runs[-1].retval) == ERRCODE_PROBE_DEFER)

    @property
    def num_deferred_probes(self) -> int:
        return len(list(filter(lambda r: abs(r.retval) == ERRCODE_PROBE_DEFER, self._runs)))

    def addStart(self, start_time: int):
        self._runs.append( Run(start_time) )

    def addEnd(self, end_time:int = 0, duration:int = 0, retval:int = 0):
        self._runs[-1].end_time = end_time
        self._runs[-1].duration = duration
        self._runs[-1].retval = retval

    def addRun(self, start_time: int, end_time:int = 0, duration:int = 0, retval:int = 0):
        self._runs.append( Run(start_time, end_time, duration, retval) )


class Driver (Entity):
    def __init__(self, name: str, start_time: int):
        super().__init__(name, start_time)

    def addInit(self, init_time: int):
        self.addStart(init_time)

    def addReturn(self, return_time: int, duration: int, retval: int):
        self.addEnd(return_time, duration, retval)


class Probe (Entity):
    def __init__(self, name: str, return_time: int, duration: int, retval: int):
        super().__init__(name, return_time, return_time, duration, retval)


class Init (Entity):
    def __init__(self, name: str, start_time: int):
        super().__init__(name, start_time)


# Regex for 'calling' messages
# "[    0.466115] calling  pci_sysfs_init+0x0/0xa8 @ 1"
calling_sentinel = 'calling  '
calling_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] calling  ([0-9a-zA-Z_]+)\+(0x[0-9a-fA-F]+\/0x[0-9a-fA-F]+)( \[[a-zA-Z0-9\-_]+\])? @ ([0-9]+)')

# Regex for 'initcall ... returned' messages
# "[    0.466115] initcall pci_sysfs_init+0x0/0xa8 returned 0 after 5 usecs"
returned_sentinel = 'initcall '
returned_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] initcall ([0-9a-zA-Z_]+)\+(0x[0-9a-fA-F]+\/0x[0-9a-fA-F]+)( \[[a-zA-Z0-9\-_]+\])? returned ([\-0-9]+) after ([0-9]+) usecs')

# Regex for 'probe ... returned' messages
# "[    0.466115] probe of cpufreq-dt returned 517 after 140 usec"
probe_sentinel = 'probe of '
probe_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] probe of ([0-9a-zA-Z_\-\.\:@]+) returned ([\-0-9]+) after ([0-9]+) usecs')

# Regex for
# "[    1.060329] Run /sbin/init as init process"
init_sentinel = 'as init process'
init_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] Run ([/0-9a-zA-Z_]+) as init process')

drivers = {}
probes = {}
init = None

# Extract data from dmesg
lineno = 0
for line in args.dmesg:
    lineno += 1
    if calling_sentinel in line:
        match = calling_prog.match(line)
        if match:
            try:
                time = int(float(match.group(1)) * 1000000.0)
                name = str(match.group(2))
            except Exception as e:
                print(f'Failed parsing line {lineno}:"{line.rstrip()}" as call', file=sys.stderr)
                raise e
            else:
                if name not in drivers.keys():
                    drivers[name] = Driver(name, time)
                else:
                    drivers[name].addInit(time)
            finally:
                continue
        else:
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as call', file=sys.stderr)

    if returned_sentinel in line:
        match = returned_prog.match(line)
        if match:
            try:
                time = int(float(match.group(1)) * 1000000.0)
                name = str(match.group(2))
                retval = int(match.group(5))
                duration = int(match.group(6))
            except:
                print(f'Failed parsing line {lineno}:"{line.rstrip()}" as call return', file=sys.stderr)
            else:
                if name not in drivers.keys():
                    print(f'Detected return for driver {name}, for which an init was never recorded', file=sys.stderr)
                else:
                    drivers[name].addReturn(time, duration, retval)
            finally:
                continue
        else:
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as call return', file=sys.stderr)

    if probe_sentinel in line:
        match = probe_prog.match(line)
        if match:
            try:
                time = int(float(match.group(1)) * 1000000.0)
                name = str(match.group(2))
                retval = int(match.group(3))
                duration = int(match.group(4))
            except:
                print(f'Failed parsing line {lineno}:"{line.rstrip()}" as probe return', file=sys.stderr)
            else:
                if name not in probes.keys():
                    probes[name] = Probe(name, time, duration, retval)
                else:
                    probes[name].addRun(time, time, duration, retval)
            finally:
                continue
        else:
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as probe return', file=sys.stderr)

    if not init and init_sentinel in line:
        match = init_prog.match(line)
        if match:
            try:
                time = int(float(match.group(1)) * 1000000.0)
                name = str(match.group(2))
            except:
                print(f'Failed parsing line {lineno}:"{line.rstrip()}" as init', file=sys.stderr)
            else:
                init = Init(name, time)
            finally:
                continue
        else:
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as init', file=sys.stderr)

# Print Markdown format
if args.markdown:
    print('| Name | Type [^1] | Status [^2] | Duration (us) | Before userspace | Num deferred probes | Time spent in failed inits (us) |')
    print('| -----| --------- | ----------- | ------------- | ---------------- | ------------------- | ------------------------------- |')
    for d in sorted(filter(lambda k: k.duration > 0, list(drivers.values()) + list(probes.values())), key=lambda k: k.duration, reverse=True):
        etype = 'I' if d in drivers else 'P'
        run_status = 'D' if d.deferred_probe_pending else 'R' if d.running else f'F(-{abs(d.retval)})' if d.failed else 'K'
        before_init = 'Y' if d.last_start_time < init.last_start_time else 'N'
        print(f'| {d.name} | {etype} | {run_status} | {d.duration} | {before_init} | {d.num_deferred_probes} | {d.wasted_time} |')
    print('[^1]: I=Init function, P=device Probe')
    print('[^2]: D=Deferred probe pending, R=still Running, F(N)=Failed (with errcode N), K=init oK')

# Print HTML format
elif args.html:
    if not args.body_only:
        print(
'''
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8" />
  <title>Initcall analysis</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
    table, th, td {
      border: 1px solid;
    }
  </style>
</head>
<body>''')

    print(
'''
  <table>
    <tr>
      <th>Name</th>
      <th>Type <a href="#note1">[1]</a></th>
      <th>Status <a href="#note2">[2]</a></th>
      <th>Duration (us)</th>
      <th>Before userspace</th>
      <th>Num deferred probes</th>
      <th>Time spent in failed inits (us)</th>
    </tr>''')

    for d in sorted(filter(lambda k: k.duration > 0, list(drivers.values()) + list(probes.values())), key=lambda k: k.duration, reverse=True):
        etype = 'I' if d in drivers else 'P'
        run_status = 'D' if d.deferred_probe_pending else 'R' if d.running else f'F({abs(d.retval)})' if d.failed else 'K'
        before_init = 'Y' if d.last_start_time < init.last_start_time else 'N'
        print(
f'''
    <tr>
      <td>{d.name}</td>
      <td>{etype}</td>
      <td>{run_status}</td>
      <td>{d.duration}</td>
      <td>{before_init}</td>
      <td>{d.num_deferred_probes}</td>
      <td>{d.wasted_time}</td>
    </tr>''')

    print(
'''
  </table>
  <p id="note1">[1] I=Init function, P=device Probe</p>
  <p id="note2">[2] D=Deferred probe pending, R=still Running, F(N)=Failed (with errcode N), K=init oK</p>
''')

    if not args.body_only:
        print(
'''
</body>
</html>
''')

# Print plain text
else:
    num_before_userspace = len(list(filter(lambda d: d.last_start_time <= init.last_start_time, drivers.values())))
    num_after_userspace = len(list(filter(lambda d: d.last_start_time > init.last_start_time, drivers.values())))
    num_deferred_probe_pending = len(list(filter(lambda d: d.deferred_probe_pending, list(drivers.values()) + list(probes.values()))))
    num_failed = len(list(filter(lambda d: d.failed, list(drivers.values()) + list(probes.values()))))

    print('Summary:')
    print(f'  {len(drivers)} drivers have been initialized, of which {num_before_userspace} before userspace and {num_after_userspace} after')
    print(f'  {len(probes)} probes happened outside of the initcall of their driver')
    print(f'  {num_deferred_probe_pending} deferred probes are pending')
    print(f'  {num_failed} initcalls/probes failed')

    print('\n---\n')

    print('Top 10 initcall/probe durations:')
    for d in sorted(filter(lambda k: k.duration > 0, list(drivers.values()) + list(probes.values())), key=lambda k: k.duration, reverse=True)[0:10]:
        print(f' * {d.name} -> {d.duration}us')

    print('\n---\n')

    print('Failed initcalls/probes:')
    for d in filter(lambda k: k.failed, list(drivers.values()) + list(probes.values())):
        print(f' * {d.name} -> ret = -{abs(d.retval)}')


