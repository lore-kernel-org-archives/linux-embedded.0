From: Eliot Blennerhassett <eblennerhassett@audioscience.com>
Subject: Re: Remote IP setup of devices in a network
Date: Wed, 09 Nov 2011 12:30:26 +1300
Message-ID: <4EB9BB92.9080505@audioscience.com>
References: <20111108185421.GA27727@merkur.ravnborg.org> <1320779474.5402.2.camel@shinybook.infradead.org> <20111108193158.GA28261@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20111108193158.GA28261@merkur.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>

On 09/11/11 08:31, Sam Ravnborg wrote:
> On Tue, Nov 08, 2011 at 07:11:09PM +0000, David Woodhouse wrote:
>> On Tue, 2011-11-08 at 19:54 +0100, Sam Ravnborg wrote:
>>> The idea is to use an UDP broadcast to discover all devices,
>>> and a similar UDP broadcast to configure the devices.
>>> In the latter the MAC will be the key to address individual devices.

It isn't obvious why you can't use bootp or dhcp?


