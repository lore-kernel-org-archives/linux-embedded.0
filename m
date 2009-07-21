From: Zaphod <zaphod001@gmail.com>
Subject: syslog stops to deliver to console
Date: Tue, 21 Jul 2009 11:37:06 +0300
Message-ID: <4A657E32.2070703@gmail.com>
Reply-To: zaphod001@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=dGlaqZ6PjIf9RmSw8h5vRJBAhROvA3lG4XptV7ZyrhY=;
        b=hxdiXOIH0nh7ttZphq5CXqE9x+2hM29MY6KXIAmIgZf8Fl6hvtUM9/CjPPgcwZ8/Yd
         y9U+YDSAELiV5Yfnf+rZNhbS8PkxfxJJon1Y6vuXB37whnWBE4PSHn9Z2Ix6XVCiPYow
         GZZ/wgpshsE0eUnCkKoDrtB0HKjVfuYV7TRNE=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Hi

I have ppc arch and sysklogd-1.5 working on it.
The syslogd has config file which orders to redirect output to console 
(/dev/console) and IP of other Linux machine.

I have application with 3 threads doing syslog every 50msec. After less that 
minute the console stops to show messages, but the other Linux machine still 
gets them.

Is it known problem?

Thanks for help.
