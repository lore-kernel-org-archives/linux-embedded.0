From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] add diffconfig utility
Date: Tue, 10 Jun 2008 23:07:04 +0100
Message-ID: <1213135624.2534.99.camel@shinybook.infradead.org>
References: <484ED902.9040000@am.sony.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-39QbbmDbwuETDCfNZ8W2"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <484ED902.9040000@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>


--=-39QbbmDbwuETDCfNZ8W2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-06-10 at 12:41 -0700, Tim Bird wrote:
> +# Added and removed items are shown with a leading plus or minus,
> +# respectively.  Changed items show the old and new values on a
> +# single line.

It'd be really nice if it could give its output in the same form as
the .config file itself -- so it'd look something like:

# CONFIG_FOO is not set
CONFIG_BAR=y

That can be used with this kind of tool too...

-- 
dwmw2

--=-39QbbmDbwuETDCfNZ8W2
Content-Disposition: inline; filename=merge.pl
Content-Type: application/x-perl; name=merge.pl
Content-Transfer-Encoding: 7bit

#! /usr/bin/perl

my @args=@ARGV;
my %configvalues;
my @configoptions;
my $configcounter = 0;

# optionally print out the architecture as the first line of our output
my $arch = $args[2];
if (defined $arch) {
	print "# $arch\n";
}

# first, read the override file

open (FILE,"$args[0]") || die "Could not open $args[0]";
while (<FILE>) {
	my $str = $_;
	my $configname;

	if (/\# ([\w]+) is not set/) {
		$configname = $1;
	} elsif (/([\w]+)=/) {
		$configname = $1;
	}

	if (defined($configname) && !exists($configvalues{$configname})) {
		$configvalues{$configname} = $str;
		$configoptions[$configcounter] = $configname;
		$configcounter ++;
	}
};

# now, read and output the entire configfile, except for the overridden
# parts... for those the new value is printed.

open (FILE2,"$args[1]") || die "Could not open $args[1]";
while (<FILE2>) {
	my $configname;

	if (/\# ([\w]+) is not set/) {
		$configname = $1;
	} elsif (/([\w]+)=/) {
		$configname  = $1;
	}

	if (defined($configname) && exists($configvalues{$configname})) {
		print "$configvalues{$configname}";
		delete($configvalues{$configname});
	} else {
		print "$_";
	}
}

# now print the new values from the overridden configfile
my $counter = 0;

while ($counter < $configcounter) {
	my $configname = $configoptions[$counter];
	if (exists($configvalues{$configname})) {
		print "$configvalues{$configname}";
	}
	$counter++;
}

1;

--=-39QbbmDbwuETDCfNZ8W2--

