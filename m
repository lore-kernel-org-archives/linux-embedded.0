From: Rob Landley <rob@landley.net>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Tue, 12 Sep 2017 08:45:48 -0500
Message-ID: <bb73820f-745b-e55b-57f6-10b3de0f801b@landley.net>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
 <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
 <20170905142436.262ed118@alans-desktop>
 <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
 <d2d1acae-b2a1-9f41-d3bf-9d3b35a62664@landley.net>
 <20170911151526.GA4126@redhat.com>
 <d3ae79b1-810d-8abc-3692-69cef4bd1a7a@landley.net>
 <CAMuHMdXQn47LK6RLtdgW3JJtL1VwqK7ZvUdmLgaZat8TA30KtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vxvGPgLon7PWvxk3TjQv74UeUVYWJOQtNveyW6rivQM=;
        b=zR4gbPrAW84qRmJYryjPUloTGlOb4BG+zIzwzp8vpt/w91FaREg2okDY9fVwUqsHvf
         r9o3XLkUe9lddUuz4IMmu++LAc9mmPWZiiWF3HUKfhlzUyUiQQvunCDhfdvwijdmjIeB
         owiDkUcihT0hDnVjQ1Sb91qf88AO0Ff9tZkg+WSeOSIpvhBFEIE0NsoYdmdcEuo9KNMM
         csKKKZv5D1bfdmrlewht0ueO3WNlKA+Yz2bE9i6D1u8ObzC/FYyrkSnEAroWa83QNVlR
         GbeSg8KX215et5bTpmuJxYmUsYwsa72sURmPRhB5emqyl0VN/J+ATbSmA43nIQE1DtqS
         5o1A==
In-Reply-To: <CAMuHMdXQn47LK6RLtdgW3JJtL1VwqK7ZvUdmLgaZat8TA30KtQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Linux Embedded <linux-embedded@vger.kernel.org>, Rich Felker <dalias@libc.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 09/12/2017 06:30 AM, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Tue, Sep 12, 2017 at 12:48 PM, Rob Landley <rob@landley.net> wrote:
>> Your stack has pointers. Your heap has pointers. Your data and bss (once
>> initialized) can have pointers. These pointers can be in the middle of
>> malloc()'ed structures so no ELF table anywhere knows anything about
>> them. A long variable containing a value that _could_ point into one of
>> these ranges isn't guaranteed to _be_ a pointer, in which case adjusting
>> it is breakage. Tracking them all down and fixing up just the right ones
>> without missing any or changing data you shouldn't is REALLY HARD.
> 
> Hence (make the compiler) never store pointers, only offsets relative to a
> base register. So after making copies of stack, data/bss, and heap, all you
> need to do is adjust these base registers for the child process.
> Nothing in main memory needs to be modified.

Ok, I'll bite. How do you set a signal handler under this regime, since
that needs to pass a function pointer to the syscall? Have a different
function pointer type for when you want a real pointer instead of an
offset pointer? Perhaps label them "near" and "far" pointers, since
there's precedent for that back under DOS?

When you call printf(), how does it accept both a "string constant"
living in rodata and a char array on the stack? Two printf functions
with different argument types? If it _does_ take an actual memory
address rather than an offset that isn't always vs the same segment then
you've written pointers to the stack...

You're also requiring static linking: shared libraries work just fine
with fdpic, but under your segment:offset addressing system all text has
to be relative to the same code segment.

Plus there's still the "fork() off of mozilla" problem that you may copy
lots of data just to immediately discard it as the common case (unless
you'd still use vfork() for most things), and you still need contiguous
blocks of memory for each segment (nommu is vulnerable to fragmentation,
increasingly so as the system stays up longer) so your fork() will fail
where vfork() succeeds. But that just makes it really slow and
unreliable, rather than requiring a large rewrite of the C language.

> Text accesses can be PC-relative => nothing to adjust.
> Local variable accesses are stack-relative => nothing to adjust.
> Data/bss accesses can be relative to a reserved register that stores the
> data base address => only adjust the base register, nothing in RAM to adjust.

Does this compiler setup you're describing actually exist?

Instead of making a minor adjustment to one system call, it's better to
extensively rewrite compilers and calling conventions, ignoring the way
C traditionally treats strings and arrays as pointers where pointers
into data, bss, heap, and stack are all used interchangeably...

> Heap accesses can be relative to a reserved register that stores the heap
> base address => only adjust the base register, nothing in RAM to adjust.

Query: if you implement a linked list ala:

struct blah {
  struct blah *next;
  char *key, *value;
};

If next points to a malloc(), key is a constant string in rodata, and
value was strchr(getenv(key), '=')+1 (with appropriate error checking of
course), how does your compiler know which segment each pointer in that
structure is offset from? (What segment IS your environment space
relative to, anyway? It's not the _current_ value of your stack pointer,
that moves.)

How does your proposed compiler rewrite handle mmap()? You can do
MAP_SHARED just fine on nommu today, it's only MAP_PRIVATE that requires
copy on write. (Yes MAP_SHARED can be read only.)

You're aware that most heap implementations can have more than one
underlying mmap(), right?

  http://git.musl-libc.org/cgit/musl/tree/src/malloc/malloc.c#n320

https://github.com/kraj/uClibc/blob/master/libc/stdlib/malloc/malloc.c#L121

So when you say _the_ heap base address above, which chunk are you
referring to?

Rob
