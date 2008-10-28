From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH] phylib: add mdio-gpio bus driver (v3)
Date: Tue, 28 Oct 2008 06:50:38 -0400
Message-ID: <8bd0f97a0810280350j385a0239if7a33928f7bb11f1@mail.gmail.com>
References: <20081028103537.28951.4804.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=nmWMPIE3UURzDK6UO76i5U/lBqkfznogHmG1yJNyP4Y=;
        b=LT6e8/8r6RAqZQD87Qv3c3LRxMAWb69diKh7y4PKb692Cz1iaZtfD9Bpp1QBn6Jg+S
         VrL/bvfMe5rI7wSh4i1uhYoLQQlIDsCclegMpcsw1K1wS6EENT9nvX14o5ya4Vz3vkM5
         NGREs0W8lUyeMmmcrKX6E1yZhqPNduUICqQx8=
In-Reply-To: <20081028103537.28951.4804.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org

On Tue, Oct 28, 2008 at 06:35, Paulius Zaleckas wrote:
> +config MDIO_GPIO
> +       tristate "Support for GPIO bitbanged MDIO buses"
>  config MDIO_OF_GPIO
>        tristate "Support for GPIO lib-based bitbanged MDIO buses"

seems to me these drivers have the same description ...

> +++ b/include/linux/mdio-gpio.h
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

this is why short GPL notices are nice ... you dont end up with
outdated contact information like this ...
-mike
