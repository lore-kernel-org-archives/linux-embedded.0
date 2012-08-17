From: Ambroz Bizjak <ambrop7@gmail.com>
Subject: NCD, a light scripting language for network configs and much more
Date: Fri, 17 Aug 2012 12:03:55 +0200
Message-ID: <CAOA3yKKmuAi=CPE=4-hyoGJJ7D7Oa_Bug5G=1Z3xif-5iFGeOw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-admin-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=pPoJ3PsZ6RMszIDJfGuL+7QXA4bvEby9pgb5hIWhye0=;
        b=ssc1j65goLrMWnvyvQBIttzGw0ANu9e9m+jzKZYYSKJd2CRRu/nxBF4RoBm1oxFQZN
         brdlajoU7KjU4UzZ2q2Gxd9odoqJLdHgKzB//+wxkl/D3Qc5hDZEPyD8XnlxYCT3MsR0
         D5JeeNvHJE495Dlq3GBZ4Bj7Jsm5LJw2MVojThlxU8LO9CltjBS7PZrDE3+Cwhqf8Slq
         6xGaRqEBu8QhUzRUi5giKsbE+eh3KMLwvCoZsQEMrFXKekVu0a4b5nzDQTNXcHeGdQeA
         hVP6Lb5GVQje6r0U7uqgCAiAPUyz0yy/hSeMbk4gCJyIgNzSTKgYzHIHogUmToOYzX3q
         JI2w==
Sender: linux-admin-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org, linux-hotplug@vger.kernel.org, netfilter@vger.kernel.org, linux-admin@vger.kernel.org, torvalds@osdl.org

Hi. I'm developing a special kind of scripting language which many
might find useful: http://code.google.com/p/badvpn/wiki/NCD

It was (originally) designed for programming dynamic configuration of
network interfaces, iptables etc. For example, there are commands that
observe the presence and link status of network interfaces. Many
commands are reversible, which makes it very easy to do cleanup
automatically and implicitly, like removing IP addresses or routes
when the link goes down on an interface.

The major advantage of this language compared to existing systems like
NetworkManager and wicd is that it's extremely hackable; you can fine
tune almost any part of the process. For example, this simple script
will create a network bridge, ensure that interfaces eth0 and eth1 are
in the bridge whenever they exist (consider hotplugging USB
interfaces), and only after eth0 (!) is up and running will it obtain
an IP address on br0 (!) using DHCP (since we know DHCP server is on
eth0 not eth1).

process bridge {
    # Choose name of bridge.
    var("br6") bridge_dev;

    # Create the bridge (and destroy it on deinit).
    run({"/sbin/brctl", "addbr", bridge_dev},
        {"/sbin/brctl", "delbr", bridge_dev});

    # Set bridge up.
    net.up(bridge_dev);

    # Wake up ports.
    provide("BRIDGE");

    # Wait for port eth0 where we expect to have the DHCP server.
    depend("BRIDGE-link");

    # Obtain IP address.
    net.ipv4.dhcp(bridge_dev) dhcp;

    # Sanity check IP address.
    ip_in_network(dhcp.addr, "127.0.0.0", "8") test_local;
    ifnot(test_local);

    # Assign IP address (and remove it when anything goes wrong,
    # e.g. lease times out, eth0 disappears or loses link...).
    net.ipv4.addr(bridge_dev, dhcp.addr, dhcp.prefix);

    println("Got address: ", dhcp.addr, "/", dhcp.prefix);
    rprintln("Lost address");
}

process bridge_port_eth0 {
    depend("BRIDGE") br;

    # Choose name of device.
    var("eth0") dev;

    # Wait for device to start existing (and trigger deinit
    # when it stops existing).
    net.backend.waitdevice(dev);

    # Add it to the bridge (and remove it when it stops
    # existing or we're quitting).
    run({"/sbin/brctl", "addif", br.bridge_dev, dev},
        {"/sbin/brctl", "delif", br.bridge_dev, dev});

    # Set device up.
    net.up(dev);

    # Wait for link.
    net.backend.waitlink(dev);

    # Wake up bridge process so it can start DHCP.
    provide("BRIDGE-link");
}

# other ports: same as above, just no need to wait for link
process bridge_port_eth1 {
    depend("BRIDGE") br;
    var("eth1") dev;
    net.backend.waitdevice(dev);
    run({"/sbin/brctl", "addif", br.bridge_dev, dev},
        {"/sbin/brctl", "delif", br.bridge_dev, dev});
    net.up(dev);
}

Note that nothing is ever leaked here. When the NCD interpreter
receives SIGTERM, it automatically cleans up everything (removes IP
addresses, destroys bridge...).

The language is suitable for much more than network configs. For
instance, it allows receiving input/evdev events from a single device
with only a few lines of code:

process main {
    sys.evdev("/dev/input/by-id/usb-BTC_USB_Multimedia_Keyboard-event-kbd")
evdev;
    println("Event: ", evdev.type, " ", evdev.value, " ", evdev.code);
    val_equal(evdev.code, "KEY_ENTER") is_enter;
    If (is_enter) {
        println("You pressed enter!");
    };
    evdev->nextevent();
}

With some more code it's possible to automatically listen on all event
devices as they come and go.

I think it would also make a great base to build an init system upon
(implement init process in NCD language). I've toyed a little with
this and got something very simple working, see
http://code.google.com/p/ncdinit/ .

Best regards,
Ambroz Bizjak
