From: Vineeth <vneethv@gmail.com>
Subject: Timer interrupt on Linux 3.0.3
Date: Fri, 16 Sep 2011 17:13:06 +0530
Message-ID: <CAFbQSaD-c=QqSsq__VtBEcMCJabnBi4AP4KunDNV7u7xXAuaTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2625842515030896674=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=twkw6HkfuVfaew07+twcaHaGKt6hlce4cADXqKJFK2U=;
	b=nF75V9xix5L+S7v9JhoOJpF76WCTQsO/vwyAcdvKELvd82VFp0AWI8pImZnRheARau
	2Jvi5pyLJB+rTC3Ie9HZA6sz74NQiWN1Ln4AE58Fsd8YfTYD+mhBQJbLwAkSvlyCPsqw
	zjCU9OWwdmVc44SHVeW3bqx4z8xK4Z3PVS7oU=
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: linux-embedded@vger.kernel.org, linuxppc-embedded@ozlabs.org, linuxppc-dev@lists.ozlabs.org

--===============2625842515030896674==
Content-Type: multipart/alternative; boundary=00151747b5aa5a127204ad0d80f0

--00151747b5aa5a127204ad0d80f0
Content-Type: text/plain; charset=ISO-8859-1

Hi,

We are porting Linux on MPC7410 based board. As there was some issue with
the processor DECrementer and timebase registers, we were using an external
count down timer as our DECementer. We used timer_interrupt() function in
arch/powerpc/kernel/time.c as our interrupt handler. Things were working
fine.

lately we moved to Linux 3.0.3. What we found was even without a proper
timer, the kernel with initramfs worked (except the calls like sleep,delay
ofcourse); Is there any major difference in the scheduler ? or the way
context switch happens ? is it not depended on the timer interrupt or the
timer ??

Thanks
Vineeth

--00151747b5aa5a127204ad0d80f0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>We are porting Linux on MPC7410 based board. As there was some i=
ssue with the processor DECrementer and timebase registers, we were using a=
n external count down timer as our DECementer. We used timer_interrupt() fu=
nction in arch/powerpc/kernel/time.c as our interrupt handler. Things were =
working fine.<br>

<br>lately we moved to Linux 3.0.3. What we found was even without a proper=
 timer, the kernel with initramfs worked (except the calls like sleep,delay=
 ofcourse); Is there any major difference in the scheduler ? or the way con=
text switch happens ? is it not depended on the timer interrupt or the time=
r ??<br>

<br>Thanks<br>Vineeth<br>

--00151747b5aa5a127204ad0d80f0--

--===============2625842515030896674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--===============2625842515030896674==--
