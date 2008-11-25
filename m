From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH/RFC] Add Alternative Log Buffer Support for printk Messages
Date: Tue, 25 Nov 2008 22:05:02 +0100
Message-ID: <20081125210502.92402834B020@gemini.denx.de>
References: <20081125135519.038abf23@zod.rchland.ibm.com>
	<C5518C2F.13137%gerickson@nuovations.com>
	<b5e2fc790811251131g63ea9444x57ec0829ca0b069e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-reply-to: <b5e2fc790811251131g63ea9444x57ec0829ca0b069e@mail.gmail.com>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Matt Sealey <matt@genesi-usa.com>
Cc: linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>, linux-embedded@vger.kernel.org, Grant Erickson <gerickson@nuovations.com>

Dear Matt,

In message <b5e2fc790811251131g63ea9444x57ec0829ca0b069e@mail.gmail.com> you wrote:
>
> There is also no reason you can't hard-code the locations into the device
> tree, to support older U-Boots that don't know about
> /chosen/linux,log-metadata and /chosen/linux,log-buffer*.

Actually there is such reason - U-Boot traditionally allocates the log
buffer close to the upper end of system memory, so the start address
depends on the memory size on the board, which may vary.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
The human mind  ordinarily  operates  at  only  ten  percent  of  its
capacity. The rest is overhead for the operating system.
