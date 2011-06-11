From: Nicholas Mc Guire <der.herr-kA1LtwSENNE@public.gmane.org>
Subject: Re: About the "Tiny Linux Kernel" project
Date: Sat, 11 Jun 2011 07:06:23 +0200
Message-ID: <20110611050622.GA25692@opentech.at>
References: <BANLkTikupJVJtF1hbnC6Y67E8ma7xNmeGg@mail.gmail.com>
	<4DF2B3EC.6020700@am.sony.com> <4DF2B952.30309@am.sony.com>
	<BANLkTikLT_QODGBDn2SXqQM0qR=4q8-fcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <celinux-dev-bounces-6s6PN4bAfpxAfugRpC6u6w@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTikLT_QODGBDn2SXqQM0qR=4q8-fcg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://tree.celinuxforum.org/mailman/options/celinux-dev>, 
	<mailto:celinux-dev-request-VxL1A5FK7jA05z2xGA6PZHhyD016LWXt@public.gmane.org?subject=unsubscribe>
List-Archive: <http://tree.celinuxforum.org/pipermail/celinux-dev>
List-Post: <mailto:celinux-dev-VxL1A5FK7jA05z2xGA6PZHhyD016LWXt@public.gmane.org>
List-Help: <mailto:celinux-dev-request-VxL1A5FK7jA05z2xGA6PZHhyD016LWXt@public.gmane.org?subject=help>
List-Subscribe: <http://tree.celinuxforum.org/mailman/listinfo/celinux-dev>,
	<mailto:celinux-dev-request-VxL1A5FK7jA05z2xGA6PZHhyD016LWXt@public.gmane.org?subject=subscribe>
Sender: celinux-dev-bounces-6s6PN4bAfpxAfugRpC6u6w@public.gmane.org
Errors-To: celinux-dev-bounces-6s6PN4bAfpxAfugRpC6u6w@public.gmane.org
To: wu zhangjin <wuzhangjin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dongdong Deng <libfetion-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Zhan Rongkai <zhanrongkai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-VxL1A5FK7jA05z2xGA6PZHhyD016LWXt@public.gmane.org" <celinux-dev-VxL1A5FK7jA05z2xGA6PZHhyD016LWXt@public.gmane.org>

On Sat, 11 Jun 2011, wu zhangjin wrote:

> On Sat, Jun 11, 2011 at 8:39 AM, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org> wrote:
> > On 06/10/2011 05:16 PM, Tim Bird wrote:
> >> The system has a full network and bluetooth stack, sensor
> >> monitoring software, and a web browser.
> > Oops. Should be "web server". ?I don't know of a modern
> > browser that fits in less than 3 meg.
> 
> For web browser, what bout lynx, links2 and w3m?  ;-)
>
and if limited functionality is needed a custom browser can be 
built easily (even netcat + shell could do) - for web servers
there are plenty of very small servers for serving static pages
combined with a process to updated the pages (i.e. cron/shell loop)
this is fine for monitoring a system  (thttp or the like - 20k)
the static page limit is actually advisable due to security issues
or it starts getting really complicated.

hofrat 
