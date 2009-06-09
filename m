From: Childhood Hwang <childhood.hwang@gmail.com>
Subject: USB : Problem in backporting C67x00 Driver to kernel 2.6.20
Date: Tue, 9 Jun 2009 20:45:28 +0800
Message-ID: <f4b46ce60906090545n3a277feftbd9491df0a7c51db@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=/KKccq31dEXhLlmrWyZB0R/HXzXKD8pXXoSkI3YyAxs=;
        b=ty7wRqlOB5ZUcy/ijxjMlKIOP6Y3V7mEFIFkKGRUe6zaR1EeLpCvj1GP3s8dn2K5S/
         GllgGM7siCdounrkYEp70NNyWj4/cpH3LaSjIxJRscdWCOLM9iDvTzE9ROjjrN5iEpEz
         EtNJTAEfMO+4C3C70E05M9JdT5UdD34pshprc=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

I am tring to backport C67x00 driver to kernel 2.6.20 right now. But I
can't make it work.
I saw there was some discussion before, and it seem's that those
discussions were the right thing  messing me.

I found the discussion in link: http://marc.info/?t=122849175200004&r=1&w=2

But there is no answer how to getover this, just that the problem was
in different status handling for older kernel.

I am quite newest to Linux.

I insert a kernel module that register the platform device for USB,
I think the interrupt works well.
Register code is like that,:

static struct resource c67x00_resources[] = {
        [0] = {
                .start  = 0x80800000,
                .end    = 0x8080ffff,
                .flags  = IORESOURCE_MEM,
        },
        [1] = {
                .start  = 0,
                .end    = 0,
                .flags  = IORESOURCE_IRQ,
        },
};

static struct c67x00_platform_data c67x00_data = {
        .sie_config             = C67X00_SIE1_HOST | C67X00_SIE2_HOST,
        .hpi_regstep            = 0x02,
};

static struct platform_device c67x00_device = {
        .name                   = "c67x00",
        .id                     = -1,
        .num_resources          = ARRAY_SIZE(c67x00_resources),
        .resource               = c67x00_resources,
        .dev.platform_data      = &c67x00_data,
};

static int __init c67x00_device_reg_init(void)
{
	/* printk("<1>Hello module world.\n");
	printk("<1>Module parameters were (0x%08x) and \"%s\"\n", myint,
	       mystr); */
	printk("======== Call : c67x00_device_reg_init() ========\n");
	
	/* A non 0 return means init_module failed; module can't be loaded. */
	return platform_device_register(&c67x00_device);
}


static void __exit c67x00_device_reg_exit(void)
{
	printk(KERN_ALERT "======== Goodbye c67x00_device_reg_exit(). ========\n");
	platform_device_unregister(&c67x00_device);
}

module_init(c67x00_device_reg_init);
module_exit(c67x00_device_reg_exit);


And the log list below:

# insmod /lib/modules/kernel/drivers/misc/c67x00_device_reg.ko
======== Call : c67x00_device_reg_init() ========
============ USB driver : Call c67x00_drv_probe() ============
c67x00 c67x00: Cypress C67X00 Host Controller
drivers/usb/core/inode.c: creating file 'devices'
drivers/usb/core/inode.c: creating file '001'
c67x00 c67x00: new USB bus registered, assigned bus number 1
usb usb1: default language 0x0409
usb usb1: new device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: Cypress C67X00 Host Controller
usb usb1: Manufacturer: Linux 2.6.20-uc0 c67x00-hcd
usb usb1: SerialNumber: c67x00_sie
usb usb1: usb_probe_device
usb usb1: configuration #1 chosen from 1 choice
usb usb1: adding 1-0:1.0 (config #1, interface 0)
hub 1-0:1.0: usb_probe_interface
hub 1-0:1.0: usb_probe_interface - got id
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
hub 1-0:1.0: standalone hub
hub 1-0:1.0: ganged power switching
hub 1-0:1.0: global over-current protection
hub 1-0:1.0: power on to power good time: 100ms
hub 1-0:1.0: local power source is good
hub 1-0:1.0: no over-current condition exists
hub 1-0:1.0: enabling power on all ports
drivers/usb/core/inode.c: creating file '001'
hub 1-0:1.0: state 7 ports 2 chg 0000 evt 0000
c67x00 c67x00: Cypress C67X00 Host Controller
drivers/usb/core/inode.c: creating file '002'
c67x00 c67x00: new USB bus registered, assigned bus number 2
usb usb2: default language 0x0409
usb usb2: new device strings: Mfr=3, Product=2, SerialNumber=1
usb usb2: Product: Cypress C67X00 Host Controller
usb usb2: Manufacturer: Linux 2.6.20-uc0 c67x00-hcd
usb usb2: SerialNumber: c67x00_sie
usb usb2: usb_probe_device
usb usb2: configuration #1 chosen from 1 choice
usb usb2: adding 2-0:1.0 (config #1, interface 0)
hub 2-0:1.0: usb_probe_interface
hub 2-0:1.0: usb_probe_interface - got id
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
hub 2-0:1.0: standalone hub
hub 2-0:1.0: ganged power switching
hub 2-0:1.0: global over-current protection
hub 2-0:1.0: power on to power good time: 100ms
hub 2-0:1.0: local power source is good
hub 2-0:1.0: no over-current condition exists
hub 2-0:1.0: enabling power on all ports
drivers/usb/core/inode.c: creating file '001'
hub 2-0:1.0: state 7 ports 2 chg 0000 evt 0000



# hub 1-0:1.0: state 7 ports 2 chg 0000 evt 0002
hub 1-0:1.0: port 1, status 0101, change 0001, 12 Mb/s
hub 1-0:1.0: debounce: port 1: total 100ms stable 100ms status 0x101
c67x00 c67x00: ClearPortFeature (0): C_RESET
usb 1-1: new full speed USB device using c67x00 and address 2
c67x00 c67x00: ClearPortFeature (0): C_RESET
c67x00 c67x00: ### TIMEOUT at 0x0500
c67x00 c67x00: urb:      0x902390cc
c67x00 c67x00: endpoint:      0
c67x00 c67x00: pipeout:       1
c67x00 c67x00: ly_base_addr: 0x0700
c67x00 c67x00: port_length:  0x0008
c67x00 c67x00: pid_ep:         0xd0
c67x00 c67x00: dev_addr:       0x00
c67x00 c67x00: ctrl_reg:       0x01
c67x00 c67x00: status:         0x14
c67x00 c67x00: retry_cnt:      0x00
c67x00 c67x00: residue:        0x00
c67x00 c67x00: next_td_addr: 0x0000
c67x00 c67x00: data:<3>usb 1-1: device not accepting address 2, error -115
c67x00 c67x00: ClearPortFeature (0): C_RESET
usb 1-1: new full speed USB device using c67x00 and address 3
c67x00 c67x00: ClearPortFeature (0): C_RESET
c67x00 c67x00: ### TIMEOUT at 0x0500
c67x00 c67x00: urb:      0x902390cc
c67x00 c67x00: endpoint:      0
c67x00 c67x00: pipeout:       1
c67x00 c67x00: ly_base_addr: 0x0700
c67x00 c67x00: port_length:  0x0008
c67x00 c67x00: pid_ep:         0xd0
c67x00 c67x00: dev_addr:       0x00
c67x00 c67x00: ctrl_reg:       0x01
c67x00 c67x00: status:         0x14
c67x00 c67x00: retry_cnt:      0x00
c67x00 c67x00: residue:        0x00
c67x00 c67x00: next_td_addr: 0x0000
c67x00 c67x00: data:<3>usb 1-1: device not accepting address 3, error -115
c67x00 c67x00: ClearPortFeature (0): C_RESET
usb 1-1: new full speed USB device using c67x00 and address 4
c67x00 c67x00: ### TIMEOUT at 0x0500
c67x00 c67x00: urb:      0x902390cc
c67x00 c67x00: endpoint:      0
c67x00 c67x00: pipeout:       1
c67x00 c67x00: ly_base_addr: 0x0700
c67x00 c67x00: port_length:  0x0008
c67x00 c67x00: pid_ep:         0xd0
c67x00 c67x00: dev_addr:       0x00
c67x00 c67x00: ctrl_reg:       0x01
c67x00 c67x00: status:         0x14
c67x00 c67x00: retry_cnt:      0x00
c67x00 c67x00: residue:        0x00
c67x00 c67x00: next_td_addr: 0x0000
c67x00 c67x00: data:<3>usb 1-1: device not accepting address 4, error -115
c67x00 c67x00: ClearPortFeature (0): C_RESET
usb 1-1: new full speed USB device using c67x00 and address 5
c67x00 c67x00: ### TIMEOUT at 0x0500
c67x00 c67x00: urb:      0x902390cc
c67x00 c67x00: endpoint:      0
c67x00 c67x00: pipeout:       1
c67x00 c67x00: ly_base_addr: 0x0700
c67x00 c67x00: port_length:  0x0008
c67x00 c67x00: pid_ep:         0xd0
c67x00 c67x00: dev_addr:       0x00
c67x00 c67x00: ctrl_reg:       0x01
c67x00 c67x00: status:         0x14
c67x00 c67x00: retry_cnt:      0x00
c67x00 c67x00: residue:        0x00
c67x00 c67x00: next_td_addr: 0x0000
c67x00 c67x00: data:<3>usb 1-1: device not accepting address 5, error -115
