From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Subject: Re: syslog for embedded
Date: Tue, 14 Jul 2009 12:23:38 +0200
Message-ID: <e4c675870907140323x7e9846d3hb09a89fda239b984@mail.gmail.com>
References: <4A5C576B.4040203@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=8mhPqPiMEQB0D9e9CYShDS/x8w6c4HMFwwFjwIwynBQ=;
        b=dc1A3sphlVSAylqYGqel2ejynqc7y3BrQB2q2ivi34XdpSYHQCe3OXcGakwjTuWrjD
         +qY/Nse4btCOwWlwdUCI7BMbVIUAkaxGJ51b86x4CbhPdtCm6ji7N/jPCEbN0TIsAD2w
         xM9+QzvdLhiiO00l1txaa0ebrFRe3lZi7csXA=
In-Reply-To: <4A5C576B.4040203@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zaphod001@gmail.com
Cc: linux-embedded@vger.kernel.org

2009/7/14 Zaphod <zaphod001@gmail.com>:
> Hi All,
>
> i am trying to find good syslog suitable for embedded.
> Means,
> 1. no use of dynamic allocations
> 2. small footprint
> 3. redirection to multiple destination (number of IPs, file, console)
>
> Thanks everyone for help.

 AFAIK busbox syslogd miss the 3rd requirement. If any other existing
syslog still miss at least one of the requirements  then upgrading
busybox with the network support would be a viable solution.

 Ciao,
-- 
Roberto A. Foglietta,
Linux Embedded Consultant
mobile: (+39) 349.33.30.697
