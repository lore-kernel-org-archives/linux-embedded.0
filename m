From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: execute bit on scripts (was Re: [PATCH] add diffconfig
 utility)
Date: Wed, 11 Jun 2008 00:26:13 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806110025220.20733@fbirervta.pbzchgretzou.qr>
References: <484ED902.9040000@am.sony.com> <20080610210217.GA2432@logfs.org> <20080610211841.GA23855@uranus.ravnborg.org> <484EF323.7000809@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <484EF323.7000809@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>


On Tuesday 2008-06-10 23:33, Tim Bird wrote:
>
>> I take most of the random scripts in scripts/ via kbuild.git.
>
>OK - sounds like you're the right person to ask a question
>that has been nagging me.
>
>Is there a proper way to get the execute bit set in the git tree
>on  patches that contain scripts?  I think patches
>produced by git have something that sets the file permissions?

If the patch was produced with git it should have a line like
	new file mode 100755

