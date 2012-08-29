From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: Expose system Serial Number to userspace.
Date: Wed, 29 Aug 2012 18:05:47 +0200
Message-ID: <503E3DDB.8050708@gmail.com>
References: <09ee18b0d2e3d7f34a9e510b3f8d7702@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=iT1pKVuF4tB5a3vPXywIHhzx2PSIdWoTDReqNrHojmk=;
        b=BYcYIYcOJljnqXKx8NEwrB1Gbslj4rhTnlwE8z0XGY13RKT4NckSmzDeztsdudxA86
         +O7zYF/gnaNcQMS5gtlQDdd7zBER2WVVBVkhtp7ep+9PGsIKIClqxKN9GYMXEFspNWz0
         z+WLpGyiHeVyRJQK8LMb8mw8Ryk6Ba4bnspO5hL8YK6Y0OGeyQtlKq23o1wxEwWre30A
         2AviNiht94rgsbydvFfcpMvlBLqHRs0LuWf+d7FsPOqlWJapQZhIzE8gKitihv3wTRMW
         0QVxeWOqTFhs9t1EUnAOtCgRkoPQUHXi8ieDNzkgZjVfWO0ha4h8d4gvs1SlCeetArGI
         kzlA==
In-Reply-To: <09ee18b0d2e3d7f34a9e510b3f8d7702@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brad Arnold <brad@check-it.ca>
Cc: linux-embedded@vger.kernel.org

Il 29/08/2012 17:18, Brad Arnold ha scritto:
> Hi,
>
> I'm working on an embedded board which uses u-boot + linux. At
> manufacturing time, the device serial number will be programmed into OTP
> memory on NAND (probably from within u-boot). We'd like the linux kernel
> to make this serial number available to be read from userspace. Is there
> an accepted method to do this sort of thing?
>
> One idea I had was to make the serial number available as a device node
> (ie: you can simply read the serial number from "/dev/serialnumber"). Then
> there's the question of how the kernel learns the serial in the first
> place (a kernel boot command like parameter passed from u-boot?).
>
> Does this sound sane, or is there a better way to do something like this?
>
> Thanks,
>
> Brad

U-Boot manage a serial number via env variable "serial#". It provides 
several tools. You'll find under tools/env applications to read/write 
env variable of uboot, so reading from Linux is very simple. You should 
use a dedicated little space of flash to store the env variables.

Regards,

Marco
