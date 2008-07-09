From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: building Rootfs
Date: Tue, 08 Jul 2008 17:52:34 -0700
Message-ID: <48740BD2.6090000@cisco.com>
References: <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com>	 <20080708140034.B2B7424681@gemini.denx.de> <63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1835; t=1215564762; x=1216428762;
	c=relaxed/simple; s=rtpdkim2001;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20building=20Rootfs
	|Sender:=20
	|To:=20Linus=20Walleij=20<linus.ml.walleij@gmail.com>;
	bh=K8KrgQXKMNqIFv2j1qDIKBEZ2qAE4gpmzqw42aaG2PU=;
	b=BcperpwdltzkKNc88IizM2tWMuS0IIeEy/8hfbTpQFjQRXCfO17sXymelf
	El+jFAawHnhBl4s6q+GjiyNahTJPLaD4kNtgOTjTVvZm67QwvRYAKfn6o0M2
	FLjVp+1+Fv;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-embedded@vger.kernel.org

Linus Walleij wrote:
> If you know some way of sneaking a device node into a
> .tar file created ENTIRELY running as a regular user,
> tell me!

We do this all the time. We have a very minimal root filesystem and aren't 
currently using any of the frameworks for building root filesystems, so 
everything is done with make. In general, we create tar files for each piece. The 
piece that has device nodes has a make file with something like:

	all:
		fakeroot make fakeroot-package

	fakeroot-package:
		mkdir -p image
		mknod image/dev/null c 1 3
		mknod image/dev/random c 1 8
		tar -C image -czf image.tgz .

We ran into some issues when we separated running mknod and tar into separate 
fakeroot invocations because there is a bug in fakeroot with exporting and 
importing its state. Fortunately, doing all of this under a single fakeroot 
command works just fine. When we untar the tar files for all of the pieces to 
create a root filesystem image and then run mkcramfs to create a CRAMFS image, we 
do all commands under a single invocation of fakeroot.

No stage of the build requires running as root.
-- 
David VomLehn, dvomlehn@cisco.com




     - - - - -                              Cisco                            - - - - -         
This e-mail and any attachments may contain information which is confidential, 
proprietary, privileged or otherwise protected by law. The information is solely 
intended for the named addressee (or a person responsible for delivering it to 
the addressee). If you are not the intended recipient of this message, you are 
not authorized to read, print, retain, copy or disseminate this message or any 
part of it. If you have received this e-mail in error, please notify the sender 
immediately by return e-mail and delete it from your computer.
