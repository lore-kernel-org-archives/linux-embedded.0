From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH] add diffconfig utility
Date: Wed, 11 Jun 2008 11:23:50 -0700
Message-ID: <48501836.10900@am.sony.com>
References: <484ED902.9040000@am.sony.com> <20080610212158.GB23855@uranus.ravnborg.org> <484F1B8F.9000804@am.sony.com> <Pine.LNX.4.64.0806111328150.13310@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806111328150.13310@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Holger Schurig <hs4233@mail.mn-solutions.de>

Geert Uytterhoeven wrote:
> No checking for excess arguments?

Holger Schurig wrote:
> Would it be helpful to compare .config.old to .config if you
> don't provide any command line arguments?

Both good ideas.  These are implemented in the latest version.
Note that I check for and use KBUILD_OUTPUT.  (I always put
my build output outside the source directory, since
I usually build for multiple arches from a single tree.)

The program is also now better structured, IMHO.
 -- Tim

Diffconfig is a simple utility for comparing two .config files.
See usage in the script for more info.

Signed-off-by: Tim Bird <tim.bird@am.sony.com>

 scripts/diffconfig |  128 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100755 scripts/diffconfig

diff --git a/scripts/diffconfig b/scripts/diffconfig
new file mode 100755
index 0000000..aa6cfe1
--- /dev/null
+++ b/scripts/diffconfig
@@ -0,0 +1,128 @@
+#!/usr/bin/python
+#
+# diffconfig - a tool to compare .config files.
+#
+# originally written in 2006 by Matt Mackall
+#  (at least, this was in his bloatwatch source code)
+# last worked on 2008 by Tim Bird
+#
+
+import sys, os
+
+def usage():
+    print "Usage: diffconfig [-h] [-m] [<config1> <config2>]\n"
+    print """Diffconfig is a simple utility for comparing two .config files.
+Using standard diff to compare .config files often includes extraneous and
+distracting information.  This utility produces sorted output with only the
+changes in configuration values between the two files.
+
+Added and removed items are shown with a leading plus or minus, respectively.
+Changed items show the old and new values on a single line.
+
+If -m is specified, then output will be in "merge" style, which has the changed
+and new values in kernel config option format.
+
+If no config files are specified, .config and .config.old are used.
+
+Example usage:
+ $ diffconfig .config config-with-some-changes
+-EXT2_FS_XATTR  n
+-EXT2_FS_XIP  n
+ CRAMFS  n -> y
+ EXT2_FS  y -> n
+ LOG_BUF_SHIFT  14 -> 16
+ PRINTK_TIME  n -> y
+"""
+    sys.exit(0)
+
+# returns a dictionary of name/value pairs for config items in the file
+def readconfig(config_file):
+    d = {}
+    for line in config_file:
+        line = line[:-1]
+        if line[:7] == "CONFIG_":
+            name, val = line[7:].split("=", 1)
+            d[name] = val
+        if line[-11:] == " is not set":
+            d[line[9:-11]] = "n"
+    return d
+
+def print_config(op, config, value, new_value):
+    global merge_style
+
+    if merge_style:
+        if new_value:
+            if new_value=="n":
+                print "# CONFIG_%s is not set" % config
+            else:
+                print "CONFIG_%s=%s" % (config, new_value)
+    else:
+        if op=="-":
+            print "-%s %s" % (config, value)
+        elif op=="+":
+            print "+%s %s" % (config, new_value)
+        else:
+            print " %s %s -> %s" % (config, value, new_value)
+
+def main():
+    global merge_style
+
+    # parse command line args
+    if ("-h" in sys.argv or "--help" in sys.argv):
+	usage()
+
+    merge_style = 0
+    if "-m" in sys.argv:
+        merge_style = 1
+        sys.argv.remove("-m")
+
+    argc = len(sys.argv)
+    if not (argc==1 or argc == 3):
+        print "Error: incorrect number of arguments or unrecognized option"
+        usage()
+
+    if argc == 1:
+        # if no filenames given, assume .config and .config.old
+        build_dir=""
+        if os.environ.has_key("KBUILD_OUTPUT"):
+            build_dir = os.environ["KBUILD_OUTPUT"]+"/"
+
+        configa_filename = build_dir + ".config.old"
+        configb_filename = build_dir + ".config"
+    else:
+        configa_filename = sys.argv[1]
+        configb_filename = sys.argv[2]
+
+    a = readconfig(file(configa_filename))
+    b = readconfig(file(configb_filename))
+
+    # print items in a but not b (accumulate, sort and print)
+    old = []
+    for config in a:
+        if config not in b:
+            old.append(config)
+    old.sort()
+    for config in old:
+        print_config("-", config, a[config], None)
+        del a[config]
+
+    # print items that changed (accumulate, sort, and print)
+    changed = []
+    for config in a:
+        if a[config] != b[config]:
+            changed.append(config)
+        else:
+            del b[config]
+    changed.sort()
+    for config in changed:
+        print_config("->", config, a[config], b[config])
+        del b[config]
+
+    # now print items in b but not in a
+    # (items from b that were in a were removed above)
+    new = b.keys()
+    new.sort()
+    for config in new:
+        print_config("+", config, None, b[config])
+
+main()

