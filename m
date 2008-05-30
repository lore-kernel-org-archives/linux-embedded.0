From: Jordan Crouse <jordan.crouse@amd.com>
Subject: Re: Some embedded topics
Date: Fri, 30 May 2008 17:20:26 -0600
Message-ID: <20080530232026.GH15836@cosmic.amd.com>
References: <483C83DE.3040604@cisco.com> <8bd0f97a0805271527i622a31b8t68ba24c80a2e034a@mail.gmail.com> <20080527223142.GU26837@email.mot.com> <200805282201.48746.rob@landley.net> <Pine.LNX.4.64.0805291130580.16206@vixen.sonytel.be> <484086B8.4030909@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <484086B8.4030909@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Rob Landley <rob@landley.net>, T Ziomek <ctz001@email.mot.com>, Mike Frysinger <vapier.adi@gmail.com>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org

On 30/05/08 15:59 -0700, Tim Bird wrote:
> P.S. Is debug=mem something specific to Amiga?  I find
> no mention of it in Documentation/kernel-parameters.txt

It would be interesting to standardize this interface and
extend it to dump logs from the firmware loader / monitor as well. 
I know that coreboot for one has the ability to store logs and
communicate them to the kernel, and I think some of the more
popular embedded loaders support store logs too
(or if they don't, they should).

Jordan

-- 
Jordan Crouse
Systems Software Development Engineer 
Advanced Micro Devices, Inc.

