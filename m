Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7514F23DE
	for <linux-embedded@vger.kernel.org>; Thu, 26 Dec 2024 18:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237127; cv=pass; b=EY/9dFETXEtzwOtqicb9d9HVVwCZVf3PzVyYJIqJ3nxeWky/LjBImxKmxhiCfYzH1/bre+fXvROcpr7xoDcPAsHRBdS9uwOO1ijCrd9+cc62+WnnG+I/q80OwAr42Tt9w1iXUB0ixIWy4Hw4+n42L+VIcu7eLccAC4QZ6ZMmxPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237127; c=relaxed/simple;
	bh=t/84xFwUjVCq/FhPVBlWsq+sgQweRPfmkdO6goz6PX4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g99dc/NXNdqA1O8z7fhDKUlCCO3ZXAciHveLpfgwfLPmeukeKg+r4i+fYVXpk8l+/Na1b+ge7KatitjTKMXBFwP3rbvboXCNFNFwdF4LEqK0FeX+ggNEjQZu5gwDua9EDm1bhE/xf50CgmoxO1XzUQhAkzpckgwsrD4rRRfz5sY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=DklVS7F4; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="DklVS7F4"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-rhcm.prod.antispam.mailspamprotection.com; s=arckey; t=1735237124;
	 b=PyLvovW/cKmRR7Q94bVyxjozOz6x9j21F1uy5X2uuvTOv4GIa3wKQTXXz45BSTNHOKdR0pnGIB
	  BJ7EIGm5wdmLeQfISWE43vm2mFYUzqtJ/zpHDUcQBcRmqeRhZNFEIsVC47YvrNP+dgJyCoE4QO
	  Rwp85MJtvGLPDcrI4zlfrlDJG9sAnI6DQv5HLbLXNVvNGRb4oratSaEQOWD9cuylX8plSRfqV8
	  vt9Hshi6Vb/hUTIXakny1AKKDzAjjzEpaaVwayulVBEL7xvSrE+9O9P+ggGkib4pjCzCD2VYW0
	  hI1mz8CkByWKbW1aQzZz7F4cSq5XGEmRKaIqo13QZOdnBw==;
ARC-Authentication-Results: i=1; instance-europe-west4-rhcm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-rhcm.prod.antispam.mailspamprotection.com; s=arckey; t=1735237124;
	bh=t/84xFwUjVCq/FhPVBlWsq+sgQweRPfmkdO6goz6PX4=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	  To:From:DKIM-Signature;
	b=okKzB930I7R6RgC3CntUa8VtJbELUR2qaixKt3ze1Fo41dknuCRDFco3I5vMhcHhtOMYbcLNAD
	  41CAKxxEHjoYrFEc8W/avYGYqgtfvSevGu3A5xwRslmvQ3Q5egkNz6VAC9Z5HaFL6W1ZE6YNp3
	  wuqpQL5/YNO9QCFPU5Xyf7H2GgY8TJgpva42bT1lS5mcGxfoITizZTyA/LNANf5kEvOmwkDZ1v
	  WSuX3LIw8q53PCHO+2AVAD4S2cMsei3G9IRCi3tyAgD6PT6/BmXK05ELcJcTsYmJmXjEA/VqA2
	  WwfLGGFsdoW89x7UXyO4O55tDxTWXMLlInfkFkUj9iJqOw==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-f23g.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tQpjy-00000004hRo-0CEy
	for linux-embedded@vger.kernel.org;
	Thu, 26 Dec 2024 15:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=MIJccl5d7q0GEQPYygFIy9VVZWbWI0PIEkOEYEou8GQ=; b=DklVS7F4yZg4Z74RWJnQdqW+NK
	VgSeIAU3Q5tQoOEf9rEuvsPzg4sm80dJTgm5v7aEVPlRevoAlnbJ49f4lrWOns8YjM1/G5xi12XbR
	obNIN/2lUiHnwr8hOJn+QWwGd+ufrmb8RBCw+yHcCK7R9LN9UunT678pBFEWIuT8/y+c=;
Received: from [80.181.39.139] (port=60451 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tQpjq-000000004tp-2bhK
	for linux-embedded@vger.kernel.org;
	Thu, 26 Dec 2024 15:25:26 +0000
From: Francesco Valla <francesco@valla.it>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: [boot-time] [SCRIPT v3] analyze-initcall-debug.py
Date: Thu, 26 Dec 2024 16:25:24 +0100
Message-ID: <5640944.lGaqSPkdTl@fedora.fritz.box>
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
X-SGantispam-id: a233f9732701bc7a1473fd1330c01b8b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-rhcm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

this is the third version of the analyze-initcall-debug.py script, which can
be used to analyze the kernel output when booting with initcall_debug
to extract some human-readable data from it.

This version brings several enhancements and new features, the most notable
ones being the split between initcalls and probes (since they partially overlap)
and the SVG pie charts for both of these categories. A complete changelog can
be found below.

Wishing the best for the new year,

Francesco

---

v2: https://lore.kernel.org/linux-embedded/1955396.7Z3S40VBb9@fedora/
v1: https://lore.kernel.org/linux-embedded/1964175.7Z3S40VBb9@fedora.fritz.box/

Differences v2 -> v3:

- initcalls and probes have been split in different tables
- added identification section (kernel version, machine, cmdline)
- added SVG pie charts for initcalls and probes times to the HTML output
- CSS styling added to HTML output
- added the --before-init option to restrict analysis to the events that
  happen before the init is started
- Markdown output has been dropped

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
initcall_debug command line output is used. It extracts various information,
such as initcall durations, impact of probe deferrals and so on.
"""

import argparse
import random
import re
import sys

ERRCODE_PROBE_DEFER = 517

parser = argparse.ArgumentParser(description='Analyze a Linux kernel dmesg with the initcall_debug option enabled')

parser.add_argument('--dmesg', nargs='?', type=argparse.FileType('r'),
                    default=sys.stdin, help='The dmesg file to analyze (default: stdin)')
format_group = parser.add_mutually_exclusive_group()
format_group.add_argument('--html', action='store_true',
                          help='Output analysis result as HTML table')
parser.add_argument('--body-only', action='store_true',
                    help='Do not add header and footer to HTML output')
parser.add_argument('--before-init', action='store_true',
                    help='Add to analysis only initcalls/probes happening before init')
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
        self._color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
        self._runs = [ Run(start_time, end_time, duration, retval) ]

    @property
    def name(self) -> str:
        return self._name

    @property
    def color(self) -> tuple[int, int, int]:
        return self._color

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

    def addStart(self, start_time: int):
        self._runs.append( Run(start_time) )

    def addEnd(self, end_time:int = 0, duration:int = 0, retval:int = 0):
        self._runs[-1].end_time = end_time
        self._runs[-1].duration = duration
        self._runs[-1].retval = retval

    def addRun(self, start_time: int, end_time:int = 0, duration:int = 0, retval:int = 0):
        self._runs.append( Run(start_time, end_time, duration, retval) )


class Initcall (Entity):
    def __init__(self, name: str, start_time: int, module: str = None):
        super().__init__(name, start_time)
        self._module = module

    @property
    def module(self) -> str:
        return self._module

    def addInit(self, init_time: int):
        self.addStart(init_time)

    def addReturn(self, return_time: int, duration: int, retval: int):
        self.addEnd(return_time, duration, retval)


class Probe (Entity):
    def __init__(self, name: str, return_time: int, duration: int, retval: int):
        super().__init__(name, return_time, return_time, duration, retval)

    @property
    def deferred_probe_pending(self) -> bool:
        return (abs(self._runs[-1].retval) == ERRCODE_PROBE_DEFER)

    @property
    def num_deferred_probes(self) -> int:
        return len(list(filter(lambda r: abs(r.retval) == ERRCODE_PROBE_DEFER, self._runs)))


class Init (Entity):
    def __init__(self, name: str, start_time: int):
        super().__init__(name, start_time)

# Regex for Linux version
# "[    0.000000] Linux version 6.12.0 (oe-user@oe-host) (aarch64-poky-linux-gcc (GCC) 13.3.0, GNU ld (GNU Binutils) 2.42.0.20240723) #1 SMP PREEMPT Sun Nov 17 22:15:08 UTC 2024"
version_sentinel = 'Linux version '
version_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] Linux version (.+)')

# Regex for machine model
# "[    0.000000] Machine model: BeagleBoard.org BeaglePlay"
machine_sentinel = 'Machine model: '
machine_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] Machine model: (.+)')

# Regex for cmdline
# "[    0.000000] Kernel command line: LABEL=Boot root=PARTUUID=076c4a2a-02 rootfstype=ext4 rootwait log_buf_len=10M initcall_debug quiet"
cmdline_sentinel = 'Kernel command line: '
cmdline_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] Kernel command line: (.+)')

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

initcalls = {}
probes = {}
init = None
version = 'Unknown'
machine = 'Unknown'
cmdline = 'Unknown'

# Extract data from dmesg
lineno = 0
for line in args.dmesg:
    lineno += 1

    if version_sentinel in line:
        match = version_prog.match(line)
        if match:
            version = str(match.group(2))
        else:
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as version', file=sys.stderr)

    if machine_sentinel in line:
        match = machine_prog.match(line)
        if match:
            machine = str(match.group(2))
        else:
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as machine', file=sys.stderr)

    if cmdline_sentinel in line:
        match = cmdline_prog.match(line)
        if match:
            cmdline = str(match.group(2))
        else:
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as cmdline', file=sys.stderr)

    if calling_sentinel in line:
        match = calling_prog.match(line)
        if match:
            try:
                time = int(float(match.group(1)) * 1000000.0)
                name = str(match.group(2))
                module = str(match.group(4) or '').replace('[', '').replace(']', '')
            except Exception as e:
                print(f'Failed parsing line {lineno}:"{line.rstrip()}" as call', file=sys.stderr)
                raise e
            else:
                if name not in initcalls.keys():
                    initcalls[name] = Initcall(name, time, module)
                else:
                    initcalls[name].addInit(time)
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
                if name not in initcalls.keys():
                    print(f'Detected return for initcall {name}, for which a call was never recorded', file=sys.stderr)
                else:
                    initcalls[name].addReturn(time, duration, retval)
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
                if args.before_init:
                    break
                else:
                    continue
        else:
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as init', file=sys.stderr)

if len(initcalls) == 0:
    print(f'No initcalls parsed - check your kernel configuration and command line', file=sys.stderr)
    sys.exit(1)

# Print HTML format
if args.html:
    if not args.body_only:
        print(
'''
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
    <title>Boot time analysis</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        .aid-title {
            font-weight: bold;
            font-size: 2em;
            text-align: center;
            padding: 0.5em;
        }

        .aid-piechart-container {
            width: 30%;
            height: 30%;
            margin: 0 auto;
            padding: 1em;
        }

        table, th, td {
            border: 1px solid;
            border-collapse: collapse;
        }

        table {
            text-align: left;
            overflow: hidden;
            width: 80%;
            margin: 0 auto;
            display: table;
        }

        table th {
            font-weight: bold;
            font-size: 1em;
            text-align: center;
        }

        table td, table th {
            padding: 0.4%;
        }

        .aid-status-ok {
            background-color: #77FF77;
        }

        .aid-status-failed {
            background-color: #FF7777;
        }

        .aid-status-deferred {
            background-color: #FFCC77;
        }

        .aid-status-deferred {
            background-color: #CCCCCC;
        }
    </style>
</head>
<body>''')

    # Identification
    print(
f'''
    <div class="aid-title">Identification</div>
    <table>
        <tr>
            <td>Linux version</td>
            <td>{version}</td>
        </tr>
        <tr>
            <td>Machine</td>
            <td>{machine}</td>
        </tr>
        <tr>
            <td>Cmdline</td>
            <td>{cmdline}</td>
        </tr>
    </table>
''')

    # Initcalls
    initcalls_total_time = sum( [ k.duration for k in initcalls.values() ] )

    print(
'''
    <div class="aid-title">Initcalls</div>
''')


    ## Print initcalls pie chart
    print(
'''
    <div class="aid-piechart-container"><svg viewBox="0 0 100 100">
''')

    startPoint = 0
    visible_limit = max([k.duration for k in list(initcalls.values())]) / 100
    for d in sorted(initcalls.values(), key=lambda k: k.duration, reverse=True):
        if d.duration < visible_limit:
            title = "ALL OTHER INITCALLS"
            length = initcalls_total_time - startPoint
        else:
            title = d.name
            length = d.duration

        startPoint = startPoint + length
        print(
f'''
        <a href="#aid-initcall-{d.name}">
            <circle r="25" cx="50" cy="50" fill="none" stroke="#{d.color[0]:02X}{d.color[1]:02X}{d.color[2]:02X}"
                    stroke-width="50" stroke-dasharray="{length} {initcalls_total_time - length}"
                    stroke-dashoffset="{startPoint}" pathLength="{initcalls_total_time}">
                <title>{title}</title>
            </circle>
        </a>
''')
        if d.duration < visible_limit:
            break

    print(
'''
    </svg></div>
''')

    print(
'''
    <table>
        <tr>
            <th>&nbsp;</th>
            <th>Name</th>
            <th>Status</th>
            <th>Duration (us)</th>
            <th>Time in failed calls (us)</th>
            <th>Fraction of total time (%)</th>
            <th>Module</th>
        </tr>''')

    for d in sorted(initcalls.values(), key=lambda k: k.duration, reverse=True):
        run_status = 'RUNNING' if d.running else 'FAILED' if d.failed else 'OK'
        print(
f'''
        <tr id="aid-initcall-{d.name}">
            <td style="background-color: #{d.color[0]:02X}{d.color[1]:02X}{d.color[2]:02X};"></td>
            <td>{d.name}</td>
            <td class="aid-status-{run_status.lower()}">{run_status}{f' ({abs(d.retval)})' if d.failed else ''}</td>
            <td>{d.duration}</td>
            <td>{d.wasted_time}</td>
            <td>{(d.duration * 100 / initcalls_total_time):0.3f}</td>
            <td>{d.module}</td>
        </tr>''')

    print(
'''
    </table>
''')

    # Probes
    probes_total_time = sum([k.duration for k in probes.values()])

    print(
'''
    <div class="aid-title">Probes</div>
''')

    ## Print probes pie chart
    print(
'''
    <div class="aid-piechart-container"><svg viewBox="0 0 100 100">
''')

    startPoint = 0
    visible_limit = max([k.duration for k in list(initcalls.values())]) / 100
    for d in sorted(probes.values(), key=lambda k: k.duration, reverse=True):
        if d.duration < visible_limit:
            title = "ALL OTHER PROBES"
            length = probes_total_time - startPoint
        else:
            title = d.name
            length = d.duration

        startPoint = startPoint + length
        print(
f'''
        <a href="#aid-initcall-{d.name}">
            <circle r="25" cx="50" cy="50" fill="none" stroke="#{d.color[0]:02X}{d.color[1]:02X}{d.color[2]:02X}"
                    stroke-width="50" stroke-dasharray="{length} {probes_total_time - length}"
                    stroke-dashoffset="{startPoint}" pathLength="{initcalls_total_time}">
                <title>{title}</title>
            </circle>
        </a>
''')
        if d.duration < visible_limit:
            break

    print(
'''
    </svg></div>
''')

    ## Print probes table
    print(
'''
    <table>
        <tr>
            <th>&nbsp;</th>
            <th>Name</th>
            <th>Status</th>
            <th>Duration (us)</th>
            <th>Num deferred probes</th>
            <th>Time in failed probes (us)</th>
            <th>Fraction of total time (%)</th>
            <th>After init</th>
        </tr>
''')

    for d in sorted(probes.values(), key=lambda k: k.duration, reverse=True):
        run_status = 'DEFERRED' if d.deferred_probe_pending else 'RUNNING' if d.running else 'FAILED' if d.failed else 'OK'
        after_init = 'YES' if d.last_start_time > init.last_start_time else 'NO'
        print(
f'''
        <tr id="aid-probe-{d.name}">
            <td style="background-color: #{d.color[0]:02X}{d.color[1]:02X}{d.color[2]:02X};"></td>
            <td>{d.name}</td>
            <td class="aid-status-{run_status.lower()}">{run_status}{f' ({abs(d.retval)})' if d.failed else ''}</td>
            <td>{d.duration}</td>
            <td>{d.num_deferred_probes}</td>
            <td>{d.wasted_time}</td>
            <td>{(d.duration * 100 / probes_total_time):0.3f}</td>
            <td>{after_init}</td>
        </tr>''')

    print(
'''
    </table>
''')

    if not args.body_only:
        print(
'''
</body>
</html>
''')

# Print plain text
else:
    num_before_userspace = len(list(filter(lambda d: d.last_start_time <= init.last_start_time, initcalls.values())))
    num_after_userspace = len(list(filter(lambda d: d.last_start_time > init.last_start_time, initcalls.values())))
    num_deferred_probe_pending = len(list(filter(lambda d: d.deferred_probe_pending, list(probes.values()))))
    num_failed = len(list(filter(lambda d: d.failed, list(initcalls.values()) + list(probes.values()))))

    print(f'Linux version: {version}')
    print(f'Machine: {machine}')
    print(f'Command line: {cmdline}')
    print('Summary:')
    print(f'  {len(initcalls)} initcalls have been executed, of which {num_before_userspace} before userspace and {num_after_userspace} after')
    print(f'  {num_deferred_probe_pending} deferred probes are pending')
    print(f'  {num_failed} initcalls/probes failed')

    print('\n---\n')

    print('Top 10 initcall durations:')
    for d in sorted(initcalls.values(), key=lambda k: k.duration, reverse=True)[0:10]:
        print(f' * {d.name} -> {d.duration}us')

    print('\n---\n')

    print('Top 10 probe durations:')
    for d in sorted(probes.values(), key=lambda k: k.duration, reverse=True)[0:10]:
        print(f' * {d.name} -> {d.duration}us')

    print('\n---\n')

    print('Failed initcalls/probes:')
    for d in filter(lambda k: k.failed, list(initcalls.values()) + list(probes.values())):
        print(f' * {d.name} -> ret = -{abs(d.retval)}')



