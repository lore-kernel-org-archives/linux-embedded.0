From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v9 0/3] Implement a generic PWM framework
Date: Wed, 15 Jun 2011 11:33:00 -0400
Message-ID: <BANLkTikD66EheEQem82yPocCs6Bzqoa4kg@mail.gmail.com>
References: <1301630392-20793-1-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=bXJG61Bq2MhNM4cMhar1R1tU2gXL44qbiZNLlh90BFY=;
        b=QTiu2WLnorbd5lzrveAHaXiOLNyX4RaHImXmGoGMEeJApg8b36Kiwtgd6btW/xBBsc
         oerSWdQ6o6wRJ2XbI6Tk+htMnc+S0tlnJEPa7zOup9Ifi+sqF/YZF2P5R8QXvXhIT8a+
         QbnX0ymGcFO8yX9kRlPGUZqC5AhI/pVrGtLmA=
In-Reply-To: <1301630392-20793-1-git-send-email-bgat@billgatliff.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Thu, Mar 31, 2011 at 23:59, Bill Gatliff wrote:
> This patch series contains the ninth attempt at implementation of a
> generic PWM device interface framework. =C2=A0Think gpiolib, but for
> devices and pseudo-devices that generate pulse-wave-modulated outputs=
=2E

i was made aware of the existing code in linux/pwm.h.  seems that this
framework should absorb that since there are already drivers built on
top of it (i see a backlight, led, and input driver), and we dont want
two frameworks doing exactly the same thing.
-mike
