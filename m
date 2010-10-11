From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 15/16] pramfs: test module
Date: Mon, 11 Oct 2010 09:08:00 +0200
Message-ID: <AANLkTin1qUZ-Hp9J1HdzxHHf8uOY4_1Ss3wPDq35Z7F0@mail.gmail.com>
References: <4CB1EBDD.8050509@gmail.com>
	<20101010095703.aeae2f15.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=zyvq0Ffvuh+71P79CA1Ad+Z1qNYzyG0P1Ysq3IXQjvg=;
        b=MPj76Gq217AmHoAayBUSiw9sCPfMY6ES5DjRViE1+SaZId5OocHcf4GAOKssQDNbsl
         EAqqIoJ+eKMYXrvbS06QwnOM4ANnKVz4Nee6YtHp3hloOFtU4W5SygcjcI2QDxvjkXu+
         7GLJQy7BC1cc7B8dZ32/2l14ueBsxiOjpVF3w=
In-Reply-To: <20101010095703.aeae2f15.rdunlap@xenotime.net>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

2010/10/10 Randy Dunlap <rdunlap@xenotime.net>:
> On Sun, 10 Oct 2010 18:37:49 +0200 Marco Stornelli wrote:
>
> Above 2 lines need to indented more.
>

Ack.

>> + =A0 =A0 =A0 =A0 =A0 =A0 return 1;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* Attempt an unprotected clear of checksum information =
in the
>> + =A0 =A0 =A0* superblock, this should cause a kernel page protectio=
n fault.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 printk("%s: writing to kernel VA %p\n", __func__, psb);
>> + =A0 =A0 psb->s_sum =3D 0;
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +void test_pramfs_write_cleanup(void) {}
>> +
>> +/* Module information */
>> +MODULE_LICENSE("GPL");
>> +module_init(test_pramfs_write);
>> +module_exit(test_pramfs_write_cleanup);
>
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
