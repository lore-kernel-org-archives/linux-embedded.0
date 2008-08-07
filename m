From: "Amol Lad" <amol.lad@gmail.com>
Subject: kernel command line from u-boot
Date: Thu, 7 Aug 2008 10:11:33 +0530
Message-ID: <8c675e9b0808062141s74f1a7bfob5cab6b23b0268d3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=SU3xe56BTwzN0b//NexAnKdNetA1PSmsjsKSzWMBi4Y=;
        b=JL/lgGRo+6Hjifj2CA7qR3W86sW9qKiH6kMvv/5daSCj8A9pbS60uOMhCn+MD/mUl5
         egN6Ti/lawO05ZqjmiSGRYe9FcohvWkYFi4swaje9VZiUQ0DB6pewGKjlMTqZnaL90ro
         9p4Wn5L8q/FirW7g5yBwHZvRCNfTWbGMFpkXE=
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded <linux-embedded@vger.kernel.org>

Hi,

It seems that there is a small problem when kernel parses the command
line passed by u-boot.

For example, when I add "board=myboard boardid=1" in the command line
and register handler in kernel as __setup("board", board_setup), then
the board_setup function is called twice : once with argument
"myboard" and second time with argument "d=1". So kernel is calling
handler registered for param "board" for "boardid" also. Is this ok ?

Thanks
Amol
