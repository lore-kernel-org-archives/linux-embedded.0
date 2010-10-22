From: Matthias Dunda <user254@t1817.greatnet.de>
Subject: Reading the temperature from another module
Date: Fri, 22 Oct 2010 10:02:04 +0200
Message-ID: <31A42C42-3D37-4312-A0C6-D45D0E91FF2B@t1817.greatnet.de>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi everybody,

I wrote some drivers for an embedded box. In one of these drivers I need the current system temperature.

My system works with the jc42.c driver and I can read the temperature perfectly via the proc filesystem in user space.

How do I query the temperature from another kernel driver?

First of all I added a new function and exported the symbol

int jc42_get_temperature()
{
    int temp;
    // TODO get the correct temp
    temp = jc42_read_value(my_local_client, JC42_REG_TEMP);
    return temp;
}
EXPORT_SYMBOL(jc42_get_temperature);

BUT: how do I get the temp? Most of the internal functions require a struct device or a struct i2c_client, which - I assume - are perfectly provided by the kernel when going the way over the proc file system.

I tried to statically save such a struct during the probing process (this is the above my_local_client), but this works neither. When I use the saved struct to call jc42_read_value, I always get a temperature value which is not correct at all.

Kernel is 2.6.29.6-rt24 (yes, jc42 is originally not included there - we ported it from a newer kernel release.)

Thanks for any help!
Matthias


