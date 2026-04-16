Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7715638A71B
	for <linux-embedded@vger.kernel.org>; Thu, 16 Apr 2026 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327944; cv=pass; b=qMZ3Ro8gnoxtHMs8m8v6Ubi5zjprWN3qoQJjHbqYSTGschY5Tfz30+fuspHA22FXqwpfa1W1cG+ypX+UAdTTFv3Y1gy/xkgQSV3oNldNULn0vIVumxWt8ysBNnELJzSskTV8snZJdlTUOCxJcf4xvfiQvHYeY3CFHzxEC/iV8A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327944; c=relaxed/simple;
	bh=d1+niOfxWymXmSU1g7VVVZG79aF/dN9cRi/Mntn/DaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nncu0IvIOaW/iwrM6etXKXn2PyFt6Uk3ws6xG98GB2Nm8tI62rB8GA12GKTpiCSgaEy2/8s2ukHihADm9P1IUWMdJ3pu5hm75o+VvtInD84xk0qDtPA9SLUdvhvGRJqRmJXlIGdofc+mbjwS0xkN4ujT2bWD6OKXctyPJeIlDgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpkvR2Zv; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpkvR2Zv"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79495b1aaa7so81534367b3.1
        for <linux-embedded@vger.kernel.org>; Thu, 16 Apr 2026 01:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776327941; cv=none;
        d=google.com; s=arc-20240605;
        b=NYLVg5lLEyeRK3XEJwYvzp/wGE9q/0ux9pJ4YP476avDgQHF1RmzzSrClpIefg7f1A
         yFIOZyeSdWgL4WIH8ATka05yx+esQisdSy12REpvxwxanzkDu5F0SzzRbpbsZyRda3xP
         A1nANvGNPoWh7rTQ1WVszdAgBYeene8BwI3KiVUWJLm9YGXInTkFEmiY6JqOVo6GHEck
         ZzV8AHVflkXrCRhnvvVPsr1H1OM4FiXDFPHpPZMxxGWlYD9eK92UY7dP2mGvjjxpdc/5
         3yNz2Uh5DXavgnU5Qsisi26QKSp9jqmP/tmJewyaXrY8GXaEbgRNirt1wyoBWhaxpILj
         +3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VM9L491Hq+OBVT+hPWo4mb4lHnVkkInxRQfdLQ/ggAc=;
        fh=37WWfTQa0+a6hKBCfPkBdX5pTV5MWiKCY9yG/Iv3bbk=;
        b=Yz6+PUAfP9HjQk3ujC8+cDGE0J7gWRj0hTYKRYlvkvVblxDxrelYksG45X48BjVgUR
         QQW+BzMB00DbeYGki1kSM9zPQP0qeb/F9dt3QypBZqTIRV83EP04SZCEVAvRW4yaV4nx
         Vvl1W7P+mU43c3TWzlVg/8o7ygv+Efl9i6NOlTq74O1vy0oz7QidlXHu5NXURTLuQDVy
         VsDP7+PtHBnV7Ga8C5EoxL7VQjTKvu6tJPNnzn7108uh+djal3659YysqVz3NjF0jmsx
         dbYRYHGKqctknYbZe+gajH3+Wi1TIUd+vcUDQFg8vJNNLYzijc6I4pgGcXiJSgcMNSzC
         7ApA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776327941; x=1776932741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VM9L491Hq+OBVT+hPWo4mb4lHnVkkInxRQfdLQ/ggAc=;
        b=ZpkvR2Zv9JruUT1NDUtodN3fu6618bvM99Qufv4IMTcFt0Nl9Y3j5hvaBeXMldcr3l
         KAZ1q+DQQF8WbjeoTfoa7dcI4r42c1TfL4KoNtIF8H4r9Bl8EdqYPvTFlpno/BD46QeJ
         QnAS/VMBXZbjMnvpde795NR1aYzW6JSBqmBpE1Czw/6EqUwDKW9JigIZ/Usqh8EdjkgD
         KTTAqNJ/5QfJo9KEsXO/ft/Kj0kyy31FdG5IctH4NVrrEK9zs/W49mOZZu24fxh4xRB4
         QoGDgdqGc/59KTXi6Hd4F+vFdIW3eNI0ryJmOPY05YRqstNvVa2IKSqVBiOftXLWPIAd
         hO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327941; x=1776932741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM9L491Hq+OBVT+hPWo4mb4lHnVkkInxRQfdLQ/ggAc=;
        b=KzMbFyme7fF58O38J5K50H+kA/hu5U18/OwEWBcphwlLeRIPiVqi6UTMcjyW0qAITP
         kGBuLsp+zI96dDV7FooF5wFbiAMGZHbY7AZWyqWgtf4x4GVpTqrDiItmfZS+uROtx/4N
         62z7AAENnT5dc5/kZnliV4hbnGi3MYiXN4l12YawOllZKSFK8txQERvO33eyVhHColYP
         b+BZKJBKtQ/exng4zRU1glT784qmL9nMSROiAQ6oepg/SHH+51YYyd8wmOumlR+bMNWs
         I+SwYaXrZEug74UDeFBpm9p2Fu55efXIx83LfzUfsS6i4QUk1gIVc+dJ6P5Jhzvaq5fI
         SaTg==
X-Forwarded-Encrypted: i=1; AFNElJ+0Ha9j/ZADaC5cx9rzBCj7eBXq08BvjQc4p+UeSrN2GM02JcDIpbIedHaAzruHcF/6/YGeyRIX0yxFvJ4YTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLAihQMC4V67+d1LF86QXvEKWbp4G5/cFoQxBUvZDgrI/3hC/W
	X8S9zKRbR+p0o4rwwJ0TxUkeXNivL62zjS5L+/RfnMSG+YNwhkJA3R5tEAeh9pM2f1380acpd28
	XtVvX5+/C7K0XJySIiJJXI1AM0TNdTg==
X-Gm-Gg: AeBDieukDUxxA/FnsjiZH9QbfrCmdUzk5zvaSZzAuUhGbK3t19pUgGY4yUxdje4urkY
	RRHxnkxnXk7CTa9Ep9LbFh97FVbtG/1SV9ossagolv6kOFeeinFecMumWAJYyeUIjBll2nNEY78
	4CUJf0EWVL91Db2KJhuqZXv1vJnXw5k2R/f1S4+YBRVVXgFVJUWlhaEp2Zo56wCfWMxvInTxcyf
	LI95UvWPH1Kk4wxbw/V4gi3vAoGVqkYABdAAxjLsul87XaQ/3xh9wB5Q+wLm6BXOmth7VK3Ofoq
	zQ+NfcCZB0j2VhckEszkOlsA89SeKDSlL5cF2N6C7CdsTkFT32WYetdEi+sM+hElcZn6/ApkEZl
	QScc9xkrMRQ==
X-Received: by 2002:a05:690c:e3e2:b0:7a0:17f4:e761 with SMTP id
 00721157ae682-7af71b53981mr279753997b3.45.1776327941420; Thu, 16 Apr 2026
 01:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
 <87bjfjap37.ffs@tglx> <CAJGKYO5R3yM_DtALNd7BYoNMP6RiRJvCfU84vQNPCKz_Vizweg@mail.gmail.com>
 <CAJGKYO4PatnJLPVuwp730hEEqsMCEAravO-cS6xyenMNJEsXtQ@mail.gmail.com>
 <MW5PR13MB563296D757735B5B84336781FD222@MW5PR13MB5632.namprd13.prod.outlook.com>
 <CAJGKYO5TotaDTPYP5Ddoy9cgi2L8emFrNxdxyJNZ_UZm=jfWLA@mail.gmail.com>
In-Reply-To: <CAJGKYO5TotaDTPYP5Ddoy9cgi2L8emFrNxdxyJNZ_UZm=jfWLA@mail.gmail.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Thu, 16 Apr 2026 10:25:02 +0200
X-Gm-Features: AQROBzB5IP7dWwwyGl5I8-TeHu_92be57zRpUXYiogNRfxWBClcOeAw2wVoCVIw
Message-ID: <CAJGKYO7==hZ3OnRNuG81j6rxH3y1gK8qB-orxxrDsc4pNFv=hQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Thomas Gleixner <tglx@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"geert@linux-m68k.org" <geert@linux-m68k.org>, 
	"shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Laight <david.laight.linux@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000f4474f064f8f93ba"

--000000000000f4474f064f8f93ba
Content-Type: text/plain; charset="UTF-8"

Hi,

In attachment the V6 of the patch, and these are the changes since Tim
proposed it:

V5 -> V6
  Feature moved in the proper menu place, immediately after:
  Kernel hacking -> printk and dmesg options -> show timitng information printks
  Comments and descriptions more clearly indicate the aim and the limits of this
  patch and the related feature introduced by this patch.
V4 -> V5
  Rationale: single point of change hack for printk. Code rewritten, entirely.
  It provides a feature for kernel hackers willing to profiling the early boot
  with a basic printk approach (rather than using HW monitors which might not
  be available or immediately available). Thus, it is a first-look or a last
  resort hack profiling feature. Something that isn't good to spread around
  the kernel sources tree and it is fine to have into a single header file.

    cnfg/printk-early-boot-timestamps-hack-v6.patch: polishing, V6

    Pre-Kernel boot time (qemu, KVM, bios) is 0.251063 / 1.896 = 0.132 seconds

    [    0.250814] Linux version 5.15.202 (roberto@x280) (x86_64-linux-musl-gcc
                   (GCC) 14.3.0, GNU ld (GNU Binutils) 2.44) #1 Thu A6
    [    0.250820] Command line: HOST=x86_64 root=/dev/ram0 init=/init
                   console=ttyS0,115200n8 net.ifnames=0 nokaslr
    [    0.250823] KERNEL supported cpus:
    [    0.250824]   Intel GenuineIntel
    [    0.250826]   AMD AuthenticAMD
    [    0.250972] BIOS-provided physical RAM map:
    [    0.250973] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
    [    0.250978] BIOS-e820: [mem
0x000000000009fc00-0x000000000009ffff] reserved
    [    0.250981] BIOS-e820: [mem
0x00000000000f0000-0x00000000000fffff] reserved
    [    0.250983] BIOS-e820: [mem 0x0000000000100000-0x0000000001fdefff] usable
    [    0.250986] BIOS-e820: [mem
0x0000000001fdf000-0x0000000001ffffff] reserved
    [    0.250989] BIOS-e820: [mem
0x00000000b0000000-0x00000000bfffffff] reserved
    [    0.250991] BIOS-e820: [mem
0x00000000fed1c000-0x00000000fed1ffff] reserved
    [    0.250994] BIOS-e820: [mem
0x00000000feffc000-0x00000000feffffff] reserved
    [    0.250996] BIOS-e820: [mem
0x00000000fffc0000-0x00000000ffffffff] reserved
    [    0.251043] NX (Execute Disable) protection: active
    [    0.251050] Hypervisor detected: KVM
    [    0.251053] kvm-clock: Using msrs 4b564d01 and 4b564d00
    [    0.251063] kvm-clock: cpu 0, msr bac001, primary cpu clock
    [    0.000001] kvm-clock: using sched offset of 56130848 cycles
    [    0.000003] clocksource: kvm-clock: mask: 0xffffffffffffffff
                   max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
    [    0.000005] tsc: Detected 1896.002 MHz processor

Best regards, R-

--000000000000f4474f064f8f93ba
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="printk-early-boot-timestamps-hack-v6.patch"
Content-Disposition: attachment; 
	filename="printk-early-boot-timestamps-hack-v6.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mo17pj6k0>
X-Attachment-Id: f_mo17pj6k0

VGhpcyBpcyBhIGhlYXZpbHkgInJlZmFjdG9yZWQgYnkgaGFuZHMiIHBhdGNoIGZvciBMaW51eCBL
ZXJuZWwgNS4xNS4yMDIgTFRTCnRyeWluZyB0byBzb2x2ZSB0aGUgc291cmNlIHRyZWUgamFuaXRv
cmluZyB2cyAxLXNpbmdsZSBwbGFjZSBoYWNrIGZvciBoYWNrZXJzCmluIG5lZWQgZm9yIGEgc2lt
cGxlLWJhcmUgcHJvZmlsaW5nIHRvb2wgYW5kIGJhc2VkIG9uIHRoZSBwYXRjaCBWNCBzdWJtaXR0
ZWQgYnkKCkZyb206IFRpbSBCaXJkIDx0aW0uYmlyZEBzb255LmNvbT4KU3ViamVjdDogW1BBVENI
IHY0IDEvMV0gcHJpbnRrOiBmaXggemVyby12YWx1ZWQgcHJpbnRrIHRpbWVzdGFtcHMgaW4gZWFy
bHkgYm9vdApEYXRlOiBGcmksIDEwIEFwciAyMDI2IDE0OjM3OjQxIC0wNjAwCk1lc3NhZ2UtSUQ6
IDwyMDI2MDQxMDIwMzc0MS45OTc0MTAtMi10aW0uYmlyZEBzb255LmNvbT4KCkR1cmluZyBlYXJs
eSBib290LCBwcmludGsgdGltZXN0YW1wcyBhcmUgcmVwb3J0ZWQgYXMgemVybyBiZWZvcmUKa2Vy
bmVsIHRpbWVrZWVwaW5nIHN0YXJ0cyAoaS5lLiBiZWZvcmUgdGltZV9pbml0KCkpLiBUaGlzIGhp
bmRlcnMKYm9vdC10aW1lIG9wdGltaXphdGlvbiBlZmZvcnRzLiBUaGlzIHBlcmlvZCByYW5nZXMg
ZnJvbSAxNyB0byAxNzAwCm1pbGxpc2Vjb25kcyBvbiBkaWZmZXJlbnQgZW1iZWRkZWQgbWFjaGlu
ZXMgcnVubmluZyBMaW51eC4KCkFkZCBzdXBwb3J0IGZvciBlYXJseSB0aW1lc3RhbXBzIGJhc2Vk
IG9uIHByb2Nlc3NvciBjeWNsZS1nZW5lcmF0b3JzCnRoYXQgbmVlZCBubyBrZXJuZWwgaW5pdGlh
bGl6YXRpb24uVGhpcyBmZWF0dXJlIGlzbid0IGludGVuZGVkIGZvciBhIApnZW5lcmljIGRpc3Ry
byBrZXJuZWxzIGJ1dCBmb3IgdGVtcG9yYXJ5IHVzZSBkdXJpbmcga2VybmVsIGRldmVsb3BtZW50
CmFuZCBib290LXRpbWUgcmVzZWFyY2ggYW5kIG9wdGltaXphdGlvbiBieSBrZXJuZWwgaGFja2Vy
cyBvbmx5LgoKVGhpcyB5aWVsZHMgbm9uLXplcm8gdGltZXN0YW1wcyBmb3IgcHJpbnRrcyBmcm9t
IHRoZSB2ZXJ5IHN0YXJ0Cm9mIGtlcm5lbCBleGVjdXRpb24uIFRoZSB0aW1lc3RhbXBzIGFyZSBy
ZWxhdGl2ZSB0byB0aGUgc3RhcnQgb2YKYW4gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGNvdW50ZXIg
KGUuZy4gdHNjIG9uIHg4Nl82NCBhbmQgY250dmN0X2VsMApvbiBhcm02NCkuIEFmZmVjdGVkIHRp
bWVzdGFtcHMgcmVmbGVjdCBjeWNsZSBjb3VudGVyIHJlbGF0ZWQgdmFsdWVzCnNpbmNlIGluaXQg
KHVzdWFsbHkgbWFjaGluZSBwb3dlci1vbiBvciB2aXJ0dWFsIG1hY2hpbmUgc3RhcnQpIGluc3Rl
YWQKb2YgdGltZSBmcm9tIHRoZSBrZXJuZWwncyB0aW1la2VlcGluZyBpbml0aWFsaXphdGlvbi4g
VGhpcyByZXN1bHRzIGluCmEgZGlzY29udGludWl0eSBpbiB0aGUgcHJpbnRrIHRpbWVzdGFtcCB2
YWx1ZXMsIG9uZSB0aW1lLCB3aGVuCmtlcm5lbCB0aW1la2VlcGluZyBzdGFydHMuCgpTaWduZWQt
b2ZmLWJ5OiBUaW0gQmlyZCA8dGltLmJpcmRAc29ueS5jb20+ClNpZ25lZC1vZmYtYnk6IFJvYmVy
dG8gQS4gRm9nbGlldHRhIDxyb2JlcnRvLmZvZ2xpZXR0YUBnbWFpbC5jb20+Ci0tLQpWNSAtPiBW
NgogIEZlYXR1cmUgbW92ZWQgaW4gdGhlIHByb3BlciBtZW51IHBsYWNlLCBpbW1lZGlhdGVseSBh
ZnRlcjoKICBLZXJuZWwgaGFja2luZyAtPiBwcmludGsgYW5kIGRtZXNnIG9wdGlvbnMgLT4gc2hv
dyB0aW1pdG5nIGluZm9ybWF0aW9uIHByaW50a3MKICBDb21tZW50cyBhbmQgZGVzY3JpcHRpb25z
IG1vcmUgY2xlYXJseSBpbmRpY2F0ZSB0aGUgYWltIGFuZCB0aGUgbGltaXRzIG9mIHRoaXMKICBw
YXRjaCBhbmQgdGhlIHJlbGF0ZWQgZmVhdHVyZSBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2guClY0
IC0+IFY1CiAgUmF0aW9uYWxlOiBzaW5nbGUgcG9pbnQgb2YgY2hhbmdlIGhhY2sgZm9yIHByaW50
ay4gQ29kZSByZXdyaXR0ZW4sIGVudGlyZWx5LgogIEl0IHByb3ZpZGVzIGEgZmVhdHVyZSBmb3Ig
a2VybmVsIGhhY2tlcnMgd2lsbGluZyB0byBwcm9maWxpbmcgdGhlIGVhcmx5IGJvb3QKICB3aXRo
IGEgYmFzaWMgcHJpbnRrIGFwcHJvYWNoIChyYXRoZXIgdGhhbiB1c2luZyBIVyBtb25pdG9ycyB3
aGljaCBtaWdodCBub3QKICBiZSBhdmFpbGFibGUgb3IgaW1tZWRpYXRlbHkgYXZhaWxhYmxlKS4g
VGh1cywgaXQgaXMgYSBmaXJzdC1sb29rIG9yIGEgbGFzdAogIHJlc29ydCBoYWNrIHByb2ZpbGlu
ZyBmZWF0dXJlLiBTb21ldGhpbmcgdGhhdCBpc24ndCBnb29kIHRvIHNwcmVhZCBhcm91bmQKICB0
aGUga2VybmVsIHNvdXJjZXMgdHJlZSBhbmQgaXQgaXMgZmluZSB0byBoYXZlIGludG8gYSBzaW5n
bGUgaGVhZGVyIGZpbGUuClYzIC0+IFY0CiAgUmVwbGFjZSBjb25maWcgdmFycyB3aXRoIHNpbmds
ZSBvbmU6IENPTkZJR19FQVJMWV9DWUNMRVNfS0haCiAgUmVwbGFjZSBydW50aW1lIGNhbGlicmF0
aW9uIHdpdGggc3RhdGljIGNvbmZpZyB2YXJpYWJsZQogIFJlbW92ZSByZWZlcmVuY2UgdG8gZ2V0
X2N5Y2xlcygpCiAgQWRkIHN1cHBvcnQgZm9yIFJJU0NWIHBsYXRmb3JtcwpWMiAtPiBWMwogIERl
ZmF1bHQgQ09ORklHIG9wdGlvbiB0byAnbicKICBNb3ZlIG1vcmUgY29kZSBpbnRvIGVhcmx5X3Rp
bWVzLmggKHJlZHVjZSBpZmRlZnMgaW4gaW5pdC9tYWluLmMpCiAgVXNlIG1hdGNoNjQgaGVscGVy
IHJvdXRpbmVzCiAgVXNlIGN5Y2xlc190IGluc3RlYWQgb2YgdTY0IHR5cGUKICBBZGQgI2RlZmlu
ZXMgZm9yIEVBUkxZX0NZQ0xFU19CSVQgYW5kIEVBUkxZX0NZQ0xFU19NQVNLCiAgSW52ZXJ0IGlm
IGxvZ2ljIGluIGFkanVzdF9lYXJseV90cygpClYxIC0+IFYyCiAgUmVtb3ZlIGNhbGlicmF0aW9u
IENPTkZJRyB2YXJzCiAgQWRkICdkZXBlbmRzIG9uJyB0byByZXN0cmljdCBhcmNoZXMgKHRvIGhh
bmRsZSBwcGMgYnVnKQogIEFkZCBlYXJseV90c19vZmZzZXQgdG8gYXZvaWQgZGlzY29udGludWl0
eQogIFNhdmUgY3ljbGVzIGluIHRzX25zZWMsIGFuZCBjb252ZXJ0IG9uIG91dHB1dAogIE1vdmUg
Y29uZGl0aW9uYWwgY29kZSB0byBpbmNsdWRlIGZpbGUgZWFybHlfdGltZXMuaAoKLS0tIGEvbGli
L0tjb25maWcuZGVidWcJMjAyNi0wNC0xNiAwODo1Mjo0NC43NzE2MTg3MTkgKzAyMDAKKysrIGIv
bGliL0tjb25maWcuZGVidWcJMjAyNi0wNC0xNiAwODo1NTowOC4zNTg5NDE5ODkgKzAyMDAKQEAg
LTE4LDYgKzE4LDI5IEBAIGNvbmZpZyBQUklOVEtfVElNRQogCSAgVGhlIGJlaGF2aW9yIGlzIGFs
c28gY29udHJvbGxlZCBieSB0aGUga2VybmVsIGNvbW1hbmQgbGluZQogCSAgcGFyYW1ldGVyIHBy
aW50ay50aW1lPTEuIFNlZSBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0
ZXJzLnJzdAogCitjb25maWcgUFJJTlRLX0VBUkxZX0JPT1RfVElNSU5HUworCWJvb2wgIkVhcmx5
IGJvb3QgcHJpbnRrIHNob3dzIHRpbWVzIGluIHJhdyBjeWNsZSBjb3VudGVyIHN0eWxlIgorCWRl
ZmF1bHQgMAorCWRlcGVuZHMgb24gUFJJTlRLCisJZGVwZW5kcyBvbiBBUk02NCB8fCBYODZfNjQg
fHwgUklTQ1ZfVElNRVIKKwlzZWxlY3QgUFJJTlRLX1RJTUUKKwloZWxwCisJICBCb29sZWFuIHZh
bHVlLCBkaXNhYmxlZCBieSBkZWZhdWx0LgorCisJICBTZXQgdGhpcyBvcHRpb24gdG8gcHJvdmlk
ZSBjeWNsZXMgaW5mb3JtYXRpb24gZm9yIHByaW50a3MgYXQgZWFybHkKKwkgIGJvb3QgdGltZXMg
KGJlZm9yZSB0aGUgc3RhcnQgb2Yga2VybmVsIHRpbWVrZWVwaW5nKSwgdGhhdCB3b3VsZAorCSAg
b3RoZXJ3aXNlIHNob3cgYXMgMC4KKworCSAgVXNlZnVsIGZvciBwcm9maWxpbmcgYnkgcmVsYXRp
dmUgbW9ub3RvbmljIHZhbHVlcywgbm90IHRpbWUuCisKKwkgIE5vdGUgdGhhdCB0aGlzIGNhdXNl
cyB0aGUga2VybmVsIHRvIHNob3csIGZvciBzb21lIGVhcmx5IHByaW50a3MsCisJICBjeWNsZXMg
dGhhdCBhcmUgcmVsYXRpdmUgdG8gcHJvY2Vzc29yIHBvd2VyIG9uLCBpbnN0ZWFkIG9mCisJICBy
ZWxhdGl2ZSB0byB0aGUgc3RhcnQgb2Yga2VybmVsIHRpbWVrZWVwaW5nLiBXaGVuIGtlcm5lbAor
CSAgdGltZWtlZXBpbmcgc3RhcnRzLCB0aGUgdGltZXN0YW1wcyB2YWx1ZXMgcmVzZXQsIGNhdXNp
bmcKKwkgIGEgZGlzY29udGludWl0eSBpbiB0aGUgdGltZXN0YW1wIHZhbHVlcy4KKworCSAgSWYg
dW5zdXJlLCBzYXkgTi4KKwogY29uZmlnIFBSSU5US19DQUxMRVIKIAlib29sICJTaG93IGNhbGxl
ciBpbmZvcm1hdGlvbiBvbiBwcmludGtzIgogCWRlcGVuZHMgb24gUFJJTlRLCi0tLSAvZGV2L251
bGwJMjAyNi0wNC0xMCAxNTozNTo0OS42NTk3NDE2NDQgKzAyMDAKKysrIGIva2VybmVsL3ByaW50
ay9lYXJseV90aW1lcy5oCTIwMjYtMDQtMTUgMTE6MzI6NDkuNzg2NzI4NjAyICswMjAwCkBAIC0w
LDAgKzEsMjYgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisKKyNp
Zm5kZWYgX0VBUkxZX1RJTUVTX0gKKyNkZWZpbmUgX0VBUkxZX1RJTUVTX0gKKworI2luY2x1ZGUg
PGxpbnV4L3RpbWVrZWVwaW5nLmg+CisKKy8qCisgKiBGZW5jaW5nIGlzbid0IG9wdGlvbmFsIGhl
cmUsIG90aGVyd2lzZSB1bnJlbGlhYmxlIHZhbHVlcyBkaXNwbGF5aW5nCisgKi8KKyNpZiBkZWZp
bmVkKENPTkZJR19BUk02NCkKKwkjaW5jbHVkZSA8YXNtL3N5c3JlZy5oPgorCSNkZWZpbmUgX19l
YXJseV9yYXdfY3ljbGVzICh7IHU2NCB2YWw7IFwKKwkJYXNtIHZvbGF0aWxlKCJpc2I7IG1ycyAl
MCwgY250dmN0X2VsMCIgOiAiPXIiKHZhbCkpOyB2YWw7IH0pCisjZWxpZiBkZWZpbmVkKENPTkZJ
R19YODZfNjQpCisJI2RlZmluZSBfX2Vhcmx5X3Jhd19jeWNsZXMgKHsgdTY0IHZhbDsgXAorCQlh
c20gdm9sYXRpbGUoImxmZW5jZTsgcmR0c2M7IHNobCAkMzIsICUlcmR4OyBvciAlJXJkeCwgJSVy
YXgiIFwKKwkJCTogIj1hIih2YWwpIDogOiAicmR4Iik7IHZhbDsgfSkKKyNlbGlmIGRlZmluZWQo
Q09ORklHX1JJU0NWX1RJTUVSKQorCSNkZWZpbmUgX19lYXJseV9yYXdfY3ljbGVzICh7IHU2NCB2
YWw7IFwKKwkJYXNtIHZvbGF0aWxlKCJmZW5jZTsgcmR0aW1lICUwIiA6ICI9ciIodmFsKSk7IHZh
bDsgfSkKKyNlbHNlCisJI2RlZmluZSBfX2Vhcmx5X3Jhd19jeWNsZXMgMAorI2VuZGlmCisKKyNl
bmRpZiAvKiBfRUFSTFlfVElNRVNfSCAqLwotLS0gYS9rZXJuZWwvcHJpbnRrL3ByaW50ay5jCTIw
MjYtMDQtMTUgMTE6Mzk6NTUuMzcyMDY2ODAyICswMjAwCisrKyBiL2tlcm5lbC9wcmludGsvcHJp
bnRrLmMJMjAyNi0wNC0xNSAxMTozOTozMy40NTg5NTM1ODIgKzAyMDAKQEAgLTIxNTEsNiArMjE1
MSwxOCBAQCBpbnQgdnByaW50a19zdG9yZShpbnQgZmFjaWxpdHksIGludCBsZXZlCiAJICovCiAJ
dHNfbnNlYyA9IGxvY2FsX2Nsb2NrKCk7CiAKKyNpZiBDT05GSUdfUFJJTlRLX0VBUkxZX0JPT1Rf
VElNSU5HUworI2luY2x1ZGUgImVhcmx5X3RpbWVzLmgiCisJLyoKKwkgKiBWZXJ5IGZldyBkZXZl
bG9wZXJzIGFyZSBnb2luZyB0byB1c2UgdGhpcyBmZWF0dXJlIGFuZCBpdCBpcworCSAqIGV4cGVj
dGVkIHRoZXkncmUgYWJsZSB0byBkZWFsIHdpdGggaXQgYXMgYSBzaW5nbGUgZW50cnktcG9pbnQg
b2YKKwkgKiBjaGFuZ2VzLiBBbiBoYWNrIHRvIGJlIGZ1cnRoZXIgY3VzdG9taXNlZCBieSB0aGVt
IGZvciBwb3J0aW5nIHRoZQorCSAqIGtlcm5lbCBvbiBub3QteWV0LXN1cHBvcnRlZCBzaWxpY29u
IG9yIGJ1ZyBmaXhpbmcgLyBvcHRpbWlzYXRpb25zLgorCSAqLworCWlmICh1bmxpa2VseSghdHNf
bnNlYykpCisJCXRzX25zZWMgPSBfX2Vhcmx5X3Jhd19jeWNsZXM7CisjZW5kaWYKKwogCWlmICgh
cHJpbnRrX2VudGVyX2lycXNhdmUocmVjdXJzaW9uX3B0ciwgaXJxZmxhZ3MpKQogCQlyZXR1cm4g
MDsKIAo=
--000000000000f4474f064f8f93ba--
