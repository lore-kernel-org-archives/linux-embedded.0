From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [RFC] Remove more code when IP_MULTICAST=n
Date: Tue, 19 Aug 2008 15:00:47 +0200
Message-ID: <20080819150047.38f09acf@surf>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>

[RFC] Remove more code when IP_MULTICAST=n

The idea of this patch originates from a patch by Matt Mackall in the
Linux Tiny project, adding a new CONFIG_IGMP option to compile out
net/ipv4/igmp.o on embedded devices running applications that don't
care about multicast.

After discussion with David Woodhouse, we wondered why introducing a
new option is necessary: couldn't all the IGMP code be compiled out
when IP_MULTICAST=n (IP_MULTICAST is an already existing option) ?

This patch implements this idea: net/ipv4/igmp.o and multicast-related
socket operations get compiled out when IP_MULTICAST=N. However, my
understanding of the network stack internals is too limited to be sure
that it actually makes sense, which is why I'm sending this patch
simply for comments on what could be done. In particular :

 * I'm not sure why net/ipv4/igmp.o was needed when IP_MULTICAST=n ;

 * I'm not sure that returning -ENOPROTOOPT for socket operations
   related to multicast management is correct when IP_MULTICAST=n.

For reference, the size savings are as follows, before and after the
patch, for a x86 kernel with IP_MULTICAST=n.

   text	   data	    bss	    dec	    hex	filename
2034992	 157896	 270336	2463224	 2595f8	vmlinux
2024260	 157856	 270336	2452452	 256be4	vmlinux.new
 -10732     -40       0  -10772   -2A14 +/-

Remaining to fix:

 * Virtual server support, using ip_mc_join_group() in
   ipv4/ipvs/ip_vs_sync.c

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 include/linux/igmp.h       |   11 +++++++++
 net/ipv4/Makefile          |    3 +-
 net/ipv4/af_inet.c         |    2 -
 net/ipv4/igmp.c            |   50 +--------------------------------------------
 net/ipv4/ip_sockglue.c     |    4 +++
 net/ipv4/sysctl_net_ipv4.c |    3 --
 6 files changed, 20 insertions(+), 53 deletions(-)

Index: linuxdev/include/linux/igmp.h
===================================================================
--- linuxdev.orig/include/linux/igmp.h
+++ linuxdev/include/linux/igmp.h
@@ -215,6 +215,7 @@
 #define IGMPV3_QQIC(value) IGMPV3_EXP(0x80, 4, 3, value)
 #define IGMPV3_MRC(value) IGMPV3_EXP(0x80, 4, 3, value)
 
+#ifdef CONFIG_IP_MULTICAST
 extern int ip_check_mc(struct in_device *dev, __be32 mc_addr, __be32 src_addr, u16 proto);
 extern int igmp_rcv(struct sk_buff *);
 extern int ip_mc_join_group(struct sock *sk, struct ip_mreqn *imr);
@@ -235,6 +236,16 @@
 extern void ip_mc_dec_group(struct in_device *in_dev, __be32 addr);
 extern void ip_mc_inc_group(struct in_device *in_dev, __be32 addr);
 extern void ip_mc_rejoin_group(struct ip_mc_list *im);
+#else
+#define ip_check_mc(a, b, c, d) ({ 0; })
+#define ip_mc_sf_allow(a, b, c, d) ({ 1; })
+#define ip_mc_init_dev(a) ({ })
+#define ip_mc_up(a) ({ })
+#define ip_mc_down(a) ({ })
+#define ip_mc_destroy_dev(a) ({ })
+#define ip_mc_init_dev(a) ({ })
+#define ip_mc_drop_socket(a) ({ })
+#endif
 
 #endif
 #endif
Index: linuxdev/net/ipv4/Makefile
===================================================================
--- linuxdev.orig/net/ipv4/Makefile
+++ linuxdev/net/ipv4/Makefile
@@ -9,7 +9,7 @@
 	     tcp.o tcp_input.o tcp_output.o tcp_timer.o tcp_ipv4.o \
 	     tcp_minisocks.o tcp_cong.o \
 	     datagram.o raw.o udp.o udplite.o \
-	     arp.o icmp.o devinet.o af_inet.o  igmp.o \
+	     arp.o icmp.o devinet.o af_inet.o \
 	     fib_frontend.o fib_semantics.o \
 	     inet_fragment.o
 
@@ -19,6 +19,7 @@
 obj-$(CONFIG_PROC_FS) += proc.o
 obj-$(CONFIG_IP_MULTIPLE_TABLES) += fib_rules.o
 obj-$(CONFIG_IP_MROUTE) += ipmr.o
+obj-$(CONFIG_IP_MULTICAST) += igmp.o
 obj-$(CONFIG_NET_IPIP) += ipip.o
 obj-$(CONFIG_NET_IPGRE) += ip_gre.o
 obj-$(CONFIG_SYN_COOKIES) += syncookies.o
Index: linuxdev/net/ipv4/af_inet.c
===================================================================
--- linuxdev.orig/net/ipv4/af_inet.c
+++ linuxdev/net/ipv4/af_inet.c
@@ -115,8 +115,6 @@
 #include <linux/mroute.h>
 #endif
 
-extern void ip_mc_drop_socket(struct sock *sk);
-
 /* The inetsw table contains everything that inet_create needs to
  * build a new socket.
  */
Index: linuxdev/net/ipv4/igmp.c
===================================================================
--- linuxdev.orig/net/ipv4/igmp.c
+++ linuxdev/net/ipv4/igmp.c
@@ -108,7 +108,6 @@
 #define IP_MAX_MEMBERSHIPS	20
 #define IP_MAX_MSF		10
 
-#ifdef CONFIG_IP_MULTICAST
 /* Parameter names and values are taken from igmp-v2-06 draft */
 
 #define IGMP_V1_Router_Present_Timeout		(400*HZ)
@@ -143,7 +142,6 @@
 static void igmpv3_clear_delrec(struct in_device *in_dev);
 static int sf_setstate(struct ip_mc_list *pmc);
 static void sf_markstate(struct ip_mc_list *pmc);
-#endif
 static void ip_mc_clear_src(struct ip_mc_list *pmc);
 static int ip_mc_add_src(struct in_device *in_dev, __be32 *pmca, int sfmode,
 			 int sfcount, __be32 *psfsrc, int delta);
@@ -156,8 +154,6 @@
 	}
 }
 
-#ifdef CONFIG_IP_MULTICAST
-
 /*
  *	Timer management
  */
@@ -975,8 +971,6 @@
 	return 0;
 }
 
-#endif
-
 
 /*
  *	Add a filter to a device
@@ -1011,7 +1005,6 @@
 		dev_mc_delete(dev,buf,dev->addr_len,0);
 }
 
-#ifdef CONFIG_IP_MULTICAST
 /*
  * deleted ip_mc_list manipulation
  */
@@ -1112,21 +1105,17 @@
 	}
 	read_unlock(&in_dev->mc_list_lock);
 }
-#endif
 
 static void igmp_group_dropped(struct ip_mc_list *im)
 {
 	struct in_device *in_dev = im->interface;
-#ifdef CONFIG_IP_MULTICAST
 	int reporter;
-#endif
 
 	if (im->loaded) {
 		im->loaded = 0;
 		ip_mc_filter_del(in_dev, im->multiaddr);
 	}
 
-#ifdef CONFIG_IP_MULTICAST
 	if (im->multiaddr == IGMP_ALL_HOSTS)
 		return;
 
@@ -1147,7 +1136,6 @@
 		igmp_ifc_event(in_dev);
 	}
 done:
-#endif
 	ip_mc_clear_src(im);
 }
 
@@ -1160,7 +1148,6 @@
 		ip_mc_filter_add(in_dev, im->multiaddr);
 	}
 
-#ifdef CONFIG_IP_MULTICAST
 	if (im->multiaddr == IGMP_ALL_HOSTS)
 		return;
 
@@ -1177,7 +1164,6 @@
 	im->crcount = in_dev->mr_qrv ? in_dev->mr_qrv :
 		IGMP_Unsolicited_Report_Count;
 	igmp_ifc_event(in_dev);
-#endif
 }
 
 
@@ -1224,21 +1210,17 @@
 	im->crcount = 0;
 	atomic_set(&im->refcnt, 1);
 	spin_lock_init(&im->lock);
-#ifdef CONFIG_IP_MULTICAST
 	im->tm_running=0;
 	setup_timer(&im->timer, &igmp_timer_expire, (unsigned long)im);
 	im->unsolicit_count = IGMP_Unsolicited_Report_Count;
 	im->reporter = 0;
 	im->gsquery = 0;
-#endif
 	im->loaded = 0;
 	write_lock_bh(&in_dev->mc_list_lock);
 	im->next=in_dev->mc_list;
 	in_dev->mc_list=im;
 	write_unlock_bh(&in_dev->mc_list_lock);
-#ifdef CONFIG_IP_MULTICAST
 	igmpv3_del_delrec(in_dev, im->multiaddr);
-#endif
 	igmp_group_added(im);
 	if (!in_dev->dead)
 		ip_rt_multicast_event(in_dev);
@@ -1251,7 +1233,6 @@
  */
 void ip_mc_rejoin_group(struct ip_mc_list *im)
 {
-#ifdef CONFIG_IP_MULTICAST
 	struct in_device *in_dev = im->interface;
 
 	if (im->multiaddr == IGMP_ALL_HOSTS)
@@ -1265,7 +1246,6 @@
 	im->crcount = in_dev->mr_qrv ? in_dev->mr_qrv :
 		IGMP_Unsolicited_Report_Count;
 	igmp_ifc_event(in_dev);
-#endif
 }
 
 /*
@@ -1314,7 +1294,6 @@
 	for (i=in_dev->mc_list; i; i=i->next)
 		igmp_group_dropped(i);
 
-#ifdef CONFIG_IP_MULTICAST
 	in_dev->mr_ifc_count = 0;
 	if (del_timer(&in_dev->mr_ifc_timer))
 		__in_dev_put(in_dev);
@@ -1322,7 +1301,6 @@
 	if (del_timer(&in_dev->mr_gq_timer))
 		__in_dev_put(in_dev);
 	igmpv3_clear_delrec(in_dev);
-#endif
 
 	ip_mc_dec_group(in_dev, IGMP_ALL_HOSTS);
 }
@@ -1335,7 +1313,6 @@
 		return;
 
 	in_dev->mc_tomb = NULL;
-#ifdef CONFIG_IP_MULTICAST
 	in_dev->mr_gq_running = 0;
 	setup_timer(&in_dev->mr_gq_timer, igmp_gq_timer_expire,
 			(unsigned long)in_dev);
@@ -1343,7 +1320,6 @@
 	setup_timer(&in_dev->mr_ifc_timer, igmp_ifc_timer_expire,
 			(unsigned long)in_dev);
 	in_dev->mr_qrv = IGMP_Unsolicited_Report_Count;
-#endif
 
 	rwlock_init(&in_dev->mc_list_lock);
 	spin_lock_init(&in_dev->mc_tomb_lock);
@@ -1455,16 +1431,14 @@
 		ip_rt_multicast_event(pmc->interface);
 	}
 	if (!psf->sf_count[MCAST_INCLUDE] && !psf->sf_count[MCAST_EXCLUDE]) {
-#ifdef CONFIG_IP_MULTICAST
 		struct in_device *in_dev = pmc->interface;
-#endif
 
 		/* no more filters for this source */
 		if (psf_prev)
 			psf_prev->sf_next = psf->sf_next;
 		else
 			pmc->sources = psf->sf_next;
-#ifdef CONFIG_IP_MULTICAST
+
 		if (psf->sf_oldin &&
 		    !IGMP_V1_SEEN(in_dev) && !IGMP_V2_SEEN(in_dev)) {
 			psf->sf_crcount = in_dev->mr_qrv ? in_dev->mr_qrv :
@@ -1473,15 +1447,13 @@
 			pmc->tomb = psf;
 			rv = 1;
 		} else
-#endif
+
 			kfree(psf);
 	}
 	return rv;
 }
 
-#ifndef CONFIG_IP_MULTICAST
 #define igmp_ifc_event(x)	do { } while (0)
-#endif
 
 static int ip_mc_del_src(struct in_device *in_dev, __be32 *pmca, int sfmode,
 			 int sfcount, __be32 *psfsrc, int delta)
@@ -1504,9 +1476,7 @@
 	}
 	spin_lock_bh(&pmc->lock);
 	read_unlock(&in_dev->mc_list_lock);
-#ifdef CONFIG_IP_MULTICAST
 	sf_markstate(pmc);
-#endif
 	if (!delta) {
 		err = -EINVAL;
 		if (!pmc->sfcount[sfmode])
@@ -1524,13 +1494,10 @@
 	if (pmc->sfmode == MCAST_EXCLUDE &&
 	    pmc->sfcount[MCAST_EXCLUDE] == 0 &&
 	    pmc->sfcount[MCAST_INCLUDE]) {
-#ifdef CONFIG_IP_MULTICAST
 		struct ip_sf_list *psf;
-#endif
 
 		/* filter mode change */
 		pmc->sfmode = MCAST_INCLUDE;
-#ifdef CONFIG_IP_MULTICAST
 		pmc->crcount = in_dev->mr_qrv ? in_dev->mr_qrv :
 			IGMP_Unsolicited_Report_Count;
 		in_dev->mr_ifc_count = pmc->crcount;
@@ -1539,7 +1506,6 @@
 		igmp_ifc_event(pmc->interface);
 	} else if (sf_setstate(pmc) || changerec) {
 		igmp_ifc_event(pmc->interface);
-#endif
 	}
 out_unlock:
 	spin_unlock_bh(&pmc->lock);
@@ -1577,7 +1543,6 @@
 	return 0;
 }
 
-#ifdef CONFIG_IP_MULTICAST
 static void sf_markstate(struct ip_mc_list *pmc)
 {
 	struct ip_sf_list *psf;
@@ -1651,7 +1616,6 @@
 	}
 	return rv;
 }
-#endif
 
 /*
  * Add multicast source filter list to the interface list
@@ -1678,9 +1642,7 @@
 	spin_lock_bh(&pmc->lock);
 	read_unlock(&in_dev->mc_list_lock);
 
-#ifdef CONFIG_IP_MULTICAST
 	sf_markstate(pmc);
-#endif
 	isexclude = pmc->sfmode == MCAST_EXCLUDE;
 	if (!delta)
 		pmc->sfcount[sfmode]++;
@@ -1697,17 +1659,14 @@
 		for (j=0; j<i; j++)
 			(void) ip_mc_del1_src(pmc, sfmode, &psfsrc[i]);
 	} else if (isexclude != (pmc->sfcount[MCAST_EXCLUDE] != 0)) {
-#ifdef CONFIG_IP_MULTICAST
 		struct ip_sf_list *psf;
 		in_dev = pmc->interface;
-#endif
 
 		/* filter mode change */
 		if (pmc->sfcount[MCAST_EXCLUDE])
 			pmc->sfmode = MCAST_EXCLUDE;
 		else if (pmc->sfcount[MCAST_INCLUDE])
 			pmc->sfmode = MCAST_INCLUDE;
-#ifdef CONFIG_IP_MULTICAST
 		/* else no filters; keep old mode for reports */
 
 		pmc->crcount = in_dev->mr_qrv ? in_dev->mr_qrv :
@@ -1718,7 +1677,6 @@
 		igmp_ifc_event(in_dev);
 	} else if (sf_setstate(pmc)) {
 		igmp_ifc_event(in_dev);
-#endif
 	}
 	spin_unlock_bh(&pmc->lock);
 	return err;
@@ -2404,13 +2362,9 @@
 		struct ip_mc_list *im = (struct ip_mc_list *)v;
 		struct igmp_mc_iter_state *state = igmp_mc_seq_private(seq);
 		char   *querier;
-#ifdef CONFIG_IP_MULTICAST
 		querier = IGMP_V1_SEEN(state->in_dev) ? "V1" :
 			  IGMP_V2_SEEN(state->in_dev) ? "V2" :
 			  "V3";
-#else
-		querier = "NONE";
-#endif
 
 		if (state->in_dev->mc_list == im) {
 			seq_printf(seq, "%d\t%-10s: %5d %7s\n",
Index: linuxdev/net/ipv4/ip_sockglue.c
===================================================================
--- linuxdev.orig/net/ipv4/ip_sockglue.c
+++ linuxdev/net/ipv4/ip_sockglue.c
@@ -544,6 +544,7 @@
 		if (!val)
 			skb_queue_purge(&sk->sk_error_queue);
 		break;
+#ifdef CONFIG_IP_MULTICAST
 	case IP_MULTICAST_TTL:
 		if (sk->sk_type == SOCK_STREAM)
 			goto e_inval;
@@ -860,6 +861,7 @@
 		kfree(gsf);
 		break;
 	}
+#endif
 	case IP_ROUTER_ALERT:
 		err = ip_ra_control(sk, val ? 1 : 0, NULL);
 		break;
@@ -1044,6 +1046,7 @@
 	case IP_RECVERR:
 		val = inet->recverr;
 		break;
+#ifdef CONFIG_IP_MULTICAST
 	case IP_MULTICAST_TTL:
 		val = inet->mc_ttl;
 		break;
@@ -1099,6 +1102,7 @@
 		release_sock(sk);
 		return err;
 	}
+#endif
 	case IP_PKTOPTIONS:
 	{
 		struct msghdr msg;
Index: linuxdev/net/ipv4/sysctl_net_ipv4.c
===================================================================
--- linuxdev.orig/net/ipv4/sysctl_net_ipv4.c
+++ linuxdev/net/ipv4/sysctl_net_ipv4.c
@@ -411,8 +411,6 @@
 		.mode		= 0644,
 		.proc_handler	= &proc_dointvec
 	},
-
-#endif
 	{
 		.ctl_name	= NET_IPV4_IGMP_MAX_MSF,
 		.procname	= "igmp_max_msf",
@@ -421,6 +419,7 @@
 		.mode		= 0644,
 		.proc_handler	= &proc_dointvec
 	},
+#endif
 	{
 		.ctl_name	= NET_IPV4_INET_PEER_THRESHOLD,
 		.procname	= "inet_peer_threshold",


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
