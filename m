From: Gregers Petersen <glp@openwrt.org>
Subject: Re: LZMA inclusion
Date: Wed, 03 Dec 2008 21:09:28 +0100
Message-ID: <4936E778.9020201@openwrt.org>
References: <492BA3FA.9010204@openwrt.org> <4936DFCD.2010204@am.sony.com>
Reply-To: glp@openwrt.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4936DFCD.2010204@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>, linux-embedded@vger.kernel.org

Tim Bird wrote:
> Gregers Petersen wrote:
>> There was a small talk a few days ago involving a few of the OpenWrt
>> developers and David Woodhouse. One of the topics discussed, was a
>> question about the potential of including LZMA in the kernel.
>> Such an inclusion would be quite benefitial in terms of embedded
>> systems, but the major hurdle seems to be the code quality of LZMA itself.
>> This leads to the question I would like to raise; are there ongoing
>> plans (or considerations) to rewrite and merge LZMA, and has anyone
>> started working on it in practical terms?
> 
> Did anyone answer this?  CELF is currently considering funding
> a project to do this (add LZMA support to the kernel), and
> it would be good to get a feel for the current status...
>  -- Tim
> 

I actually had one direct reply, in relationship to this project:

http://tukaani.org/

The tukaani work seems to be quite work-in-progress/alpha, but there is
progress. If such a project is to be funded it would probably be a good
idea to several partners involved (also due to the fact that it would
benifit the community as a whole).

Chz


-- 
Gregers Petersen
People-stuff, layer 8 and anthropology
glp on irc

  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 KAMIKAZE (bleeding edge) -----------------------
  * 10 oz Vodka       Shake well with ice and strain
  * 10 oz Triple sec  mixture into 10 shot glasses.
  * 10 oz lime juice  Salute!
 ---------------------------------------------------
