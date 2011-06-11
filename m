From: wu zhangjin <wuzhangjin@gmail.com>
Subject: Re: [Celinux-dev] About the "Tiny Linux Kernel" project
Date: Sat, 11 Jun 2011 11:28:59 +0800
Message-ID: <BANLkTi=EXY-fn9zem9MNRebA4vmGDbk8pQ@mail.gmail.com>
References: <BANLkTikupJVJtF1hbnC6Y67E8ma7xNmeGg@mail.gmail.com>
	<4DF2B3EC.6020700@am.sony.com>
	<4DF2B952.30309@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Yd0iTI4KZqG7i9PXYhyA2Untf6WGJwIYK7ysO6IkD44=;
        b=URFT8Oy5UuEGmU4Bw6ezQ7z6S5TE/DME3MdYforuqUVTodlObhUk4M78Q/fk3sC1Rn
         NfkZEQWtN0jslcOVg9ubEwK0KOAsoZNIFUY6zrRSqhUwWivprcUxcKrn/F5nl3DXsC0E
         GtohDnM4LfSatJyk9OeCJ5jJ5cZPZqQYup2FQ=
In-Reply-To: <4DF2B952.30309@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Dongdong Deng <libfetion@gmail.com>, Zhan Rongkai <zhanrongkai@gmail.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "celinux-dev@tree.celinuxforum.org" <celinux-dev@tree.celinuxforum.org>

Hi, Tim

On Sat, Jun 11, 2011 at 8:39 AM, Tim Bird <tim.bird@am.sony.com> wrote:
> On 06/10/2011 05:16 PM, Tim Bird wrote:
>> The system has a full network and bluetooth stack, sensor
>> monitoring software, and a web browser.
> Oops. Should be "web server". =A0I don't know of a modern
> browser that fits in less than 3 meg.

=46or such a system, I suggest you use the idea in another project
launched by me ;-)

It is vnstagsvg: http://vnstatsvg.sourceforge.net/

"vnStatSVG is a web front-end to vnStat(a network traffic logger). it
only requires a cgi-supported http server setup but also generates a
graphical report with SVG. and with the support of AJAX, it has a very
scalable architecture, hence, it is suited to the resource-limited
distributed & embedded linux system."

So, the httpd web server provided by busybox is enough, therefore you
can simply ignore the "web server" ;-)

If you want the background idea of this project, welcome to read my
paper: "A CGI+AJAX+SVG based monitoring method for distributed and
embedded system".

Best Regards,
Wu Zhangjin

> =A0-- Tim
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> Tim Bird
> Architecture Group Chair, CE Workgroup of the Linux Foundation
> Senior Staff Engineer, Sony Network Entertainment
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
>
