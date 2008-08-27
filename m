From: Fundu <fundu_1999@yahoo.com>
Subject: "kernel access of bad area" while accessing flash
Date: Tue, 26 Aug 2008 20:13:39 -0700 (PDT)
Message-ID: <425469.77736.qm@web63401.mail.re1.yahoo.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux embedded <linux-embedded@vger.kernel.org>

I have a PPC440GX based board.

Do I need to reinitialize Peripheral Bank Configuration Registers (EBC0_B0CR-EBC0_B7CR) from the kernel ?
I'm quite sure that we don't, but just want to make sure. Because the problem
that i'm seeing strongly suggest that it's probably not accessible. 

Here's the problem, i'm getting "kernel access of bad
 area" when i erase any of the upper 64mb out of 128mb flash region, surprisingly i can easily erase (all of the flash) from u-boot. which makes me ask the earlier question.   

any insights welcome.

thanks ! 


      
