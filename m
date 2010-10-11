From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 14(16] pramfs: memory protection
Date: Mon, 11 Oct 2010 08:57:45 +0200
Message-ID: <AANLkTimGC_0W-=nSeoti6DLh5XNxvGwU6jqoGUkuOKPx@mail.gmail.com>
References: <4CB1EBA2.8090409@gmail.com>
	<87aamm3si1.fsf@basil.nowhere.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=podtOdTClr03qzSnqZExq8K96enh/aB3nzlZtdOPq5c=;
        b=GuU39DBuF6VjoWMZ72bfZkxP9+5QTBKUnc8pKG/TDWeGVp2CT2wNXUydY3WM3nVGM4
         +Su+sfbY2gKQXlHA8QwNMQF3/EmWMYFl5ZF/rPxh/FI8yjWB2fE6hV30zzm3lEU8SZOX
         y1JkECymf/nZx5qUur9wvWgjL9biDXP+k/qYY=
In-Reply-To: <87aamm3si1.fsf@basil.nowhere.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andi Kleen <andi@firstfloor.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, linux-mm@kvack.org

2010/10/10 Andi Kleen <andi@firstfloor.org>:
> Marco Stornelli <marco.stornelli@gmail.com> writes:
>> +
>> + =A0 =A0 do {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pgd =3D pgd_offset(&init_mm, address);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (pgd_none(*pgd) || unlikely(pgd_bad(*pg=
d)))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 pud =3D pud_offset(pgd, address);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (pud_none(*pud) || unlikely(pud_bad(*pu=
d)))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 pmd =3D pmd_offset(pud, address);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (pmd_none(*pmd) || unlikely(pmd_bad(*pm=
d)))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 ptep =3D pte_offset_kernel(pmd, addr);
>> + =A0 =A0 =A0 =A0 =A0 =A0 pte =3D *ptep;
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (pte_present(pte)) {
>
> This won't work at all on x86 because you don't handle large
> pages.

On x86 works because I tested. Maybe there's a particular
configuration with large pages. Sincerly I'm only an "user", so if
you/Linus or others want to change it or rewrite it, for me it's ok.
The pte manipulation are a bit out of scope for a fs, so I let the
things to the mm experts.
