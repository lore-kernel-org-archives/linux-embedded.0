Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF76C4C85
	for <linux-embedded@vger.kernel.org>; Mon,  3 Mar 2025 01:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740964417; cv=pass; b=oeF6mOj0ayepaa95tAWzrREZZ42EEGFwyG5/llGnS+NloZcHwaUg9XVQEqwzKAl5ENN1MjECW47EJp5LzZTp8gEdgW4Hh1WGA8y2LYWZiPpPbzRwlvaI4rJWYuHdXQbvJDjEpDewTwijTAmlF1xgqQE6UrdqRbhxUhg8NcXFa14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740964417; c=relaxed/simple;
	bh=MgKb6p8O6vFIjZRWyTR9PY0PA1RxzOhjoGqgGDN6UTw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UL/tWB8emMDaJTfzxzs8hQ+11Wh09oNs8MSJD0LyCyr/rm9XI58TQST3JctevswJw4jT/7tK84abfZuZoQ/R6uuhk1n0snuqt4zuDGej+Snta6uuO/Bg0h6GeXsQqk0ifwoRkue0QjsSPlvEELjbSH9LtzJkG1J8DY5llEj8GXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=CC6qD3X1; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="CC6qD3X1"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-32cx.prod.antispam.mailspamprotection.com; s=arckey; t=1740964413;
	 b=bXwdGbuKGeip3Vih65PbRxE1LIMeKd0RWwwRZ+ABpW0Hz99j1WsGKW1JWdAn/1oXsXdJfaBUQP
	  umohd77ux+FLe9AgtxOYW88UFBz3EXemDVYT93ZkcUfn+D1GsxxRvBq8X9+sQiR2NmFFEUMGVb
	  ACGh24JpCfMfC/QDtrA3mXrYKyW7K3xe3CMPId9BnXXmrmQmyWTizvikPapMBqFVRSzEdepYhi
	  SdrkaZox6vkETiJA1TIUz78IhdBUCh7iq9T/inWTDL2s3VGsZn+1x0cP5iBgkqLZxrDl1Kr5my
	  Rj8XxT28eKFsValzIuLUkzv8C8NJ5kmBwzhvLvsitCGnMA==;
ARC-Authentication-Results: i=1; instance-europe-west4-32cx.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-32cx.prod.antispam.mailspamprotection.com; s=arckey; t=1740964413;
	bh=MgKb6p8O6vFIjZRWyTR9PY0PA1RxzOhjoGqgGDN6UTw=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	  To:From:DKIM-Signature;
	b=jCTsTEOB+ZJIZdCxI2QIdwTVBkoOvugF8JU5WANpNhpAK5Ii3ghjOHvNmBYDz5adkNHf/2SR0K
	  t5MB7+lXCfwvzNf5JW341Q1csVKmb5+UG5leDE0qXoBKebep5n8xfklhyAEyf6+604w8danqq2
	  P6Qbtx4kzdKHr54IK3tp09KUuW/e5MMgJqokCQfurl+Q66/g7RyWp0l/ZH3yI+WzvvK7wnVKha
	  Vz9orYk7cTo2yxdiHyAFsDV6+2JsNYXgfE61l9YKXJDCTt495LfZwCcPvUejGGMS10uvUgvgiE
	  ktxxCt2EZWw9Ad1v62en2mhiz2SNIAQbJLmtcAVw22d1WA==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-32cx.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1tot25-0000000D5LR-4BpN
	for linux-embedded@vger.kernel.org;
	Sun, 02 Mar 2025 23:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=OP6NV3m6goU2LkpzBP03lJvs7z3ssycBEe+76zVukJ8=; b=CC6qD3X1/QdvfkFkpxfanCNjkB
	v3DJM562fyGmv9frjSZWXoNVOP0C0GDWCLgnIWTxnw0jyscXEYmxfr7Vo03o+sqa94e2dq7Rv8L+F
	nn57aE5YWUVk5EYFu1oWqehqF1S/Xtqq/s0UBtLkmhixzIpn0KVIY+ZHsvswctp9SJ+4=;
Received: from [87.3.73.4] (port=62213 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1tot20-000000003lO-25uQ
	for linux-embedded@vger.kernel.org;
	Sun, 02 Mar 2025 23:47:36 +0000
From: Francesco Valla <francesco@valla.it>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: [boot-time] [SCRIPT v5] analyze_initcall_debug.py
Date: Mon, 03 Mar 2025 00:47:35 +0100
Message-ID: <3647090.dWV9SEqChM@fedora.fritz.box>
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
X-SGantispam-id: d0a91607bfebd4ebac2961e916c29bb7
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-32cx.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

this is the fifth version of the analyze_initcall_debug.py script, which can
be used to analyze the kernel output when booting with initcall_debug
to extract some human-readable data from it.

This version brings a "compare" option to highlight differences against a
dmesg acting as baseline, as well as an overall re-organization and several
enhancements (special thanks to Brian Masney for the review on the previous
version).

The script is now also available on a dedicated git repository [1], where
examples can also be found (both for text and HTML output).

Regards,

Francesco

[1] https://codeberg.org/fvalla/boottime-tools

---

v4: https://lore.kernel.org/linux-embedded/4927911.OV4Wx5bFTl@fedora.fritz.box/
v3: https://lore.kernel.org/linux-embedded/5640944.lGaqSPkdTl@fedora.fritz.box/
v2: https://lore.kernel.org/linux-embedded/1955396.7Z3S40VBb9@fedora/
v1: https://lore.kernel.org/linux-embedded/1964175.7Z3S40VBb9@fedora.fritz.box/


Differences v4 -> v5:

- added a new "compare" mode 
- errors are now reported using names as well as codes
- added commas as thousands separators
- added top ten causes of probe deferrals to text output
- added GPLv2 license
- misc fixes

Differences v3 -> v4:

- added a SVG bootchart that includes probes and initcalls
- cosmetic fixes

Differences v3 -> v4:

- added a SVG bootchart that includes probes and initcalls
- cosmetic fixes

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

------ the analyze_initcall_debug.py script follows ------

#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-2.0-only
#
# (c) 2024-2025 Francesco Valla <francesco@valla.it>
#

"""
This script can be used to analyze a Linux kernel dmesg output when the
initcall_debug command line output is used. It extracts various information,
such as initcall durations, impact of probe deferrals and so on.
"""

import random
import re
import sys

from typing import Generator, Optional, TextIO

VERSION = '1.0.0'

# Configuration of boot chart SVG graphics
SCALE_SIZE = 25
MARGIN_SIZE = 5
INITCALL_SIZE = 100
PROBE_SIZE = 50
SCALING_US_DIV = 100

ERRCODES = {
    "EPERM" : 1, "ENOENT" : 2, "ESRCH" : 3, "EINTR" : 4, "EIO" : 5, "ENXIO" : 6,
    "E2BIG" : 7, "ENOEXEC" : 8, "EBADF" : 9, "ECHILD" : 10, "EAGAIN" : 11,
    "ENOMEM" : 12, "EACCES" : 13, "EFAULT" : 14, "ENOTBLK" : 15, "EBUSY" : 16,
    "EEXIST" : 17, "EXDEV" : 18, "ENODEV" : 19, "ENOTDIR" : 20, "EISDIR" : 21,
    "EINVAL" : 22, "ENFILE" : 23, "EMFILE" : 24, "ENOTTY" : 25, "ETXTBSY" : 26,
    "EFBIG" : 27, "ENOSPC" : 28, "ESPIPE" : 29, "EROFS" : 30, "EMLINK" : 31,
    "EPIPE" : 32, "EDOM" : 33, "ERANGE" : 34, "EDEADLK" : 35, "ENAMETOOLONG" : 36,
    "ENOLCK" : 37, "ENOSYS" : 38, "ENOTEMPTY" : 39, "ELOOP" : 40, "ENOMSG" : 42,
    "EIDRM" : 43, "ECHRNG" : 44, "EL2NSYNC" : 45, "EL3HLT" : 46, "EL3RST" : 47,
    "ELNRNG" : 48, "EUNATCH" : 49, "ENOCSI" : 50, "EL2HLT" : 51, "EBADE" : 52,
    "EBADR" : 53, "EXFULL" : 54, "ENOANO" : 55, "EBADRQC" : 56, "EBADSLT" : 57,
    "EBFONT" : 59, "ENOSTR" : 60, "ENODATA" : 61, "ETIME" : 62, "ENOSR" : 63,
    "ENONET" : 64, "ENOPKG" : 65, "EREMOTE" : 66, "ENOLINK" : 67, "EADV" : 68,
    "ESRMNT" : 69, "ECOMM" : 70, "EPROTO" : 71, "EMULTIHOP" : 72, "EDOTDOT" : 73,
    "EBADMSG" : 74, "EOVERFLOW" : 75, "ENOTUNIQ" : 76, "EBADFD" : 77, "EREMCHG" : 78,
    "ELIBACC" : 79, "ELIBBAD" : 80, "ELIBSCN" : 81, "ELIBMAX" : 82,"ELIBEXEC" : 83,
    "EILSEQ" : 84, "ERESTART" : 85, "ESTRPIPE" : 86, "EUSERS" : 87, "ENOTSOCK" : 88,
    "EDESTADDRREQ" : 89, "EMSGSIZE" : 90, "EPROTOTYPE" : 91, "ENOPROTOOPT" : 92,
    "EPROTONOSUPPORT" : 93, "ESOCKTNOSUPPORT" : 94, "EOPNOTSUPP" : 95,
    "EPFNOSUPPORT" : 96, "EAFNOSUPPORT" : 97, "EADDRINUSE" : 98, "EADDRNOTAVAIL" : 99,
    "ENETDOWN" : 100, "ENETUNREACH" : 101, "ENETRESET" : 102, "ECONNABORTED" : 103,
    "ECONNRESET" : 104, "ENOBUFS" : 105, "EISCONN" : 106, "ENOTCONN" : 107,
    "ESHUTDOWN" : 108, "ETOOMANYREFS" : 109, "ETIMEDOUT" : 110, "ECONNREFUSED" : 111,
    "EHOSTDOWN" : 112, "EHOSTUNREACH" : 113, "EALREADY" : 114, "EINPROGRESS" : 115,
    "ESTALE" : 116, "EUCLEAN" : 117, "ENOTNAM" : 118, "ENAVAIL" : 119, "EISNAM" : 120,
    "EREMOTEIO" : 121, "EDQUOT" : 122, "ENOMEDIUM" : 123, "EMEDIUMTYPE" : 124,
    "ECANCELED" : 125, "ENOKEY" : 126, "EKEYEXPIRED" : 127, "EKEYREVOKED" : 128,
    "EKEYREJECTED" : 129, "EOWNERDEAD" : 130, "ENOTRECOVERABLE" : 131, "ERFKILL" : 132,
    "EHWPOISON" : 133, "ERESTARTSYS" : 512, "ERESTARTNOINTR" : 513, "ERESTARTNOHAND" : 514,
    "ENOIOCTLCMD" : 515, "ERESTART_RESTARTBLOCK" : 516, "EPROBE_DEFER" : 517,
    "EOPENSTALE" : 518, "ENOPARAM" : 519, "EBADHANDLE" : 521, "ENOTSYNC" : 522,
    "EBADCOOKIE" : 523, "ENOTSUPP" : 524, "ETOOSMALL" : 525, "ESERVERFAULT" : 526,
    "EBADTYPE" : 527, "EJUKEBOX" : 528, "EIOCBQUEUED" : 529, "ERECALLCONFLICT" : 530,
    "ENOGRACE" : 531,
}


def err_name(errcode: int):
    """
    Transform numeric error code into error name
    """
    for key,val in ERRCODES.items():
        if abs(errcode) == val:
            return key
    return 'UNKNOWN'


def print_duration(_duration: int, scale: int = 1, unit: str = ''):
    """
    Print duration with pretty format (i.e.: with thousands separators)
    """
    return f"{_duration // scale:,}{unit:s}"


def print_duration_diff(_baseline: int, _duration: int, scale: int = 1, unit: str = ''):
    """
    Print duration difference with pretty format (i.e.: with thousands separators)
    """
    return f"{(_duration - _baseline) // scale:+,}{unit:s}"


class Run:
    """
    Single run of a runnable entity.
    """
    def __init__(self, _start_time:int, _end_time:int = -1, _duration:int = 0, _retval:int = 0):
        self._start_time = _start_time
        self._end_time = _end_time
        self._duration = _duration
        self._retval = _retval
        self._ended = _end_time >= 0

    @property
    def start_time(self) -> int:
        """
        Start time of the run, in microseconds.
        """
        return self._start_time

    @property
    def end_time(self) -> int:
        """
        End time of the run, in microseconds.
        """
        return self._end_time

    @end_time.setter
    def end_time(self, _time:int):
        self._end_time = _time
        self._ended = True

    @property
    def duration(self) -> int:
        """
        Duration of the run, in microseconds.
        """
        return self._duration

    @duration.setter
    def duration(self, _time:int):
        self._duration = _time

    @property
    def retval(self) -> int:
        """
        Return value for the run.
        """
        return self._retval

    @retval.setter
    def retval(self, val:int):
        self._retval = val

    @property
    def running(self) -> bool:
        """
        Whether the run is still running at the end of the data sampling.
        """
        return not self._ended

    @property
    def failed(self) -> bool:
        """
        Whether the run has failed (i.e., its return code is not zero).
        """
        return ((self.retval != 0) and not self.running)

    def running_at(self, _time: int) -> bool:
        """
        Whether the run is running at the given time.
        """
        return (self.start_time < _time and (self._end_time > _time or not self._ended))


class Entity:
    """
    Generic runnable entity.
    """
    def __init__(self, _name:str, _start_time:int = 0, _end_time:int = 0, _duration:int = 0, _retval:int = 0):
        self._name = _name
        self._color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
        self._runs = [ Run(_start_time, _end_time, _duration, _retval) ]

    @property
    def name(self) -> str:
        """
        Name of the runnable entity.
        """
        return self._name

    @property
    def color(self) -> tuple[int, int, int]:
        """
        Color associated to the entity.
        """
        return self._color

    @property
    def first_start_time(self) -> int:
        """
        Start time of the first run of the entity.
        """
        return self._runs[0].start_time

    @property
    def last_start_time(self) -> int:
        """
        Start time of the last run of the entity.
        """
        return self._runs[-1].start_time

    @property
    def first_end_time(self) -> int:
        """
        End time of the first run of the entity.
        """
        return self._runs[0].end_time

    @property
    def last_end_time(self) -> int:
        """
        End time of the last run of the entity.
        """
        return self._runs[-1].end_time

    @property
    def duration(self) -> int:
        """
        Sum of the durations of all the runs for the entity.
        """
        return sum(r.duration for r in self._runs)

    @property
    def wasted_time(self) -> int:
        """
        Sum of the durations of all the failed runs for the entity.
        """
        return sum(r.duration for r in filter(lambda x: x.failed or abs(x.retval) == ERRCODES['EPROBE_DEFER'], self._runs))

    @property
    def retval(self) -> int:
        """
        Return value of the last run.
        """
        return self._runs[-1].retval

    @property
    def failed(self) -> bool:
        """
        Wheter the last run has failed.
        """
        return self._runs[-1].failed

    @property
    def running(self) -> bool:
        """
        Wheter the last run is still running.
        """
        return self._runs[-1].running

    def running_at(self, _time: int) -> bool:
        """
        Wheter the entity was running at the given time.
        """
        for _r in self.runs:
            if _r.start_time <= _time < _r.end_time:
                return True
        return False

    @property
    def runs(self) -> Generator[Run]:
        """
        Raw access to the runs for the entity.
        """
        yield from self._runs


class Initcall (Entity):
    """
    Driver initcall.
    """
    def __init__(self, _name: str, _start_time: int, _module: str = None):
        super().__init__(_name, _start_time)
        self._module = _module

    def add_start(self, start_time: int):
        """
        Add initcall start.
        """
        self._runs.append(Run(start_time))

    def add_end(self, _end_time:int = 0, _duration:int = 0, _retval:int = 0):
        """
        Add initcall end.
        """
        self._runs[-1].end_time = _end_time
        self._runs[-1].duration = _duration
        self._runs[-1].retval = _retval

    @property
    def module(self) -> str:
        """
        Module the initcall has run from (None if built-in).
        """
        return self._module


class Probe (Entity):
    """
    Device probe.
    """
    def __init__(self, _name: str, _start_time: int, _duration: int = 0, _retval: int = 0):
        super().__init__(_name, _start_time, _start_time + _duration, _duration, _retval)

    def add_run(self, _start_time: int, _end_time:int = 0, _duration:int = 0, _retval:int = 0):
        """
        Add probe iteration.
        """
        self._runs.append(Run(_start_time, _end_time, _duration, _retval))

    @property
    def deferred_probe_pending(self) -> bool:
        """
        Wheter a deferred probe is pending for the device.
        """
        return abs(self._runs[-1].retval) == ERRCODES['EPROBE_DEFER']

    @property
    def num_deferred_probes(self) -> int:
        """
        Number of deferred probe for the device.
        """
        return len(list(filter(lambda r: abs(r.retval) == ERRCODES['EPROBE_DEFER'], self._runs)))


class Init (Entity):
    """
    Init process execution.
    """
    def __init__(self, _name: str, _start_time: int):
        super().__init__(_name, _start_time)


class Data:
    """
    Data storage.
    """
    def __init__(self):
        self._initcalls = {}
        self._probes = {}
        self._init = None
        self._version = 'Unknown'
        self._machine = 'Unknown'
        self._cmdline = 'Unknown'

    @property
    def initcalls(self) -> Generator[Initcall]:
        """
        Driver initcalls.
        """
        yield from self._initcalls.values()

    @property
    def probes(self) -> Generator[Probe]:
        """
        Device probes.
        """
        yield from self._probes.values()

    @property
    def init(self) -> Init:
        """
        Init invocation.
        """
        return self._init

    @property
    def version(self) -> str:
        """
        Kernel version.
        """
        return self._version

    @version.setter
    def version(self, _version: str):
        self._version = _version

    @property
    def machine(self) -> str:
        """
        Machine the kernel is executing on.
        """
        return self._machine

    @machine.setter
    def machine(self, _machine: str):
        self._machine = _machine

    @property
    def cmdline(self) -> str:
        """
        Kernel command line.
        """
        return self._cmdline

    @cmdline.setter
    def cmdline(self, _cmdline: str):
        self._cmdline = _cmdline

    def add_initcall_start(self, _name: str, _time: int, _module):
        """
        Add initcall start to the data storage.
        """
        if _name not in self._initcalls:
            self._initcalls[_name] = Initcall(_name, _time, _module)
        else:
            self._initcalls[_name].add_start(_time)

    def add_initcall_return(self, _name: str, _time: int, _duration: int, _retval: int):
        """
        Add initcall return to the data storage.
        """
        if _name in self._initcalls:
            self._initcalls[_name].add_end(_time, _duration, _retval)

    def add_probe_return(self, _name: str, _end_time: int, _duration: int, _retval: int):
        """
        Add probe return to the data storage.
        """
        start_time =  _end_time - _duration
        if _name not in self._probes:
            self._probes[_name] = Probe(_name, start_time, _duration, _retval)
        else:
            self._probes[_name].add_run(start_time, _end_time, _duration, _retval)

    def add_init_invocation(self, _name: str, _time: int):
        """
        Add init invocation to the data storage.
        """
        self._init = Init(_name, _time)

    @property
    def num_initcalls(self) -> int:
        """
        Number of initcalls inside the data storage.
        """
        return len(self._initcalls)

    def has_initcalls(self) -> bool:
        """
        At least one initcall has been added to the data storage.
        """
        return len(self._initcalls) > 0

    def get_initcall(self, _name: str) -> Optional[Initcall]:
        """
        Return initcall with given name.
        """
        return self._initcalls.get(_name, None)

    @property
    def num_probes(self) -> int:
        """
        Number of probes inside the data storage.
        """
        return len(self._probes)

    def has_probes(self) -> bool:
        """
        At least one probe has been added to the data storage.
        """
        return len(self._probes) > 0

    def get_probe(self, _name: str) -> Optional[Probe]:
        """
        Return probe with given name.
        """
        return self._probes.get(_name, None)

    def probes_running_at(self, _time: int) -> Generator[Probe]:
        """
        Probes running at the given time.
        """
        return filter(lambda k: k.running_at(_time), self._probes.values())

    def num_probes_running_at(self, _time: int) -> int:
        """
        Number of probes running at the given time.
        """
        return len(list(self.probes_running_at(_time)))

    @property
    def num_deferred_probes_pending(self) -> int:
        """
        Number of pending deferred probes.
        """
        return len(list(filter(lambda d: d.deferred_probe_pending, self._probes.values())))

    @property
    def total_boot_time(self) -> int:
        """
        Total measured kernel boot time (that is, end of last initcall/probe).
        """
        return max(max(k.last_end_time for k in self._initcalls.values()), max(k.last_end_time for k in self._probes.values()))

    @property
    def init_start_time(self) -> init:
        """
        Init start time.
        """
        return self._init.last_start_time

    @property
    def num_initcalls_before_init(self) -> int:
        """
        Number of initcalls run before init.
        """
        return len(list(filter(lambda d: d.last_start_time <= self.init_start_time, self._initcalls.values())))

    @property
    def num_failed_calls(self) -> int:
        """
        Number of failed calls (either initcalls or probes).
        """
        return len(list(filter(lambda d: d.failed, list(self._initcalls.values()) + list(self._probes.values()))))


# Regex for Linux version
# "[    0.000000] Linux version 6.12.0 (oe-user@oe-host) (aarch64-poky-linux-gcc (GCC) 13.3.0, GNU ld (GNU Binutils) 2.42.0.20240723) #1 SMP PREEMPT Sun Nov 17 22:15:08 UTC 2024"
SENTINEL_VERSION = 'Linux version '
version_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] Linux version (.+)')

# Regex for machine model
# "[    0.000000] Machine model: BeagleBoard.org BeaglePlay"
SENTINEL_MACHINE = 'Machine model: '
machine_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\](?: OF: fdt:)? Machine model: (.+)')

# Regex for cmdline
# "[    0.000000] Kernel command line: LABEL=Boot root=PARTUUID=076c4a2a-02 rootfstype=ext4 rootwait log_buf_len=10M initcall_debug quiet"
SENTINEL_CMDLINE = 'Kernel command line: '
cmdline_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] Kernel command line: (.+)')

# Regex for 'calling' messages
# "[    0.466115] calling  pci_sysfs_init+0x0/0xa8 @ 1"
SENTINEL_CALLING = 'calling  '
calling_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] calling  ([0-9a-zA-Z_]+)\+(0x[0-9a-fA-F]+\/0x[0-9a-fA-F]+)( \[[a-zA-Z0-9\-_]+\])? @ ([0-9]+)')

# Regex for 'initcall ... returned' messages
# "[    0.466115] initcall pci_sysfs_init+0x0/0xa8 returned 0 after 5 usecs"
SENTINEL_INITCALL_RETURN = 'initcall '
returned_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] initcall ([0-9a-zA-Z_]+)\+(0x[0-9a-fA-F]+\/0x[0-9a-fA-F]+)( \[[a-zA-Z0-9\-_]+\])? returned ([\-0-9]+) after ([0-9]+) usecs')

# Regex for 'probe ... returned' messages
# "[    0.466115] probe of cpufreq-dt returned 517 after 140 usec"
SENTINEL_PROBE = 'probe of '
probe_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] probe of ([0-9a-zA-Z_\-\.\:@]+) returned ([\-0-9]+) after ([0-9]+) usecs')

# Regex for
# "[    1.060329] Run /sbin/init as init process"
SENTINEL_INIT = 'as init process'
init_prog = re.compile(r'\[([0-9\s]+\.[0-9]+)\] Run ([/0-9a-zA-Z_]+) as init process')


def output_html(outfile: TextIO, data: Data, compare: Data = Data(), body_only: bool = False):
    """
    Produce HTML output.
    """

    if not body_only:
        print(
'''
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
    <title>Boot time analysis</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        footer {
            font-weight: bold;
            text-align: center;
            color: #777777;
            padding: 1em;
        }

        .aid-title {
            font-weight: bold;
            font-size: 2em;
            text-align: center;
            padding: 0.5em;
        }

        .aid-bootchart-container {
            width: 80%;
            margin: 0 auto;
            overflow: auto;
        }

        .aid-bootchart-element:hover {
            stroke: red;
        }

        .aid-piechart-container {
            width: 30%;
            height: 30%;
            margin: 0 auto;
            padding: 1em;
        }

        table, th, td {
            border: 1px solid #000000;
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

        .cmp_less {
            color: #22AA22;
        }

        .cmp_more {
            color: #AA2222;
        }
    </style>
</head>
<body>''', file=outfile)

    def print_compare_class(_data_value: int, _baseline_value: Optional[int]) -> str:
        if _baseline_value and _baseline_value != _data_value:
            return 'cmp_more' if _data_value > _baseline_value else 'cmp_less'
        return ''

    def print_compare_diff(_data_value: int, _baseline_value: Optional[int], scale: int = 1, unit: str = '') -> str:
        if _baseline_value and _baseline_value != _data_value:
            return f' [{print_duration_diff(_baseline_value, _data_value, scale, unit)}]'
        return ''

    # Identification
    print(
f'''
    <div class="aid-title">Identification &amp; Summary </div>
    <table>
        <tr>
            <td>Linux version</td>
            <td>{data.version}</td>
        </tr>
        <tr>
            <td>Machine</td>
            <td>{data.machine}</td>
        </tr>
        <tr>
            <td>Command line</td>
            <td>{data.cmdline}</td>
        </tr>
        <tr>
            <td>Total boot time</td>
            <td class="{print_compare_class(data.total_boot_time, compare.total_boot_time if compare.has_initcalls() else None)}">
                {print_duration(data.total_boot_time, 1000, "ms")}
                {print_compare_diff(data.total_boot_time, compare.total_boot_time if compare.has_initcalls() else None, 1000, "ms")}
            </td>
        </tr>
        <tr>
            <td>Init start time</td>
            <td class="{print_compare_class(data.init_start_time, compare.init_start_time if compare.has_initcalls() else None)}">
                {print_duration(data.init_start_time, 1000, "ms")}
                {print_compare_diff(data.init_start_time, compare.init_start_time if compare.has_initcalls() else None, 1000, "ms")}
            </td>
        </tr>
    </table>
''', file=outfile)

    # Boot chart

    ## Determine the peak number of probes running in parallel
    max_par_probes = max(max(data.num_probes_running_at(r.start_time) for r in p.runs) for p in data.probes)
    bootchart_height = SCALE_SIZE + MARGIN_SIZE + INITCALL_SIZE + MARGIN_SIZE + (PROBE_SIZE + MARGIN_SIZE) * max_par_probes
    bootchart_length = max(max(k.last_end_time for k in data.initcalls), max(k.last_end_time for k in data.probes))

    print(
f'''
    <div class="aid-title">Bootchart</div>
    <div class="aid-bootchart-container" style="height: {min(480, bootchart_height + SCALE_SIZE)}px">
        <svg width="{bootchart_length // SCALING_US_DIV}" height="{bootchart_height}">
            <style>
                .small {{
                  font: bold {SCALE_SIZE / 2}px sans-serif;
                }}
            </style>
''', file=outfile)

    ## Plot scale
    for n in range(int(bootchart_length / (1000 * 50)) + 1):
        x = n * (1000 * 50) // SCALING_US_DIV
        print(
f'''
            <text x="{x}" y="{SCALE_SIZE / 2}" fill="#999999" class="small">{n * 50}ms</text>
            <line x1="{x}" x2="{x}" y1="{SCALE_SIZE}" y2="{bootchart_height}" stroke="#999999"/>
''', file=outfile)
        for _ in range(1,5):
            x += (1000 * 10) // SCALING_US_DIV
            print(
f'''
            <line x1="{x}" x2="{x}" y1="{SCALE_SIZE}" y2="{bootchart_height}" stroke="#CCCCCC" stroke-dasharray="10,15" />
''', file=outfile)

    y_offset = SCALE_SIZE + MARGIN_SIZE

    ## Plot initcalls (ignore those with duration equal to 0)
    for d in sorted(list(filter(lambda i: i.duration > 0, data.initcalls)), key=lambda k: k.first_start_time):
        print(
f'''
            <a href="#aid-initcall-{d.name}">
                <rect class="aid-bootchart-element" width="{max(d.duration // SCALING_US_DIV, 1)}" height="{INITCALL_SIZE}" \
                 x="{d.first_start_time // SCALING_US_DIV}" y="{y_offset}" fill="#{d.color[0]:02X}{d.color[1]:02X}{d.color[2]:02X}">
                    <title>Initcall: {d.name}</title>
                </rect>
            </a>
''', file=outfile)

    ## Plot initcalls container and label
    print(
f'''
            <text x="{MARGIN_SIZE}" y="{y_offset + SCALE_SIZE / 2}" fill="#999999" class="small">INITCALLS</text>
            <line x1="0" y1="{y_offset}" x2="{bootchart_length // SCALING_US_DIV}" y2="{y_offset}" stroke="#555555" />
            <line x1="0" y1="{y_offset + INITCALL_SIZE}" x2="{bootchart_length // SCALING_US_DIV}" y2="{y_offset + INITCALL_SIZE}" stroke="#555555" />
''', file=outfile)

    ## Plot probes
    if data.has_probes():
        y_offset = SCALE_SIZE + MARGIN_SIZE + INITCALL_SIZE + MARGIN_SIZE

        ## Position probes along the Y axis to avoid overlaps: for each new
        ## run, check where the other concurrent probes have been positioned,
        ## using a dictionary (-> slots) to store all the positions
        slots = {}
        for d in sorted(list(data.probes), key=lambda k: k.first_start_time):
            for i,r in enumerate(d.runs):
                for pos in range(max_par_probes):
                    free = True
                    for p in data.probes_running_at(r.start_time):
                        for ipr,pr in enumerate(p.runs):
                            if pr.running_at(r.start_time) and slots.get(f'{p.name}-r{ipr}', -1) == pos:
                                free = False
                                break
                    if free:
                        slots[f'{d.name}-r{i:d}'] = pos
                        ypos = pos
                        break
                else:
                    print(f'BUG: cannot place probe {d.name} run {i:d}', file=sys.stderr)
                    ypos = 0

                print(
f'''
            <a href="#aid-probe-{d.name}">
                <rect class="aid-bootchart-element" width="{max(r.duration // SCALING_US_DIV, 1)}" height="{PROBE_SIZE}" \
                 x="{r.start_time // SCALING_US_DIV}" y="{y_offset + (PROBE_SIZE + MARGIN_SIZE) * ypos}" fill="#{d.color[0]:02X}{d.color[1]:02X}{d.color[2]:02X}">
                    <title>Probe: {d.name}</title>
                </rect>
            </a>
''', file=outfile)

        ## Plot probes label
        print(
f'''
            <text x="{MARGIN_SIZE}" y="{y_offset + SCALE_SIZE / 2}" fill="#999999" class="small">PROBES</text>
''', file=outfile)

    ## Plot init startup marker and label
    x = data.init_start_time // SCALING_US_DIV
    print(
f'''
            <text x="{x}" y="{SCALE_SIZE / 2}" fill="#FF0000" class="small">Init start</text>
            <line x1="{x}" x2="{x}" y1="{SCALE_SIZE}" y2="{bootchart_height}" stroke="#FF0000" />
''', file=outfile)

    print(
'''
        </svg>
    </div>
''', file=outfile)

    # Initcalls
    initcalls_total_time = sum(k.duration for k in data.initcalls)

    print(
'''
    <div class="aid-title">Initcalls</div>
''', file=outfile)


    ## Print initcalls pie chart
    print(
'''
    <div class="aid-piechart-container"><svg viewBox="0 0 100 100">
''', file=outfile)

    start_point = 0
    visible_limit = max(k.duration for k in list(data.initcalls)) / 100
    for d in sorted(data.initcalls, key=lambda k: k.duration, reverse=True):
        if d.duration < visible_limit:
            title = "ALL OTHER INITCALLS"
            length = initcalls_total_time - start_point
        else:
            title = d.name
            length = d.duration

        start_point = start_point + length
        print(
f'''
        <a href="#aid-initcall-{d.name}">
            <circle r="25" cx="50" cy="50" fill="none" stroke="#{d.color[0]:02X}{d.color[1]:02X}{d.color[2]:02X}"
                    stroke-width="50" stroke-dasharray="{length} {initcalls_total_time - length}"
                    stroke-dashoffset="{start_point}" pathLength="{initcalls_total_time}">
                <title>{title}</title>
            </circle>
        </a>
''', file=outfile)
        if d.duration < visible_limit:
            break

    print(
'''
    </svg></div>
''', file=outfile)

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
        </tr>''', file=outfile)

    for d in sorted(data.initcalls, key=lambda k: k.duration, reverse=True):
        run_status = 'RUNNING' if d.running else 'FAILED' if d.failed else 'OK'
        cmp_d = compare.get_initcall(d.name)
        print(
f'''
        <tr id="aid-initcall-{d.name}">
            <td style="background-color: #{d.color[0]:02X}{d.color[1]:02X}{d.color[2]:02X};"></td>
            <td>{d.name}</td>
            <td class="aid-status-{run_status.lower()}">{run_status}{f' (-{err_name(d.retval)})' if d.failed else ''}</td>
            <td class="{print_compare_class(d.duration, cmp_d.duration if cmp_d else None)}">
                {print_duration(d.duration)}
                {print_compare_diff(d.duration, cmp_d.duration if cmp_d else None)}
            </td>
            <td class="{print_compare_class(d.wasted_time, cmp_d.wasted_time if cmp_d else None)}">
                {d.wasted_time}
                {print_compare_diff(d.wasted_time, cmp_d.wasted_time if cmp_d else None)}
            </td>
            <td>{(d.duration * 100 / initcalls_total_time):0.3f}</td>
            <td>{d.module}</td>
        </tr>''', file=outfile)

    print(
'''
    </table>
''', file=outfile)

    if data.has_probes():
        # Probes
        probes_total_time = sum(k.duration for k in data.probes)

        print(
'''
    <div class="aid-title">Probes</div>
''', file=outfile)

        ## Print probes pie chart
        print(
'''
    <div class="aid-piechart-container"><svg viewBox="0 0 100 100">
''', file=outfile)

        start_point = 0
        visible_limit = max(k.duration for k in list(data.initcalls)) / 100
        for d in sorted(data.probes, key=lambda k: k.duration, reverse=True):
            if d.duration < visible_limit:
                title = "ALL OTHER PROBES"
                length = probes_total_time - start_point
            else:
                title = d.name
                length = d.duration

            start_point = start_point + length
            print(
f'''
        <a href="#aid-initcall-{d.name}">
            <circle r="25" cx="50" cy="50" fill="none" stroke="#{d.color[0]:02X}{d.color[1]:02X}{d.color[2]:02X}"
                    stroke-width="50" stroke-dasharray="{length} {probes_total_time - length}"
                    stroke-dashoffset="{start_point}" pathLength="{initcalls_total_time}">
                <title>{title}</title>
            </circle>
        </a>
''', file=outfile)
            if d.duration < visible_limit:
                break

        print(
'''
    </svg></div>
''', file=outfile)

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
''', file=outfile)

        for d in sorted(data.probes, key=lambda k: k.duration, reverse=True):
            run_status = 'DEFERRED' if d.deferred_probe_pending else 'RUNNING' if d.running else 'FAILED' if d.failed else 'OK'
            after_init = 'YES' if d.last_start_time > data.init_start_time else 'NO'
            cmp_d = compare.get_probe(d.name)
            print(
f'''
        <tr id="aid-probe-{d.name}">
            <td style="background-color: #{d.color[0]:02X}{d.color[1]:02X}{d.color[2]:02X};"></td>
            <td>{d.name}</td>
            <td class="aid-status-{run_status.lower()}">{run_status}{f' (-{err_name(d.retval)})' if d.failed else ''}</td>
            <td class="{print_compare_class(d.duration, cmp_d.duration if cmp_d else None)}">
                {print_duration(d.duration)}
                {print_compare_diff(d.duration, cmp_d.duration if cmp_d else None)}
            </td>
            <td class="{print_compare_class(d.num_deferred_probes, cmp_d.num_deferred_probes if cmp_d else None)}">
                {print_duration(d.num_deferred_probes)}
                {print_compare_diff(d.num_deferred_probes, cmp_d.num_deferred_probes if cmp_d else None)}
            </td>
            <td class="{print_compare_class(d.wasted_time, cmp_d.wasted_time if cmp_d else None)}">
                {print_duration(d.wasted_time)}
                {print_compare_diff(d.wasted_time, cmp_d.wasted_time if cmp_d else None)}
            </td>
            <td>{(d.duration * 100 / probes_total_time):0.3f}</td>
            <td>{after_init}</td>
        </tr>''', file=outfile)

        print(
'''
    </table>
''', file=outfile)

    if not body_only:
        print(
f'''
<footer>Generated by ananlyze_initcall_debug.py v{VERSION}</footer>
</body>
</html>
''', file=outfile)


def output_text(outfile: TextIO, data: Data, compare: Data = Data()):
    """
    Produce text output.
    """

    print(f'Linux version: {data.version}', file=outfile)
    print(f'Machine: {data.machine}', file=outfile)
    print(f'Command line: {data.cmdline}', file=outfile)
    print('Summary:', file=outfile)
    print(f'  {data.num_initcalls:d} initcalls have been executed, '\
          f'of which {data.num_initcalls_before_init} before init '\
          f'and {data.num_initcalls - data.num_initcalls_before_init} after', file=outfile)
    print(f'  {data.num_deferred_probes_pending:d} deferred probes are pending', file=outfile)
    print(f'  {data.num_failed_calls:d} initcalls/probes failed', file=outfile)

    if compare.has_initcalls():
        total_boot_time_diff = f' [{print_duration_diff(compare.total_boot_time, data.total_boot_time, 1000, "ms")} vs baseline]'
        init_start_time_diff = f' [{print_duration_diff(compare.init_start_time, data.init_start_time, 1000, "ms")} vs baseline]'
    else:
        total_boot_time_diff = ''
        init_start_time_diff = ''
    print(f'  Total boot time: {print_duration(data.total_boot_time, 1000, "ms")}{total_boot_time_diff:s}', file=outfile)
    print(f'  Init start time: {print_duration(data.init_start_time, 1000, "ms")}{init_start_time_diff:s}', file=outfile)

    print('\n---\n', file=outfile)

    print('Top 10 initcall durations:', file=outfile)
    for d in sorted(data.initcalls, key=lambda k: k.duration, reverse=True)[0:10]:
        baseline = compare.get_initcall(d.name)
        if baseline:
            compare_diff = f' [{print_duration_diff(baseline.duration, d.duration, unit="us")} vs baseline]'
        elif compare.has_initcalls():
            compare_diff = ' [not present in baseline]'
        else:
            compare_diff = ''
        print(f' * {d.name} -> {print_duration(d.duration, unit="us")}{compare_diff:s}', file=outfile)

    print('\n---\n', file=outfile)

    print('Top 10 probe durations:', file=outfile)
    for d in sorted(data.probes, key=lambda k: k.duration, reverse=True)[0:10]:
        baseline = compare.get_probe(d.name)
        if baseline:
            compare_diff = f' [{print_duration_diff(baseline.duration, d.duration, unit="us")} vs baseline]'
        elif compare.has_probes():
            compare_diff = ' [not present in baseline]'
        else:
            compare_diff = ''
        print(f' * {d.name} -> {print_duration(d.duration, unit="us")}{compare_diff:s}', file=outfile)

    print('\n---\n', file=outfile)

    print('Top 10 probe deferral causes:', file=outfile)
    for d in sorted(data.probes, key=lambda k: k.num_deferred_probes, reverse=True)[0:10]:
        baseline = compare.get_probe(d.name)
        if baseline:
            compare_diff = f' [{print_duration_diff(baseline.num_deferred_probes, d.num_deferred_probes)} vs baseline]'
        elif compare.has_probes():
            compare_diff = ' [not present in baseline]'
        else:
            compare_diff = ''
        print(f' * {d.name} -> {d.num_deferred_probes}{compare_diff:s}', file=outfile)

    print('\n---\n', file=outfile)

    print('Failed initcalls/probes:', file=outfile)
    for d in filter(lambda k: k.failed, list(data.initcalls) + list(data.probes)):
        print(f' * {d.name} -> -{err_name(d.retval)} (-{abs(d.retval)})', file=outfile)


def parse_dmesg(infile: TextIO, before_init: bool = False) -> Data:
    """
    Parse dmesg input data.
    """
    data = Data()

    # Extract data from dmesg
    for lineno,line in enumerate(infile):
        if SENTINEL_VERSION in line:
            match = version_prog.match(line)
            if match:
                data.version = str(match.group(2))
                continue
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as version', file=sys.stderr)

        if SENTINEL_MACHINE in line:
            match = machine_prog.match(line)
            if match:
                data.machine = str(match.group(2))
                continue
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as machine', file=sys.stderr)

        if SENTINEL_CMDLINE in line:
            match = cmdline_prog.match(line)
            if match:
                data.cmdline = str(match.group(2))
                continue
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as cmdline', file=sys.stderr)

        if SENTINEL_CALLING in line:
            match = calling_prog.match(line)
            if match:
                try:
                    time = int(float(match.group(1)) * 1000000.0)
                    name = str(match.group(2))
                    module = str(match.group(4) or '').replace('[', '').replace(']', '')
                    data.add_initcall_start(name, time, module)
                except ValueError:
                    print(f'Failed parsing line {lineno}:"{line.rstrip()}" as call', file=sys.stderr)
                except Exception as e:
                    raise e
                continue
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as call', file=sys.stderr)

        if SENTINEL_INITCALL_RETURN in line:
            match = returned_prog.match(line)
            if match:
                try:
                    time = int(float(match.group(1)) * 1000000.0)
                    name = str(match.group(2))
                    retval = int(match.group(5))
                    duration = int(match.group(6))
                    data.add_initcall_return(name, time, duration, retval)
                except ValueError:
                    print(f'Failed parsing line {lineno}:"{line.rstrip()}" as call return', file=sys.stderr)
                except Exception as e:
                    raise e
                continue
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as call return', file=sys.stderr)

        if SENTINEL_PROBE in line:
            match = probe_prog.match(line)
            if match:
                try:
                    end_time = int(float(match.group(1)) * 1000000.0)
                    name = str(match.group(2))
                    retval = int(match.group(3))
                    duration = int(match.group(4))
                    data.add_probe_return(name, end_time, duration, retval)
                except ValueError:
                    print(f'Failed parsing line {lineno}:"{line.rstrip()}" as probe return', file=sys.stderr)
                except Exception as e:
                    raise e
                continue
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as probe return', file=sys.stderr)

        if SENTINEL_INIT in line:
            match = init_prog.match(line)
            if match:
                try:
                    time = int(float(match.group(1)) * 1000000.0)
                    name = str(match.group(2))
                    data.add_init_invocation(name, time)
                except ValueError:
                    print(f'Failed parsing line {lineno}:"{line.rstrip()}" as init', file=sys.stderr)
                except Exception as e:
                    raise e

                if before_init:
                    break

                continue
            print(f'Failed matching line {lineno}:"{line.rstrip()}" as init', file=sys.stderr)

    return data


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='Analyze a Linux kernel dmesg with the initcall_debug option enabled')

    parser.add_argument('--version', action='version', version=f'%(prog)s {VERSION}')

    parser.add_argument('--dmesg', nargs='?', type=argparse.FileType('r'),
                        default=sys.stdin, help='The dmesg file to analyze (default: stdin)')
    parser.add_argument('--compare', type=argparse.FileType('r'),
                        default=None, help='The dmesg file to use as comparison baseline (default: None)')
    parser.add_argument('--output', nargs='?', type=argparse.FileType('w'),
                        default=sys.stdout, help='Output file (default: stdout)')

    format_group = parser.add_mutually_exclusive_group()
    format_group.add_argument('--html', action='store_true',
                              help='Output analysis result as HTML tables and SVG graphs')
    parser.add_argument('--body-only', action='store_true',
                        help='Do not add header and footer to HTML output')
    parser.add_argument('--before-init', action='store_true',
                        help='Add to analysis only initcalls/probes happening before init')
    args = parser.parse_args()

    # Create data storage
    dmesg_data = parse_dmesg(args.dmesg, args.before_init)

    if args.compare:
        compare_data = parse_dmesg(args.compare, args.before_init)
    else:
        compare_data = Data()

    if not dmesg_data.has_initcalls():
        print('No initcalls parsed - check your kernel configuration and command line', file=sys.stderr)
        sys.exit(1)

    if args.html:
        output_html(args.output, dmesg_data, compare_data, body_only=args.body_only)
    else:
        output_text(args.output, dmesg_data, compare_data)



