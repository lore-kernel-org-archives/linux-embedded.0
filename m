From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv7] UBI: new module ubiblk: block layer on top of UBI
Date: Mon, 26 Sep 2011 16:20:04 +0300
Message-ID: <1317043212.9442.8.camel@sauron>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	 <1317040680-6199-1-git-send-email-david.wagner@free-electrons.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:message-id
         :mime-version;
        bh=5E7XnQZAvGo7VkJp/wu0FgXGqe1NUpCYoh9ruVe37D8=;
        b=SNy0yGYHLBKwmoO1YKB5NexcyTFnyjspD01xkF6kGocBSRIxawz/WbxjMrcDISRdzd
         R+E+cBp/jiF6rJ9ZqoznbAOxksJJ1SaA5x5HD+PZXXhH5OaH46hoNEcpPZj4ejvVZ1vB
         t/lHyzgZJCYo7OOPTjMyMuefyNS+UywesV5uE=
In-Reply-To: <1317040680-6199-1-git-send-email-david.wagner@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Wagner <david.wagner@free-electrons.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>, Ricard Wanderlof <ricard.wanderlof@axis.com>, Arnd Bergmann <arnd@arndb.de>

On Mon, 2011-09-26 at 14:38 +0200, David Wagner wrote:
> 	* "volume" parameter: pass the volume name instead of the volume ID

Sorry if I was not clear, but it should accept both name and number.
Take a look at UBI - it first checks if the string is a number, if yes -
tries to open by number, if this fails, tries to treat this as a name
and open by name.

And AFAICS, you did not change the documentation for the "volume" module
parameter.


-- 
Best Regards,
Artem Bityutskiy
