From: David Anders <dave123_aml@yahoo.com>
Subject: Re: testing ethernet device with external loopback
Date: Sun, 27 Jul 2008 09:25:47 -0700 (PDT)
Message-ID: <841230.21378.qm@web54403.mail.yahoo.com>
References: <488C3608.3000104@gmail.com>
Reply-To: dave123_aml@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <488C3608.3000104@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org, Sebastien Fauris <titelive72@gmail.com>

Sebastien,

check out the snull network driver from the "Linux Device Drivers" book. it has a short explanation on how to "trick" the kernel into sending the packet even though the destination is on the local machine:

http://www.linuxdriver.co.il/ldd3/chp-17-sect-1.shtml

dave aka prpplague



--- On Sun, 7/27/08, Sebastien Fauris <titelive72@gmail.com> wrote:

> From: Sebastien Fauris <titelive72@gmail.com>
> Subject: testing ethernet device with external loopback
> To: linux-embedded@vger.kernel.org
> Date: Sunday, July 27, 2008, 3:47 AM
> Hi,
> 
> for hardware testing purposes, I would like to perform an
> external 
> loopback on my ethernet interface. For this, I wrote 2
> little 
> executables, one  sending a raw ethernet packet (using
> 'sendto') on a 
> socket opened with the  parameters PF_PACKET, SOCK_RAW, 
> htons(ETH_P_ALL), the other one doing a recvfrom from a raw
> socket.
> The problem is that on the reception side, I always receive
> what I send, 
> even when
>  the external RJ45 stub is not plugged !
> Is there a way to tell to the kernel on the reception side
> that I want 
> to get only packets coming from the external world ?
> 
> Thanks,
> 
> Sebastien.
> 
> --
> To unsubscribe from this list: send the line
> "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html


      
