From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: Need help adding platform UIO devices to board
Date: Wed, 28 Nov 2012 20:03:53 +0100
Message-ID: <20121128190353.GA20385@opentech.at>
References: <50B65DA3.9000707@mail.ru>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <50B65DA3.9000707@mail.ru>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-embedded@vger.kernel.org

On Wed, 28 Nov 2012, Alexander Varnin wrote:

> Hello!
> I'm trying to add UIO device to my system to handle interrupt. But i'm
> facing following problem. Docs says, on reading device /dev/uio0 it will
> block until interrupt occurs. I've made simple program for test. It
> tries to write 1 to enable interrupts.
> 
>     #include <unistd.h>
>     #include <errno.h>
>     #include <fcntl.h>
>     #include <stdio.h>
> 
>     int main()
>     {
>         int fd;
>         char c = 1;
>         fd = open("/dev/uio0", O_RDONLY);
>         if (fd<0) {
>             printf("open error: %d\n", errno);
>              return 0;
>         }
>         printf("fd == %d\n", fd);
>         int res = write(fd, &c, 1);
>         if(res<0) {
>             printf("write error: %d\n", errno);
>         }
>         return 0;
>     }
>
open O_RDONLY and then write to it ?

return of 9 == EBADF

man 2 write

 EBADF  fd is not a valid file descriptor or is not open for writing.

hofrat 
