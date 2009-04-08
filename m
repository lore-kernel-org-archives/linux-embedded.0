From: "Mark A. Miller" <mark@mirell.org>
Subject: Versatile PB Board Support for ARMv6 and ARMv7
Date: Tue, 7 Apr 2009 22:35:25 -0500
Message-ID: <31014a580904072035u7215ab93m41d2205d42c22be@mail.gmail.com>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=0016e640d0f6cef750046702d3ef
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: linux-kernel@vger.kernel.org
Cc: qemu-devel@nongnu.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>

--0016e640d0f6cef750046702d3ef
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

In late October 2008, according to the git logs, the methodology for
selecting a processor on several boards, at least the Versatile PB board was
changed so that it automatically selects CPU_ARM926T as a hidden symbol.
The reason I have a question, is since QEMU currently can emulate a
Versatile PB board with other processors than just the ARM926T (Such as the
ARM1136 (ARMv6) and Cortex-A8 (ARMv7), is there a good way to allow that in
the mainstream kernel? Previously the patch was to just add extra potential
dependencies on CPU_V6 and CPU_V7, so that by selecting MACH_VERSATILE_PB,
you could select ARMv6/v7 support.

Currently I'm just deleting the select statement, and having all the CPUs
appear, as no longer hidden symbols. My question is, what is the best way to
allow for other processors for this board in Kconfig, so it could be
submitted to the mainstream kernel?

-- 
Mark A. Miller
mark@mirell.org

"My greatest strength, I guess it would be my humility. My greatest
weakness, it's possible that I'm a little too awesome" - Barack Obama

--0016e640d0f6cef750046702d3ef
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

In late October 2008, according to the git logs, the methodology for select=
ing a processor on several boards, at least the Versatile PB board was chan=
ged so that it automatically selects CPU_ARM926T as a hidden symbol.=A0<div=
>

<br></div><div>The reason I have a question, is since QEMU currently can em=
ulate a Versatile PB board with other processors than just the ARM926T (Suc=
h as the ARM1136 (ARMv6) and Cortex-A8 (ARMv7), is there a good way to allo=
w that in the mainstream kernel? Previously the patch was to just add extra=
 potential dependencies on CPU_V6 and CPU_V7, so that by selecting=A0MACH_V=
ERSATILE_PB, you could select ARMv6/v7 support.=A0</div>

<div><br></div><div>Currently I&#39;m just deleting the select statement, a=
nd having all the CPUs appear, as no longer hidden symbols. My question is,=
 what is the best way to allow for other processors for this board in Kconf=
ig, so it could be submitted to the mainstream kernel?</div>

<div><br></div><div>-- <br>Mark A. Miller<br><a href=3D"mailto:mark@mirell.=
org">mark@mirell.org</a><br><br>&quot;My greatest strength, I guess it woul=
d be my humility. My greatest weakness, it&#39;s possible that I&#39;m a li=
ttle too awesome&quot; - Barack Obama<br>


</div>

--0016e640d0f6cef750046702d3ef--


