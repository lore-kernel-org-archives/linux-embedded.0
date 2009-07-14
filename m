From: Zaphod <zaphod001@gmail.com>
Subject: syslog for embedded
Date: Tue, 14 Jul 2009 13:01:15 +0300
Message-ID: <4A5C576B.4040203@gmail.com>
Reply-To: zaphod001@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=495dHRaIDxBb+GAOc4MF0LXrWO3ECjBv3+8NL/cqyLs=;
        b=FIIz88gmaEkF9DdcNQ5zNb0B6Q6rn8vRIctMLTPbjzcf7iYW0pyl8fg4eudaI/CT28
         WPlCjcEUzZ3HJ3F9TLYBZTuDbWGJvXly3Hju6NgI1UH1pzSibq5WDK1jd9dqPEaL8q2Q
         T9dTGvGavSDSvMVXQZerAUiTBzIeBgDfqkB6w=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Hi All,

i am trying to find good syslog suitable for embedded.
Means,
1. no use of dynamic allocations
2. small footprint
3. redirection to multiple destination (number of IPs, file, console)

Thanks everyone for help.
