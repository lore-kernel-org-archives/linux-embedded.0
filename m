From: Manuel Reimer <Manuel.Spam@nurfuerspam.de>
Subject: 3.15.4 runs *significantly* slower than 3.15.3 on iMX233 CPU
Date: Mon, 07 Jul 2014 20:13:25 +0200
Message-ID: <lpeo05$sc8$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Hello,

maybe someone can help me to find the reason for this problem:

If I run my iMX233 development board with an 3.15.3 kernel, then the 
performance is much better as with an 3.15.4 kernel.

I have the first significant "hanging" here:

[    7.910000] sd 0:0:0:0: [sda] Attached SCSI removable disk
[   10.810000] random: nonblocking pool is initialized
[   24.310000] systemd[1]: systemd 214 running in system mode. (+PAM 
-AUDIT -SELINUX -IMA -SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ +SECCOMP 
-APPARMOR)

After booting up it takes several seconds between entering the username 
and the password while with version 3.15.3 the password prompt appears 
almost immediately after entering the username.

Please tell me if some additional information is needed.

Thank you very much in advance.

Greetings,

Manuel
