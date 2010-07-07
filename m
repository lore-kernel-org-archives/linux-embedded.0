From: Bill Gatliff <bgat@billgatliff.com>
Subject: Updated cs8900a driver available anywhere?
Date: Wed, 7 Jul 2010 14:44:29 -0500
Message-ID: <AANLkTilJ8JPjjD2M5Q934V8FIIFoBX9e13P32TliFVwT@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-net@vger.kernel.org, linux-embedded@vger.kernel.org

Guys:


I'm in the process of porting Linux over to an ARM-based platform that
features a CS8900 ethernet controller.

The mainlined drivers/net/cs8x0.c file needs some pretty serious love.
 Before I start hacking on it, does anyone know if there is a
non-mainlined improvement available anywhere?  Like one that supports
platform devices, for example?


Thanks!


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
