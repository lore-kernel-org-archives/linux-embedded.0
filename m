From: Neil Armstrong <narmstrong@neotion.com>
Subject: [PATCH] uio: add ioctl callback
Date: Wed, 12 Nov 2008 15:11:03 +0100
Message-ID: <491AE3F7.4050202@neotion.com>
Reply-To: narmstrong@neotion.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig709096C2EB3F758246E68B8E"
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig709096C2EB3F758246E68B8E
Content-Type: multipart/mixed;
 boundary="------------030508070504070201000505"

This is a multi-part message in MIME format.
--------------030508070504070201000505
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Add an ioctl callback to the UIO device class.
This can be useful when status and data are needed after an interrupt
occurs.

Changes :
 - Add an uio_ioctl method
 - Add en ioctl entry in uio_info

Neil Armstrong <narmstrong@neotion.com>

Index: drivers/uio/uio.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- drivers/uio/uio.c    (revision 80)
+++ drivers/uio/uio.c    (working copy)
@@ -378,6 +378,17 @@
     return 0;
 }
=20
+static int uio_ioctl(struct inode *inode, struct file *filep, unsigned
int cmd, unsigned long arg)
+{
+    struct uio_listener *listener =3D filep->private_data;
+    struct uio_device *idev =3D listener->dev;
+  =20
+    if (idev->info->ioctl)
+        return idev->info->ioctl(idev->info, cmd, arg);
+  =20
+    return -ENOSYS;
+}
+
 static ssize_t uio_read(struct file *filep, char __user *buf,
             size_t count, loff_t *ppos)
 {
@@ -575,6 +586,7 @@
     .mmap        =3D uio_mmap,
     .poll        =3D uio_poll,
     .fasync        =3D uio_fasync,
+   .ioctl      =3D uio_ioctl,
 };
=20
 static int uio_major_init(void)
Index: include/linux/uio_driver.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- include/linux/uio_driver.h    (revision 80)
+++ include/linux/uio_driver.h    (working copy)
@@ -68,6 +68,7 @@
     int (*open)(struct uio_info *info, struct inode *inode);
     int (*release)(struct uio_info *info, struct inode *inode);
     int (*irqcontrol)(struct uio_info *info, s32 irq_on);
+    int (*ioctl)(struct uio_info *info, unsigned int cmd, unsigned long
arg);
 };
=20
 extern int __must_check


--------------030508070504070201000505
Content-Type: text/x-vcard; charset=utf-8;
 name="narmstrong.vcf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="narmstrong.vcf"

begin:vcard
fn:Neil Armstrong
n:Armstrong;Neil
org:Neotion;Neotion Sophia Antipolis
adr:;;;Sophia Antipolis;;;France
email;internet:narmstrong@neotion.com
title:Embedded Linux Software Engineer
tel;cell:0667474169
note:PGP 0x1166F485
x-mozilla-html:FALSE
url:http://www.neotion.com
version:2.1
end:vcard


--------------030508070504070201000505--

--------------enig709096C2EB3F758246E68B8E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFJGuP6b5rmahFm9IURArcEAJ4s0X5Vb/4koyuoQWhhGAZi+N2RTACgtbtE
Zez/07PZBhRu8Ei7yqA38n4=
=MN+0
-----END PGP SIGNATURE-----

--------------enig709096C2EB3F758246E68B8E--
