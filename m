From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH 3/5] Kconfig files and Makefile for KBUS
Date: Sun, 27 Feb 2011 10:19:27 -0800
Message-ID: <20110227101927.3a15e535.rdunlap@xenotime.net>
References: <cover.1298829754.git.tibs@tonyibbs.co.uk>
	<ab146dd857b6cfa607b0ea426e1c99ddcebb756a.1298829754.git.tibs@tonyibbs.co.uk>
	<9d2ffc1567208d8890d7ef28f93f7a8914d753af.1298829754.git.tibs@tonyibbs.co.uk>
	<97f70d8d0a9026658bb08d8bb4b054124553a0cb.1298829754.git.tibs@tonyibbs.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <97f70d8d0a9026658bb08d8bb4b054124553a0cb.1298829754.git.tibs@tonyibbs.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tony Ibbs <tibs@tonyibbs.co.uk>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>, Grant Likely <grant.likely@secretlab.ca>

On Sun, 27 Feb 2011 18:11:46 +0000 Tony Ibbs wrote:

> From: Tibs <tibs@tonyibbs.co.uk>
> 
> Amend the ipc Makefile.
> Add an ipc Kconfig for KBUS.
> Amend the init Kconfig appropriately.
> 
> Signed-off-by: Tony Ibbs <tibs@tonyibbs.co.uk>
> ---
>  init/Kconfig |    3 ++
>  ipc/Kconfig  |   99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  ipc/Makefile |    5 +++
>  3 files changed, 107 insertions(+), 0 deletions(-)
>  create mode 100644 ipc/Kconfig
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index c972899..a31a6fe 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -339,6 +339,8 @@ config AUDIT_TREE
>  	depends on AUDITSYSCALL
>  	select FSNOTIFY
>  
> +source "ipc/Kconfig"
> +
>  source "kernel/irq/Kconfig"
>  
>  menu "RCU Subsystem"
> @@ -1305,3 +1307,4 @@ config PADATA
>  	bool
>  
>  source "kernel/Kconfig.locks"
> +

You can drop that line.

> diff --git a/ipc/Kconfig b/ipc/Kconfig
> new file mode 100644
> index 0000000..46ebcda
> --- /dev/null
> +++ b/ipc/Kconfig
> @@ -0,0 +1,99 @@
> +config KBUS
> +        tristate "KBUS messaging system"
> +        default m

Use tabs to indent kconfig entry text, like above (not spaces).

Please do not enable new configs unless they are absolutely required.

> +        ---help---
> +	KBUS is a lightweight messaging system, particularly aimed
> +	at embedded platforms. This option provides the kernel support
> +	for mediating messages between client processes.
> +
> +	If you want KBUS support, you should say Y here.
> +
> +	This support can also be built as a module. If so, the module
> +	will be called kbus.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
