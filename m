From: Tim Bird <tim.bird@am.sony.com>
Subject: Embedded Linux Flag Version
Date: Thu, 4 Nov 2010 15:07:28 -0700
Message-ID: <4CD32EA0.4070805@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Embedded Flag Version


Recently, two embedded Linux summit meetings were held, one in Tokyo,
Japan and one in Cambridge, UK. The purpose of these meetings was to
discuss among industry and community leaders things that might help
improve the value or decrease the cost of embedded Linux. One initiative
which came out of these meetings, was the notion of declaring a "flag
version" of Linux, for embedded use. This would be a specific version of
the Linux kernel, chosen as a rallying point for embedded Linux
software, add-ons and products.


In hearing from several different consumer electronics product companies
and semi-conductor producers at the summits, it became apparent that a
significant problem in the embedded space is variation in the kernel
version. This could be called version fragmentation. Companies,
especially those at the end of the software supply chain, often get
stuck using a particular kernel version for a product due to the cost to
integrate software coming from different entities.


Of course the optimal solution to this problem would be if all required
software were pre-integrated into the latest stable release, at all
times. However, software can not be mainlined instantaneously. Not
everyone is using the latest version of the Linux kernel (2.6.36, as of
this writing). In point of fact, no one in the CE industry does (or
really can), use the absolute latest kernel for a product that is
shipping today. It takes time to assemble the software and perform the
testing required to ship a product. However, it is desirable for many
reasons to stay as close to the current version of Linux as possible.


Selecting a "flag version" is intended to help with this problem. First,
it should be explained what having a flag version means. It means that
suppliers and vendors throughout the embedded industry will be
encouraged to use a particular version of the kernel for software
development, integration and testing. Also, industry and community
developers agree to work together to maintain a long-term stable branch
of the flag version of the kernel (until the next flag version is
declared), in an effort to share costs and improve stability and quality.


It may seem counter-intuitive that selecting a version of the kernel for
long-term stable maintenance would help companies keep up with the
mainline version. But there are a number of reasons why it can. First
and foremost, a lot of effort is spent integrating software components
to make a product. This includes software components from IP block
vendors, semi-conductor vendors, parts suppliers, Linux vendors, and
in-house software teams. By decreasing the effort required to integrate
this software, it becomes possible to spend more time working on other
features, and working with upstream, and increases the frequency that a
company can afford to switch kernel versions. Also, by leveraging the
testing of multiple organizations and developers, including those
outside one's own company, a group can more quickly ensure that a kernel
is suitable for production use. This also decreases the effort required
to use the kernel, and increases the possibility of quicker version changes.


It was noted at the summit that several CE companies and embedded
projects will be using (or are already using) 2.6.35 for upcoming
products or releases. This includes Sony, Google, Meego, and Linaro. On
behalf of the CE Linux Forum and a number of consumer electronics
companies, projects and community developers, we therefore declare
2.6.35 as a flag version of the kernel for embedded use. Several
companies will be investing in development, integration and testing of
this version. Entities wanting to do business with those companies would
therefore be well-advised to make sure their hardware, drivers and
enhancements work well with this version of the kernel.


Tim Bird
Architecture Group Chair
CE Linux Forum
November 4, 2010

