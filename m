From: Aravind Machiry <machiry@ucsb.edu>
Subject: A Quick Survey on a Patch Propagation Tool
Date: Tue, 19 Sep 2017 13:07:56 -0700
Message-ID: <CANozA0iZcbf7h5GmJyccRV+7vdgvC+Hm2v-Gw8GZ+M79eCEDWw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucsb.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=FV42scEpuO7YnLDmPz313uFF1RnMD2w8M8WZJi7yKkA=;
        b=L9jDD33sUSDSeqWbs/AdwOyJN/G2VxUHbC0VbByR5WcLTi6fNoHIs7ZuebPjKUzIVo
         HcHauhYeT/uTjCaLP4QONyLjuFOftG/pp9tLpo8XmgNz2puHW+pJbtCFDDVaKkp26kUt
         mTAV6A6NUQwGRm7jYHLGCWMbiybtEFCHFbyH2kDSSH5iL532EQC1v0dP/QkXFbgTQam8
         B9Kjf635GwtZZPFiwT5gXIW4P8XJ4ZD3RQlZKidnJ628e56y91SxhZMcRbfp42LTV0Cv
         TbJZqzH4cFhQU8Cr07S/8P1NFdMBd0bUAdGvYVaK44nqzACSHG6W6BuLj+9pmx04J8vT
         v26Q==
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hi Developer and maintainers,

We (researchers for UC Santa Barbara) are developing a tool that will
help in propagating patches.

Please, It would be great if you can fill a 2-question  anonymous
survey: https://goo.gl/forms/5cBSx4axKmc8BEtA3


Would you be interested in a tool, which identifies patches that could
be imported with a minimal or rather no testing?
E.g. Security patches, you can import security patches as they usually
do not affect the functionality.

This tool would use only old source file and the new source file!! No
commit messages, no build setup, nothing!!
Something like: git saferebase?

We actually used the tool on the Linux Main Line repository and it did
identify several (60%) patches which are safe to port or do not affect
the functionality.


This tool could be used to import patches from the main source branch
to your branch without worrying about testing them.

You can also use this tool as a patch monitor, which monitors all
commits to a repository and inform you about patches that do not
affect the functionality or otherwise safe patches.

Note that: This tool is supposed to *help* an expert not to *replace*  one.

Thank You,
Aravind
