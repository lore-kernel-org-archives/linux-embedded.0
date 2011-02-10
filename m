From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PWM v3: 1/3] PWM: Implement a generic PWM framework
Date: Thu, 10 Feb 2011 21:39:37 +0100
Message-ID: <20110210203937.GV9041@pengutronix.de>
References: <1297353231-14475-1-git-send-email-bgat@billgatliff.com>
 <1297353231-14475-2-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1297353231-14475-2-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

Hi Bill,

Thanks for still working on this.


On Thu, Feb 10, 2011 at 09:53:49AM -0600, Bill Gatliff wrote:
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> new file mode 100644
> index 0000000..153d455
> --- /dev/null
> +++ b/drivers/pwm/Kconfig
> @@ -0,0 +1,11 @@
> +#
> +# PWM infrastructure and devices
> +#
> +
> +menuconfig GENERIC_PWM
> +	tristate "PWM Support"
> +	default n

default n is the default and can be removed.

> +	help
> +	  Enables PWM device support implemented via a generic
> +	  framework.  If unsure, say N.
> +
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> new file mode 100644
> index 0000000..7baa201
> --- /dev/null
> +++ b/drivers/pwm/Makefile
> @@ -0,0 +1,4 @@
> +#
> +# Makefile for pwm devices
> +#
> +obj-$(CONFIG_GENERIC_PWM) := pwm.o
> diff --git a/drivers/pwm/pwm.c b/drivers/pwm/pwm.c
> new file mode 100644
> index 0000000..2cad7cd
> --- /dev/null
> +++ b/drivers/pwm/pwm.c
> @@ -0,0 +1,619 @@
> +/*
> + * PWM API implementation
> + *
> + * Copyright (C) 2011 Bill Gatliff <bgat@billgatliff.com>
> + * Copyright (C) 2011 Arun Murthy <arun.murthy@stericsson.com>
> + *
> + * This program is free software; you may redistribute and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> + * USA
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/completion.h>
> +#include <linux/workqueue.h>
> +#include <linux/list.h>
> +#include <linux/sched.h>
> +#include <linux/platform_device.h>

I can't see anything from platform_device.h being used here.

> +#include <linux/pwm/pwm.h>
> +
> +static const char *REQUEST_SYSFS = "sysfs";
> +static LIST_HEAD(pwm_device_list);

This is unused.

> +static DEFINE_MUTEX(device_list_mutex);
> +static struct class pwm_class;
> +static struct workqueue_struct *pwm_handler_workqueue;

This is used but never initialized.

> +
> +static int pwm_match_name(struct device *dev, void *name)
> +{
> +	return !strcmp(name, dev_name(dev));
> +}
> +
> +static struct pwm_device *__pwm_request(struct pwm_device *p, const char *label)
> +{

I think this function should return int.

> +	int ret;
> +
> +	ret = test_and_set_bit(FLAG_REQUESTED, &p->flags);
> +	if (ret) {
> +		p = ERR_PTR(-EBUSY);
> +		goto done;
> +	}
> +
> +	p->label = label;
> +	p->pid = current->pid;
> +
> +	if (p->ops->request) {
> +		ret = p->ops->request(p);
> +		if (ret) {
> +			p = ERR_PTR(ret);
> +			clear_bit(FLAG_REQUESTED, &p->flags);
> +			goto done;
> +		}
> +	}
> +
> +done:
> +	return p;
> +}
> +
> +static struct pwm_device *__pwm_request_byname(const char *name,
> +					       const char *label)
> +{
> +	struct device *d;
> +	struct pwm_device *p;
> +
> +	d = class_find_device(&pwm_class, NULL, (char*)name, pwm_match_name);
> +	if (!d) {
> +		p = ERR_PTR(-EINVAL);
> +		goto done;
> +	}
> +	if (IS_ERR(d)) {
> +		p = (struct pwm_device *)d;
> +		goto done;
> +	}

class_find_device does not return error pointers. Luckily we can get rid
of this horrible cast here.

> +
> +	p = __pwm_request(dev_get_drvdata(d), label);
> +
> +done:
> +	return p;
> +}
> +
> +struct pwm_device *pwm_request_byname(const char *name, const char *label)
> +{
> +	struct pwm_device *p;
> +
> +	mutex_lock(&device_list_mutex);
> +	p = __pwm_request_byname(name, label);
> +	mutex_unlock(&device_list_mutex);
> +	return p;
> +}
> +EXPORT_SYMBOL(pwm_request_byname);
> +
> +struct pwm_device *pwm_request(const char *bus_id, int id, const char *label)
> +{
> +	char name[256];
> +	int ret;
> +
> +	if (id == -1)
> +		ret = scnprintf(name, sizeof name, "%s", bus_id);
> +	else
> +		ret = scnprintf(name, sizeof name, "%s:%d", bus_id, id);
> +	if (ret <= 0 || ret >= sizeof name)
> +		return ERR_PTR(-EINVAL);
> +
> +	return pwm_request_byname(name, label);
> +}
> +EXPORT_SYMBOL(pwm_request);
> +
> +void pwm_release(struct pwm_device *p)
> +{
> +	mutex_lock(&device_list_mutex);
> +
> +	if (!test_and_clear_bit(FLAG_REQUESTED, &p->flags)) {
> +		BUG();
> +		goto done;
> +	}
> +
> +	pwm_stop(p);
> +	pwm_unsynchronize(p, NULL);
> +	pwm_set_handler(p, NULL, NULL);
> +
> +	p->label = NULL;
> +	p->pid = -1;
> +
> +	if (p->ops->release)
> +		p->ops->release(p);
> +done:
> +	mutex_unlock(&device_list_mutex);
> +}
> +EXPORT_SYMBOL(pwm_release);
> +
> +unsigned long pwm_ns_to_ticks(struct pwm_device *p, unsigned long nsecs)
> +{
> +	unsigned long long ticks;
> +
> +	ticks = nsecs;
> +	ticks *= p->tick_hz;
> +	do_div(ticks, 1000000000);
> +	return ticks;
> +}
> +EXPORT_SYMBOL(pwm_ns_to_ticks);
> +
> +unsigned long pwm_ticks_to_ns(struct pwm_device *p, unsigned long ticks)
> +{
> +	unsigned long long ns;
> +
> +	if (!p->tick_hz)
> +		return 0;
> +
> +	ns = ticks;
> +	ns *= 1000000000UL;
> +	do_div(ns, p->tick_hz);
> +	return ns;
> +}
> +EXPORT_SYMBOL(pwm_ticks_to_ns);
> +
> +static void pwm_config_ns_to_ticks(struct pwm_device *p, struct pwm_config *c)
> +{
> +	if (test_bit(PWM_CONFIG_PERIOD_NS, &c->config_mask)) {
> +		c->period_ticks = pwm_ns_to_ticks(p, c->period_ns);
> +		clear_bit(PWM_CONFIG_PERIOD_NS, &c->config_mask);
> +		set_bit(PWM_CONFIG_PERIOD_TICKS, &c->config_mask);
> +	}
> +
> +	if (test_bit(PWM_CONFIG_DUTY_NS, &c->config_mask)) {
> +		c->duty_ticks = pwm_ns_to_ticks(p, c->duty_ns);
> +		clear_bit(PWM_CONFIG_DUTY_NS, &c->config_mask);
> +		set_bit(PWM_CONFIG_DUTY_TICKS, &c->config_mask);
> +	}
> +}
> +
> +static void pwm_config_percent_to_ticks(struct pwm_device *p,
> +					struct pwm_config *c)
> +{
> +	if (test_bit(PWM_CONFIG_DUTY_PERCENT, &c->config_mask)) {
> +		if (test_bit(PWM_CONFIG_PERIOD_TICKS, &c->config_mask))
> +			c->duty_ticks = c->period_ticks;
> +		else
> +			c->duty_ticks = p->period_ticks;
> +
> +		c->duty_ticks *= c->duty_percent;
> +		c->duty_ticks /= 100;
> +		clear_bit(PWM_CONFIG_DUTY_PERCENT, &c->config_mask);
> +		set_bit(PWM_CONFIG_DUTY_TICKS, &c->config_mask);
> +	}
> +}
> +
> +int pwm_config_nosleep(struct pwm_device *p, struct pwm_config *c)
> +{
> +	if (!p->ops->config_nosleep)
> +		return -EINVAL;
> +
> +	pwm_config_ns_to_ticks(p, c);
> +	pwm_config_percent_to_ticks(p, c);
> +
> +	return p->ops->config_nosleep(p, c);
> +}
> +EXPORT_SYMBOL(pwm_config_nosleep);
> +
> +int pwm_config(struct pwm_device *p, struct pwm_config *c)
> +{
> +	int ret = 0;
> +
> +	pwm_config_ns_to_ticks(p, c);
> +	pwm_config_percent_to_ticks(p, c);
> +
> +	switch (c->config_mask & (BIT(PWM_CONFIG_PERIOD_TICKS)
> +				  | BIT(PWM_CONFIG_DUTY_TICKS))) {
> +	case BIT(PWM_CONFIG_PERIOD_TICKS):
> +		if (p->duty_ticks > c->period_ticks) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +		break;
> +	case BIT(PWM_CONFIG_DUTY_TICKS):
> +		if (p->period_ticks < c->duty_ticks) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +		break;
> +	case BIT(PWM_CONFIG_DUTY_TICKS) | BIT(PWM_CONFIG_PERIOD_TICKS):
> +		if (c->duty_ticks > c->period_ticks) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +err:
> +	dev_dbg(p->dev, "%s: config_mask %lu period_ticks %lu duty_ticks %lu"
> +		" polarity %d duty_ns %lu period_ns %lu duty_percent %d\n",
> +		__func__, c->config_mask, c->period_ticks, c->duty_ticks,
> +		c->polarity, c->duty_ns, c->period_ns, c->duty_percent);
> +
> +	if (ret)
> +		return ret;
> +	return p->ops->config(p, c);
> +}
> +EXPORT_SYMBOL(pwm_config);
> +
> +int pwm_set_period_ns(struct pwm_device *p, unsigned long period_ns)
> +{
> +	struct pwm_config c = {
> +		.config_mask = BIT(PWM_CONFIG_PERIOD_TICKS),
> +		.period_ticks = pwm_ns_to_ticks(p, period_ns),
> +	};
> +
> +	return pwm_config(p, &c);
> +}
> +EXPORT_SYMBOL(pwm_set_period_ns);
> +
> +unsigned long pwm_get_period_ns(struct pwm_device *p)
> +{
> +	return pwm_ticks_to_ns(p, p->period_ticks);
> +}
> +EXPORT_SYMBOL(pwm_get_period_ns);
> +
> +int pwm_set_duty_ns(struct pwm_device *p, unsigned long duty_ns)
> +{
> +	struct pwm_config c = {
> +		.config_mask = BIT(PWM_CONFIG_DUTY_TICKS),
> +		.duty_ticks = pwm_ns_to_ticks(p, duty_ns),
> +	};
> +	return pwm_config(p, &c);
> +}
> +EXPORT_SYMBOL(pwm_set_duty_ns);
> +
> +unsigned long pwm_get_duty_ns(struct pwm_device *p)
> +{
> +	return pwm_ticks_to_ns(p, p->duty_ticks);
> +}
> +EXPORT_SYMBOL(pwm_get_duty_ns);
> +
> +int pwm_set_duty_percent(struct pwm_device *p, int percent)
> +{
> +	struct pwm_config c = {
> +		.config_mask = BIT(PWM_CONFIG_DUTY_PERCENT),
> +		.duty_percent = percent,
> +	};
> +	return pwm_config(p, &c);
> +}
> +EXPORT_SYMBOL(pwm_set_duty_percent);
> +
> +int pwm_set_polarity(struct pwm_device *p, int active_high)
> +{
> +	struct pwm_config c = {
> +		.config_mask = BIT(PWM_CONFIG_POLARITY),
> +		.polarity = active_high,
> +	};
> +	return pwm_config(p, &c);
> +}
> +EXPORT_SYMBOL(pwm_set_polarity);
> +
> +int pwm_start(struct pwm_device *p)
> +{
> +	struct pwm_config c = {
> +		.config_mask = BIT(PWM_CONFIG_START),
> +	};
> +	return pwm_config(p, &c);
> +}
> +EXPORT_SYMBOL(pwm_start);
> +
> +int pwm_stop(struct pwm_device *p)
> +{
> +	struct pwm_config c = {
> +		.config_mask = BIT(PWM_CONFIG_STOP),
> +	};
> +	return pwm_config(p, &c);
> +}
> +EXPORT_SYMBOL(pwm_stop);
> +
> +int pwm_synchronize(struct pwm_device *p, struct pwm_device *to_p)
> +{
> +	if (!p->ops->synchronize)
> +		return -EINVAL;
> +
> +	return p->ops->synchronize(p, to_p);
> +}
> +EXPORT_SYMBOL(pwm_synchronize);
> +
> +int pwm_unsynchronize(struct pwm_device *p, struct pwm_device *from_p)
> +{
> +	if (!p->ops->unsynchronize)
> +		return -EINVAL;
> +
> +	return p->ops->unsynchronize(p, from_p);
> +}
> +EXPORT_SYMBOL(pwm_unsynchronize);
> +
> +static void pwm_handler(struct work_struct *w)
> +{
> +	struct pwm_device *p = container_of(w, struct pwm_device,
> +					    handler_work);
> +	if (p->handler && p->handler(p, p->handler_data))
> +		pwm_stop(p);
> +}

A pwm should not stop when the handler returns non null. Instead the
handler should call pwm_stop if it wants to. This is much clearer.

> +
> +static void __pwm_callback(struct pwm_device *p)
> +{
> +	queue_work(pwm_handler_workqueue, &p->handler_work);
> +}
> +
> +int pwm_set_handler(struct pwm_device *p, pwm_handler_t handler, void *data)
> +{
> +	if (p->ops->set_callback) {
> +		p->handler_data = data;
> +		p->handler = handler;
> +		INIT_WORK(&p->handler_work, pwm_handler);
> +		return p->ops->set_callback(p, handler ? __pwm_callback : NULL);

Why must a pwm driver be bothered with the __pwm_callback argument? It
could call a function exported from the pwm API instead.

> +	}
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL(pwm_set_handler);
> +
> +static ssize_t pwm_run_show(struct device *dev,
> +			    struct device_attribute *attr,
> +			    char *buf)
> +{
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +	return sprintf(buf, "%d\n", pwm_is_running(p));
> +}
> +
> +static ssize_t pwm_run_store(struct device *dev,
> +			     struct device_attribute *attr,
> +			     const char *buf, size_t len)
> +{
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +	if (sysfs_streq(buf, "1"))
> +		pwm_start(p);
> +	else if (sysfs_streq(buf, "0"))
> +		pwm_stop(p);
> +	return len;
> +}
> +static DEVICE_ATTR(run, S_IRUGO | S_IWUSR, pwm_run_show, pwm_run_store);
> +
> +static ssize_t pwm_tick_hz_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +	return sprintf(buf, "%lu\n", p->tick_hz);
> +}
> +static DEVICE_ATTR(tick_hz, S_IRUGO, pwm_tick_hz_show, NULL);
> +
> +static ssize_t pwm_duty_ns_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +	return sprintf(buf, "%lu\n", pwm_get_duty_ns(p));
> +}
> +
> +static ssize_t pwm_duty_ns_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t len)
> +{
> +	unsigned long duty_ns;
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +
> +	if (!strict_strtoul(buf, 10, &duty_ns))
> +		pwm_set_duty_ns(p, duty_ns);
> +	return len;
> +}
> +static DEVICE_ATTR(duty_ns, S_IRUGO | S_IWUSR, pwm_duty_ns_show, pwm_duty_ns_store);
> +
> +static ssize_t pwm_period_ns_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +	return sprintf(buf, "%lu\n", pwm_get_period_ns(p));
> +}
> +
> +static ssize_t pwm_period_ns_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t len)
> +{
> +	unsigned long period_ns;
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +
> +	if (!strict_strtoul(buf, 10, &period_ns))
> +		pwm_set_period_ns(p, period_ns);
> +	return len;
> +}
> +static DEVICE_ATTR(period_ns, S_IRUGO | S_IWUSR, pwm_period_ns_show, pwm_period_ns_store);
> +
> +static ssize_t pwm_polarity_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +	return sprintf(buf, "%d\n", p->active_high ? 1 : 0);
> +}
> +
> +static ssize_t pwm_polarity_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t len)
> +{
> +	unsigned long polarity;
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +
> +	if (!strict_strtoul(buf, 10, &polarity))
> +		pwm_set_polarity(p, polarity);
> +	return len;
> +}
> +static DEVICE_ATTR(polarity, S_IRUGO | S_IWUSR, pwm_polarity_show, pwm_polarity_store);
> +
> +static ssize_t pwm_request_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +	struct pwm_device *ret;
> +
> +	mutex_lock(&device_list_mutex);
> +	ret = __pwm_request(p, REQUEST_SYSFS);
> +	mutex_unlock(&device_list_mutex);
> +
> +	if (IS_ERR_OR_NULL(ret))
> +		return sprintf(buf, "fail (owner: %s  pid: %d)\n",
> +			       p->label, p->pid);
> +	else
> +		return sprintf(buf, "%s (pid %d)\n", ret->label, ret->pid);
> +}

I think it has been mentioned in an earlier review that it's not good
to request a pwm by reading a sysfs entry. People are not expecting to
change anything while reading a file.
I think the whole concept of requesting a pwm via sysfs in userspace is
broken as there is no way to free the pwm again when the process which
requested a pwm dies.

> +
> +static ssize_t pwm_request_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t len)
> +{
> +	struct pwm_device *p = dev_get_drvdata(dev);
> +
> +	pwm_release(p);
> +	return len;
> +}
> +static DEVICE_ATTR(request, S_IRUGO | S_IWUSR, pwm_request_show, pwm_request_store);
> +
> +static const struct attribute *pwm_attrs[] =
> +{
> +	&dev_attr_tick_hz.attr,
> +	&dev_attr_run.attr,
> +	&dev_attr_polarity.attr,
> +	&dev_attr_duty_ns.attr,
> +	&dev_attr_period_ns.attr,
> +	&dev_attr_request.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group pwm_device_attr_group = {
> +	.attrs = (struct attribute **) pwm_attrs,
> +};
> +
> +static struct class_attribute pwm_class_attrs[] = {
> +	__ATTR_NULL,
> +};
> +
> +static struct class pwm_class = {
> +	.name = "pwm",
> +	.owner = THIS_MODULE,
> +
> +	.class_attrs = pwm_class_attrs,
> +};
> +
> +int pwm_register_byname(struct pwm_device *p, struct device *parent,
> +			const char *name)
> +{
> +	struct device *d;
> +	int ret;
> +
> +	if (!p->ops || !p->ops->config)
> +		return -EINVAL;
> +
> +	mutex_lock(&device_list_mutex);
> +
> +	d = class_find_device(&pwm_class, NULL, (char*)name, pwm_match_name);
> +	if (d) {
> +		ret = -EEXIST;
> +		goto err_found_device;
> +	}
> +
> +	p->dev = device_create(&pwm_class, parent, MKDEV(0, 0), NULL, name);
> +	if (IS_ERR(p->dev)) {
> +		ret = PTR_ERR(p->dev);
> +		goto err_device_create;
> +	}
> +
> +	ret = sysfs_create_group(&p->dev->kobj, &pwm_device_attr_group);
> +	if (ret)
> +		goto err_create_group;
> +
> +	dev_set_drvdata(p->dev, p);
> +	p->flags = BIT(FLAG_REGISTERED);
> +
> +	goto done;
> +
> +err_create_group:
> +	device_unregister(p->dev);
> +	p->flags = 0;
> +
> +err_device_create:
> +err_found_device:
> +done:
> +	mutex_unlock(&device_list_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(pwm_register_byname);
> +
> +int pwm_register(struct pwm_device *p, struct device *parent, int id)
> +{
> +	int ret;
> +	char name[256];
> +
> +	if (IS_ERR_OR_NULL(parent))
> +		return -EINVAL;
> +
> +	if (id == -1)
> +		ret = scnprintf(name, sizeof name, "%s", dev_name(parent));
> +	else
> +		ret = scnprintf(name, sizeof name, "%s:%d", dev_name(parent), id);
> +	if (ret <= 0 || ret >= sizeof name)
> +		return -EINVAL;
> +
> +	return pwm_register_byname(p, parent, name);
> +}
> +EXPORT_SYMBOL(pwm_register);
> +
> +int pwm_unregister(struct pwm_device *p)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&device_list_mutex);
> +
> +	if (pwm_is_running(p) || pwm_is_requested(p)) {
> +		ret = -EBUSY;
> +		goto done;
> +	}
> +
> +	sysfs_remove_group(&p->dev->kobj, &pwm_device_attr_group);
> +	device_unregister(p->dev);
> +	p->flags = 0;
> +
> +done:
> +	mutex_unlock(&device_list_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(pwm_unregister);
> +
> +static int __init pwm_init(void)
> +{
> +	return class_register(&pwm_class);
> +}
> +
> +static void __exit pwm_exit(void)
> +{
> +	class_unregister(&pwm_class);
> +}
> +
> +#ifdef MODULE
> +module_init(pwm_init);
> +module_exit(pwm_exit);
> +MODULE_LICENSE("GPL");
> +#else
> +postcore_initcall(pwm_init);
> +#endif
> diff --git a/include/linux/pwm/pwm.h b/include/linux/pwm/pwm.h
> new file mode 100644
> index 0000000..871e38c
> --- /dev/null
> +++ b/include/linux/pwm/pwm.h
> @@ -0,0 +1,163 @@
> +/*
> + * Copyright (C) 2011 Bill Gatliff < bgat@billgatliff.com>
> + * Copyright (C) 2011 Arun Murthy <arun.murth@stericsson.com>
> + *
> + * This program is free software; you may redistribute and/or modify
> + * it under the terms of the GNU General Public License version 2, as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> + * USA
> + */
> +#ifndef __LINUX_PWM_H
> +#define __LINUX_PWM_H
> +
> +enum {
> +	FLAG_REGISTERED		= 0,
> +	FLAG_REQUESTED		= 1,
> +	FLAG_STOP		= 2,
> +	FLAG_RUNNING		= 3,
> +};
> +
> +enum {
> +	PWM_CONFIG_DUTY_TICKS	= 0,
> +	PWM_CONFIG_PERIOD_TICKS	= 1,
> +	PWM_CONFIG_POLARITY	= 2,
> +	PWM_CONFIG_START	= 3,
> +	PWM_CONFIG_STOP		= 4,
> +
> +	PWM_CONFIG_HANDLER	= 5,
> +
> +	PWM_CONFIG_DUTY_NS	= 6,
> +	PWM_CONFIG_DUTY_PERCENT	= 7,
> +	PWM_CONFIG_PERIOD_NS	= 8,
> +};

There is no need for introducing ioctl like interfaces in the kernel.
You should create the appropriate callbacks instead which is both easier
to read and easier to implement.

> +
> +struct pwm_config;
> +struct pwm_device;
> +
> +typedef int (*pwm_handler_t)(struct pwm_device *p, void *data);
> +typedef void (*pwm_callback_t)(struct pwm_device *p);
> +
> +struct pwm_device_ops {
> +	int	(*request)		(struct pwm_device *p);
> +	void	(*release)		(struct pwm_device *p);
> +	int	(*config)		(struct pwm_device *p,
> +					 struct pwm_config *c);
> +	int	(*config_nosleep)	(struct pwm_device *p,
> +					 struct pwm_config *c);
> +	int	(*synchronize)		(struct pwm_device *p,
> +					 struct pwm_device *to_p);
> +	int	(*unsynchronize)	(struct pwm_device *p,
> +					 struct pwm_device *from_p);
> +	int	(*set_callback)		(struct pwm_device *p,
> +					 pwm_callback_t callback);
> +};
> +
> +struct pwm_config {
> +	unsigned long config_mask;
> +	unsigned long duty_ticks;
> +	unsigned long period_ticks;
> +	int polarity;
> +
> +	pwm_handler_t handler;
> +
> +	unsigned long duty_ns;
> +	unsigned long period_ns;
> +	int duty_percent;
> +};

This struct shows the major problem with this API. It allows to pass in
inconsistent and contradicting values. We should have a single internal
representation of the pwm values, either in duty_ns/period_ns or
duty_ticks/period_ticks. Everything else should be provided with helper
functions.
This would also make the implementation and sanity checking above much
simpler.

> +
> +struct pwm_device {
> +	struct list_head list;

This is unused.

> +
> +	struct device *dev;
> +	struct pwm_device_ops *ops;
> +
> +	void *data;
> +
> +	const char *label;
> +	pid_t pid;
> +
> +	volatile unsigned long flags;

This should not be volatile.

> +
> +	unsigned long tick_hz;
> +
> +	pwm_callback_t callback;

This field is unused and seems to be a duplicate of handler.

> +
> +	struct work_struct handler_work;
> +	pwm_handler_t handler;
> +	void *handler_data;
> +
> +	int active_high;
> +	unsigned long period_ticks;
> +	unsigned long duty_ticks;
> +};
> +
> +struct pwm_device *pwm_request_byname(const char *name, const char *label);
> +struct pwm_device *pwm_request(const char *bus_id, int id, const char *label);
> +void pwm_release(struct pwm_device *p);
> +
> +static inline int pwm_is_registered(struct pwm_device *p)
> +{
> +	return test_bit(FLAG_REGISTERED, &p->flags);
> +}

I think theres no value in having the FLAG_REGISTERED flag and this
function.

> +
> +static inline int pwm_is_requested(struct pwm_device *p)
> +{
> +	return test_bit(FLAG_REQUESTED, &p->flags);
> +}
> +
> +static inline int pwm_is_running(struct pwm_device *p)
> +{
> +	return test_bit(FLAG_RUNNING, &p->flags);
> +}
> +
> +static inline void pwm_set_drvdata(struct pwm_device *p, void *data)
> +{
> +	p->data = data;
> +}
> +
> +static inline void *pwm_get_drvdata(const struct pwm_device *p)
> +{
> +	return p->data;
> +}
> +
> +unsigned long pwm_ns_to_ticks(struct pwm_device *p, unsigned long nsecs);
> +unsigned long pwm_ticks_to_ns(struct pwm_device *p, unsigned long ticks);
> +
> +int pwm_config_nosleep(struct pwm_device *p, struct pwm_config *c);
> +int pwm_config(struct pwm_device *p, struct pwm_config *c);
> +
> +int pwm_set_period_ns(struct pwm_device *p, unsigned long period_ns);
> +unsigned long pwm_get_period_ns(struct pwm_device *p);
> +int pwm_set_duty_ns(struct pwm_device *p, unsigned long duty_ns);
> +unsigned long pwm_get_duty_ns(struct pwm_device *p);
> +int pwm_set_duty_percent(struct pwm_device *p, int percent);
> +int pwm_set_polarity(struct pwm_device *p, int active_high);
> +
> +int pwm_start(struct pwm_device *p);
> +int pwm_stop(struct pwm_device *p);
> +
> +int pwm_synchronize(struct pwm_device *p, struct pwm_device *to_p);
> +int pwm_unsynchronize(struct pwm_device *p, struct pwm_device *from_p);
> +int pwm_set_handler(struct pwm_device *p, pwm_handler_t handler, void *data);
> +
> +int pwm_register(struct pwm_device *p, struct device *parent, int id);
> +int pwm_register_byname(struct pwm_device *p, struct device *parent,
> +			const char *name);
> +int pwm_unregister(struct pwm_device *p);
> +
> +#ifdef CONFIG_GPIO_PWM
> +struct pwm_device *gpio_pwm_create(int gpio);
> +int gpio_pwm_destroy(struct pwm_device *p);
> +#endif

Function declarations should not be ifdefed.

> +
> +
> +#endif
> -- 
> 1.7.2.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
