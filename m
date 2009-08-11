From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 4/6] Add support for LZO-compressed kernels for ARM
Date: Tue, 11 Aug 2009 09:31:25 -0700
Message-ID: <4A819CDD.1000700@zytor.com>
References: <4A7BF5B8.4030907@knaff.lu> <20090807102117.GB4455@laptop> <4A7C14EB.1060701@parrot.com> <20090807130130.GE4455@laptop> <4A7C2BA4.7030408@parrot.com> <20090807135524.GF4455@laptop> <20090807200001.GE31543@n2100.arm.linux.org.uk> <20090807210816.GA29797@merkur.ravnborg.org> <20090811094418.GI9704@pc-ras4041.res.insa> <4A819642.10700@zytor.com> <20090811162730.GM9704@pc-ras4041.res.insa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090811162730.GM9704@pc-ras4041.res.insa>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Matthieu CASTET <matthieu.castet@parrot.com>, Alain Knaff <alain@knaff.lu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

On 08/11/2009 09:27 AM, Albin Tonnerre wrote:
> 
> So I guess the only options left are either define a dummy raise() function, or
> get rid of the divisions like Alain Knaff did in his patch ?
> 

Define a dummy raise, get rid of the divisions, or provide your own
division function (there is probably one in the kernel already...)

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
