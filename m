From: "Linus Walleij" <linus.walleij@stericsson.com>
Subject: [POWER] battery calibration parameters from sysfs
Date: Fri, 4 Dec 2009 11:42:22 +0100
Message-ID: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755222AbZLDKmV@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cbou@mai.ru, dwmw2@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org

Hi,

we're working on battery charging support for ST-Ericsson MFD ASICs
like AB3100 and later series. I have this issue about battery
calibration
parameters that I need advice on, and more specifically on how to use
sysfs to get that data in.

Most devices of this kind does not need the stuff we're doing so we're
the odd bird here. Other batteries are "smart" (contain factory
calibration inside of them) or get calibration from some BIOS or such.

In our code we have a number of (x,y) pair tables like this:

/* Vbat mV to Battery capacity % */
struct voltage_vs_capacity {
	int voltage;
	int capacity;
};

/*
 * Default calibration table for voltage vs battery capacity.
 * Voltage in millivolts, capacity given in permil.
 */
struct voltage_vs_capacity voltage_to_battery_capacity_init[] = {
	{ 4177, 1000 },
	{ 4070,  900 },
	{ 3988,  800 },
	{ 3834,  570 },
	{ 3797,  470 },
	{ 3768,  320 },
	{ 3721,  190 },
	{ 3633,   60 },
	{ 3523,   30 },
	{ 3200,    0 },
};

We then interpolate between two subsequent (xn,yn),(xn+1,yn+1)
pairs to get a calibrated capacity value from the voltage
level measured.

This is all good as long as you compile the calibration into the kernel
like this.

However we want to override the default table with one fed in
though e.g. sysfs, so calibration data for the battery can reside
in the file system. NOTE: this table is NOT of fixed length, i.e.
we don't know how many (x,y) pairs will be passed in.

Whereas the rule for sysfs is one value per file, creating an arbitrary
large hirarchy like this:

/sys/.../v_vs_cap/x0
/sys/.../v_vs_cap/y0
/sys/.../v_vs_cap/x1
/sys/.../v_vs_cap/y2
...
/sys/.../v_vs_cap/xN
/sys/.../v_vs_cap/yN

Is probably not very elegant. (Or is it?) Would it be permissible to
pass in a table like:

cat >/sys/.../v_vs_cap <<EOF
x0,y0
x1,y1
x2,y2
EOF

And have the kernel parse x,y pairs up to EOF?

Or would it be preferable to do this thing by creating some
misc device node like /dev/battery0 and a custom ioctl()?

Or is there some other way I haven't thought of?

Yours,
Linus Walleij
ST-Ericsson
