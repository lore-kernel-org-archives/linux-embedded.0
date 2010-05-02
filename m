From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: Can I manage/modify console baud rates from userspace?
Date: Sun, 02 May 2010 11:58:31 +0200
Message-ID: <4BDD4CC7.3050507@gmail.com>
References: <1272758524.27961.1114.camel@homebase>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=gIB1q3JQJ789EmcoFbHPTYvYI/AV8EGSXUttEdOKxQE=;
        b=DeK3r6FoL2lOhMlq9ek6UrivmL7gu+1nj115ZimtzYYqNkyLSxZ9meZAQlhdKBnB5F
         Bs+b3N3csXIZ9wK/uYrW2GOjlxHes19IwV7VsglbaeVwWlm8+b3IJKqNcjzYqY4yNzP+
         E3Z+DmMJ71eD/0xVikAMQQPp9Gu6QjsZBey00=
In-Reply-To: <1272758524.27961.1114.camel@homebase>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: paul@mad-scientist.net
Cc: linux-embedded@vger.kernel.org

02/05/2010 02:02, Paul Smith wrote:
> I've looked at setserial and it supports a baud_base parameter but that
> doesn't appear to be what I want (I tried it anyway: changing it didn't
> work, my console output was still screwed up).
> 
> Trying to do something like creating customized PXE configs on the
> server based on the MAC addresses of the blades that are "new" (or old)
> would be an absolute nightmare as people swap blades between chassis,
> add new ones, etc. all the time.
> 
> 
> Please help me find a better way... :-(
> 

It's strange that it's not possible to change the baud rate, but I'm not
an expert of tty layer. A naive implementation could be patch the kernel
to choose a well-known baud rate for your hw reading a revision register
or something like that.

Marco
