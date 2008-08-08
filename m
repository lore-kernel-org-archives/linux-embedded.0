From: "Haller, John H \(John\)" <jhaller@alcatel-lucent.com>
Subject: RE: [PATCH] [RFC] emit-crash-char: Allow diversion of printkoutput for crash logging
Date: Fri, 8 Aug 2008 16:24:21 -0500
Message-ID: <B78930B8E34A824993912C39C24569E601548BB5@ILEXC3U01.ndc.lucent.com>
References: <489BAD5C.2080009@cisco.com> <1218210904.19162.144.camel@localhost.localdomain> <8bd0f97a0808080905u1b515556gd68c2ba1d0b47cb4@mail.gmail.com> <1218212266.19162.149.camel@localhost.localdomain> <8bd0f97a0808081109q693f6f1at650a9be0547b7f9b@mail.gmail.com> <1218226225.19162.189.camel@localhost.localdomain> <8bd0f97a0808081313v4df788b9xcd25308ca64b0862@mail.gmail.com> <1218228464.19162.194.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <1218228464.19162.194.camel@localhost.localdomain>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Walker <dwalker@mvista.com>, Mike Frysinger <vapier.adi@gmail.com>
Cc: dvomlehn@cisco.com, linux-embedded@vger.kernel.org

> On Fri, 2008-08-08 at 16:13 -0400, Mike Frysinger wrote:
> 
> > same sort of things as the point of David's code.  early/crash
> > scenarios for people to safely extract portions of the kernel log
> > buffer for transmission/storage elsewhere.  as was explained in the
> > original thread behind the commit.
> 
> How is that code suppose to help anyone if you aren't calling it from
> anyplace in the kernel? Clearly your using it, right? Where 
> is the code
> your calling these functions from?
> 
> Daniel
Not that it was in the patch, but netconsole would be an
obvious potential user. It would be most useful in board
specific startup code such as arch/ppc/platforms, where
a particular board might have a place to put information
like this for later retrieval. One would hope that such
board specific file would be forthcoming, rather than be
maintained out-of-tree.
