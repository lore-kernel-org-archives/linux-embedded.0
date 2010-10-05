From: sugumar <sugumar.embedded@gmail.com>
Subject: Re: [PWM 01/10] API to consolidate PWM devices behind a common user and kernel interface
Date: Tue, 5 Oct 2010 10:35:20 +0000 (UTC)
Message-ID: <loom.20101005T121312-661@post.gmane.org>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Bill Gatliff <bgat <at> billgatliff.com> writes:

> 
> Signed-off-by: Bill Gatliff <bgat <at> billgatliff.com>
> ---
>  Documentation/pwm.txt   |  260 +++++++++++++++++++
>  drivers/pwm/pwm.c       |  635 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pwm.h     |   31 ---
>  include/linux/pwm/pwm.h |  128 ++++++++++
>  4 files changed, 1023 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/pwm.txt
>  create mode 100644 drivers/pwm/pwm.c
>  delete mode 100644 include/linux/pwm.h
>  create mode 100644 include/linux/pwm/pwm.h
> 
> diff --git a/Documentation/pwm.txt b/Documentation/pwm.txt
> new file mode 100644
> index 0000000..34b1e5a
> --- /dev/null
> +++ b/Documentation/pwm.txt
> @@ -0,0 +1,260 @@
> +                       

Hi bill,
   I have been working on writing generic PWM driver that provides common
interface to all the PWM devices. I hadn't come across this thread until kevin
pointed out. It looks like a very good implementation and i would like to make
my eHRPWM driver to fit into this framework. eHRPWM (enhanced high resolution
pwm) module has other features such as Dead Band, PWM chopper and Trip Zone and
i am not sure how to incorporate these in the generic framework. I really need
you help here.

    I am sure the generic framework should support all the features provided by
the PWM devices. For eg, eHRPWM has Trip-Zone feature where an asynchronous
input (incase of short circuit .) can be configured to generate an interrupt.
I am interested in finding a way to handle this. Kindly give your comments.


Regards,
N.Sugumar



