Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D429827E;
	Fri, 17 Apr 2026 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776442288; cv=none; b=f3EFKIH2SujJ3RuoHW8I8vEMSjVUFa1DZdg30KCHWGmv0X4BqvXPOJFnN7Ims32tTzevyLdJ4WjIONFFCUBhP7yLlZK2mnjfZd40hTMy8Za1XHC6S/6HLDoJel8yohqR88BczHayetOvyIlRntfE+3aQOfrBSWiQyPzNOTbFBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776442288; c=relaxed/simple;
	bh=+RaDljmqWa6zQ/Ijmz40KO5URkKvCMsmQEorIbe7LRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EBdaxHT1m+W/tKoUCU7sCOVwZJ2ZDr9OZfdCV5AIE5ZWuRieB1H2VJF2WtBmCFNwZM19Dw8vJr9EUI1LYEtos4UqNiOUK895JHgY2DwwYJWGhLflkXbOKUijvtzEVFiKa7VEjTtMLVWrh6o8Me0pP/c0wPgLZVjnkHmr6bMHEkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id B0003C1660;
	Fri, 17 Apr 2026 16:11:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 47D862002A;
	Fri, 17 Apr 2026 16:11:21 +0000 (UTC)
Date: Fri, 17 Apr 2026 12:11:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@kernel.org>, Tim
 Bird <tim.bird@sony.com>, john.ogness@linutronix.de,
 senozhatsky@chromium.org, francesco@valla.it, geert@linux-m68k.org,
 shashankbalaji02@gmail.com, linux-embedded@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Message-ID: <20260417121117.53fe104f@fedora>
In-Reply-To: <CAJGKYO4aOqQ05=X+r8k7S-fnZiPUXZyroGOSG63kgzo1vbeRJg@mail.gmail.com>
References: <20260410203741.997410-1-tim.bird@sony.com>
	<20260410203741.997410-2-tim.bird@sony.com>
	<87qzohdv6i.ffs@tglx>
	<aeINb8-a83R3QDXd@pathway.suse.cz>
	<CAJGKYO4aOqQ05=X+r8k7S-fnZiPUXZyroGOSG63kgzo1vbeRJg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 47D862002A
X-Stat-Signature: 3xxjg1ffdccbj6uzxukwah7j86j9mjac
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18I3RPaYzTTOdIQEXJDi2OVu/K93uTEsng=
X-HE-Tag: 1776442281-587017
X-HE-Meta: U2FsdGVkX18yuRy9+aTQskf4yKyho4cqZO84WB/F0lk8QLO7Wwbd4721no06vk4Q1EVVWtyH6o/4+93l4DLbwNecbXBrnQj6WwZy4D3sbjqtWIyw30cE6UpV7uSXf1eAdlONbuw8NPlu/MJtO5JGzF/fQlDR9qRpOrRt1A5RLtpt+z1soEyuMdCE446MRSYYe+MIPyMAYJ/QqZHpOcpPhfNNPh9YMYuOW3Ba11kutnf9JenK40JWzCu/Fr+6rZaImK/G68g2C37E9xW7wPLkZOeHw2j3UvEkQACWa14e1oJbY7OJ3BWytrGzShspjAISV5+j5lIS4R5rrH2OOlC07kSt36z6M45IUMvGwD9zOioTqO8QwAYYWrPgNklBvXMxSneaxwXTSn6xCIGWrk/0aOI/hk3R1PXsDHYEZzpg9p3c92vQSVbfdtuGb1mDVqKw/o9O6rDLXY8=

On Fri, 17 Apr 2026 13:46:12 +0200
"Roberto A. Foglietta" <roberto.foglietta@gmail.com> wrote:

> V6 ~> https://lkml.org/lkml/2026/4/16/441

Note, nobody uses lkml.org anymore as it is unreliable and slow. We've
been using lore for years.

  https://lore.kernel.org/all/CAJGKYO7==hZ3OnRNuG81j6rxH3y1gK8qB-orxxrDsc4pNFv=hQ@mail.gmail.com/

-- Steve
