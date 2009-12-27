From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: [ANNOUNCE] barebox-2009.12.0 has been released
Date: Sun, 27 Dec 2009 18:10:36 +0100
Message-ID: <20091227171036.GW22533@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org

Revision 2009.12.0 of the barebox bootloader (formerly known as
u-boot-v2) has been released on http://www.barebox.org

This is the initial release since it has been renamed to barebox.

Here are some of the feature highlights:

* POSIX based file API
* Shell commands like ls/cd/mkdir/echo/cat,...
* The environment is not a variable store any more, but a file store.
  You can use it for proper shell scripting now.
* Real filesystem support: mounts ramdisk on /, devfs on /dev, plus
  cramfs support (more to come)
* device/driver model
* clocksource support
* Kconfig and Kernel build system
* Simulation target
* device parameter support
* initcalls
* getopt
* editor

More can be found in the online documentation at
http://www.barebox.org/documentation/barebox-2009.12.0/

Shortlog since u-boot-v2.0.0-rc10 follows below.

Anand Gadiyar (1):
      OMAP3430-SDP: Compile fixes

Eric Benard (12):
      CPUIMX27 : update dram declaration
      imx-nand : remove wrong part of commit ca326e88827e08e723046a21b1=
8e74d41d15ace7
      Eukrea CPUIMX27 : add SDRAM size choice
      Eukrea CPUIMX27 : add NOR flash size configuration
      Eukrea CPUIMX27 : add console on Quad UART support
      Eukrea CPUIMX27 : Add MMU support
      Eukrea CPUIMX27 : update documentation
      Eukrea CPUIMX27 : update defconfig
      Fix imx_nand_set_layout for i.MX27
      nand_imx.c : add reset command
      nand_imx.c : remove unused code
      cpuimx27 : use flash bbt

Jean-Christophe PLAGNIOL-VILLARD (39):
      uboot_default_env: fix out of tree build
      cfi new: fix new disabling buffer support
      xyzModem: fix digit init in xyzModem_stream_open
      at91sam9: move to at91
      at91: add cpu devices common api
      at91sam9: switch to the same api as the kernel
      kbuild: support arch/$ARCH/include for tags, cscope
      kbuild: asm symlink support for arch/$ARCH/include
      kbuild: add arch/$ARCH/include to search path
      [ARM] move include/asm-arm to arch/arm/include/asm
      arm: merge proc-armv/ptrace.h and ptrace.h in one file
      [ARM] Move include/asm-arm/arch-* to arch/arm/*/include/mach
      [BLACKFIN] move include/asm-blackfin to arch/blackfin/include/asm
      [SANDBOX] move include/asm-sandbox to arch/arm/include/sandbox
      [SANDBOX] Move include/asm-sandbox/arch-* to arch/sandbox/*/inclu=
de/mach
      [PPC] move include/asm-ppc to arch/ppc/include/asm
      [PPC] Move include/asm-ppc/arch-* to arch/ppc/*/include/mach
      [M68K] move include/asm-m68k to arch/m68k/include/asm
      [M68K] Move include/asm-m68k/{arch,proc}-* to arch/m68k/*/include=
/{mach,proc}
      pm9263: add nand support
      add bool types support
      driver: add dev_name inline
      at91: add support for the at91sam9263ek board of Atmel
      arm/kconfig: inverse the board selection
      at91/kconfig: use similar kconfig presentation
      imx/kconfig: inverse the board selection
      s3c/kconfig: inverse the board selection
      netx/kconfig: inverse the board selection
      arm: move config ARCH_TEXT_BASE and BOARDINFO to mach Kconfig
      at91: Atmel Ref board fix config MACH to match with mach-types
      arm: introduce CPU CONFIG from linux
      arch/arm/Makefile: cleanup
      arm: remove non used cpu-y
      arm: use -marm as default when it's possible
      arm: add endian config support
      arm: update cpu tunning
      arm: add Debug Communications Channel serial driver support
      arm: add configurable AEABI support
      arm: generate mach-types.h instead of static version

Juergen Beisert (31):
      Adapt pcm043 platform to boot from NAND
      A9M2440: Just clean up
      S3C24xx: Provide a generic way to detect memory size
      A9M2440: Fix documentation
      A9M2440: Generic code should support generic hardware
      A9M2440: Use external GPIO settings to setup the SDRAM
      A9M2440: Be able to configure things baseboard dependent
      A9M2440: Addapting the default environment
      ENV_HANDLING requires CRC32
      Remove deadlock message
      Enable 'saveenv' for non eraseable media
      Adding some documentation
      Adding IPU clock query functions for i.MX31 and i.MX35
      Unify driver's menu also for video
      let linker create a link map
      Move variables to bss
      Include the 'size_t' declaration
      Remove unused code
      Move private settings and configuration into the C source
      Use the native 'void' instead of 'Void_t'
      Remove confusing macros that hide the real functions names
      After moving all declarations to the C source, do the same with t=
he doc
      Use nowadays function prototypes
      Remove debug code
      Remove win32 support
      Use the global string functions
      Combine memory initialization with the main memory functions.
      Re-format the file
      Fix some exported names
      Some doxygen related fixes
      documentation updates

Juergen nogit Beisert (2):
      fb: Add a i.MX IPU framebuffer driver
      mx35 3stack display support

Luca Ceresoli (1):
      Turn on CONFIG_CMD_MEMORY in Beagle Board defconfig.

Marc Kleine-Budde (26):
      fec_imx: remove trailing whitespace
      clock.h: uses uint?_t types, so include types.h
      nand: print size parameter as unsinged not as signed
      nand: ground dev_add_bb_dev if nand is disabled
      spi: dev->id is an int, not a string, fix debug output
      speed-imx35: the gptclk is connected to the ipgclk
      speed-imx35: add function imx_get_i2cclk
      imx-regs: define IMX_FEC_BASE
      mx25-3stack, pcm043: use IMX_FEC_BASE define
      imx35-regs: add base address for I2C1
      imx35-regs: add CGR1 helper values
      i2c: new framework
      i2c-imx: ported to u-boot-v2
      mc13892: driver added
      mc9sdz60: driver added
      clock.h: use types.h not linux/types.h
      clock.c: use USECOND and MSECOND
      i.MX35 3stack: several enhancements
      i2c-imx: print errors with dev_err
      i2c-imx: fix clear IFF race condition
      i2c-imx: fix low bitrate problem
      i2c-imx: i2c_imx_xfer return with err if sub-transfer isn't succe=
ssfull
      arm/Makefile: don't set ABI unconditionally to "apcs-gnu"
      Cleanup some more collateral damage from renaming
      arm/lib: add eabi names of helper functions
      arm/lib: add missing abi helper functions __aeabi_idivmod, __aeab=
i_uidivmod

Peter Korsgaard (4):
      image.h: amd64 support
      sandbox: common: fix device names for environment files (-e)
      cramfs: probe(): fix cdev lookup
      Documentation: update reference to sandbox environment

Robert P. J. Day (9):
      ARM: Correct Kconfig typo, "optimzed" -> "optimized".
      NAND: Free asprintf()-allocated space upon mtd device deletion.
      commands: correct "CONFIG_SIMPLE_PARSER" to "CONFIG_SHELL_SIMPLE"=
=2E
      scripts: Delete non-barebox content from scripts/.
      commands: Remove reference to non-existent CONFIG_CMD_I2C.
      Remove/adjust erroneous references to CONFIG_MODULE.
      MTD: Correct typo in preprocessor directive.
      Remove obsolete comment referring to CFG_CMD_JFFS2.
      Remove PPC support for IDE.

Robert Schwebel (2):
      README: rewrite some u-boot leftovers
      README: add release rules

Sanjeev Premi (2):
      omap3evm: Add basic support for the board
      omap3evm: Minimal default configuration

Sascha Hauer (225):
      return is not a function
      arm: implement optimized string functions
      imx_nand: Skip bbt scan during initialization
      armlinux: remove unused atags
      armlinux.c: refactor
      arm: make 'bootz' configurable
      arm: Add bootu command
      Add MMU support
      fec imx27: Add MMU support
      pcm038: Add MMU support
      i.MX: Do not dump clocks on startup.
      imx nand: Make use of optimized string functions
      ehci: Restore state after td timeout
      i.MX: Use more accurate decode pll function from kernel
      usb: when unregistering usb devices, remove them from device list
      use _stext instead of TEXT_BASE
      imx serial: add mx25 support
      add iomux definitions for mx25
      Add MX25 support
      nand_base: We have to ignore the -EUCLEAN error
      add Freescale MX25 3stack board support
      add mx25 3ds defconfig
      MX25/MX35 Nand support
      imx27: Add usb defines
      pca100: Add MMU support
      pca100: Add USB host support
      usb ehci driver: Get rid of echi_alloc/free
      usb ehci driver: Add MMU support
      usb: remove unnecessary code
      usb: remove unused fields from struct usb_device
      pcm038: Add USB support
      ethact command: If called without arguments print current eth dev=
ice
      nand bb: fix check when erasing a bb device
      nand bb: fix removal of bb devices
      devfs: add open counter
      ls: beautify output
      make copy_file() globally available
      add xstrdup function
      devfs: fix return value for lseek in partitions
      mx25: implement clko command
      mx25: remove duplicate function, fix perclk values
      console: make locally used function static
      hush: Only run list if it's not empty
      hush: pass return code from exit command
      rename dma macros
      console: partly revert 84688dfdb4aecc8296b4fef9bc657335d7b9ade5
      Add USB device support
      register env as env0 and not as env
      readline: Allow only ascii and printable characters
      fs: replace broken dev_protect with protect_file function
      boards: use recently introduced protect_file function
      imx: replace imx specific gpio functions with generic ones
      imx spi: Use gpio as chip selects
      mc13783: fix spi mode, remove now unneeded double read
      nand_imx_v2: use xzalloc for data buffers
      nand_imx_v2: make nand_boot_test command more flexible
      i.MX introduce cpu_is_*() macros
      nand_imx_v2: abstract i.MX25 specific stuff properly
      nand_imx_v2: Use a two staged scan process
      nand_imx_v2: Use generic bbt scan function
      pca100: remove imx_ prefix from gpio access functions
      pca100: add missing USB bits
      fec_imx: initialize buffers on open time
      add USB otg pin definitions
      protect command: ignore -ENOSYS
      sandbox: use libc ioctl for os part
      sandbox tap driver: initialize device name
      sandbox: add a default environment
      sandbox: update defconfig
      usb ehci: Fix braindamaged pointer-deref-cast-magic
      pcm038 defconfig update
      nand bb: fix handling of two subsequent bad blocks
      ls: fix stat failure, print error
      fec_imx: do not typedef struct
      tftp: do not call NetStartAgain()
      net: remove NetStartAgain()
      net: remove unused state NETLOOP_RESTART
      net: split NetLoop in NetLoop and NetLoopInit
      return is not a function
      net: check prerequisites in NetLoopIinit()
      bootp: remove unnecessary counter
      net: remove switch/case in NetLoop()
      ping.c: refactor
      net: do not use netboot_common for rarp
      make netboot_common a global function
      net: refactor dhcp support
      rename bootp.c to dhcp.c
      net: cleanup header file
      net: remove dead code
      only the ping code is interested in the ping ip
      net: remove unnecessary if
      do not abuse the received packet to send back another packet
      imxfb: make framebuffer base address configurable
      remove sntp support. Has been broken for long enough
      stringlist: Fix printing on smaller consoles
      make locally used funtion static
      tftp: remove default filename. We always have a filename given
      remove unused variable NetBootFileSize
      tftp: remove unnecessary gateway information
      tftp: consolidate different puts to printf
      remove unused code
      tftp: remove volatile from variables
      tftp: remove never reached state STATE_TOO_LARGE
      tftp: remove never reached state STATE_BAD_MAGIC
      tftp: reorder to get rid of static function declarations
      tftp: coding style
      tftp: use debug macro
      ping: do not return -1 in command
      ping: shorten usage info
      nfs: no default filename, we always have a filename
      pass filename to nfs and tftp start functions
      nfs: allow only serverip
      remove global variable BootFile
      consolidate command calling in execute_command
      remove unused typedef
      commands: add defines for command errors/success
      commands: return COMMAND_ERROR_USAGE
      call getopt_reset only once
      cat: return error if file is not readable
      remove obsolete and broken command 'splash'
      remove unused header file
      remove unused directory tools
      miiphy: Add missing lseek function
      printenv: do not return negative values in a command
      commands: remove maxargs
      hush: remove include/hush.h
      nand_imx: fix largepage layout
      nand_imx: merge send_read_page and send_prog_page
      mxc_nand: introduce mxc_do_addr_cycle
      mxc_nand: use buffers
      mxc_nand: remove debug param
      mxc_nand: simplify command processing
      mxc nand: modify send_page to send all pages, not only one
      mxc_nand: remove unused defines
      mxc_nand: determine page and block size depending on NFMS bit
      imx_nand: add booting from 2k NAND support
      imx_nand: make oob read work on 512b page nands
      mxc_nand: Make main/spare areas runtime configurable
      mxc_nand: Add NFC V2 support
      imx_nand: allow flash based bbt
      IMX_NAND_BASE -> IMX_NFC_BASE
      mxc_nand: set proper spas / ecc size
      mxc_nand: add nand boot support for i.MX35
      imx_nand: add i.MX25/i.MX35 to Kconfig
      Merge branch 'for-sascha' of git://uboot.jcrosoft.org/u-boot-v2 i=
nto from-jean
      a9m2410dev: compile fixes
      i.MX21: fix compiler warning
      i.MX1: do not try to print non existent reg CID
      list: remove duplicated list.h
      at91sam9260ek: Reset ethernet phy during init
      i.MX Nand: Set correct datawidth/pagesize in CCM module
      i.MX: remove obsolete V2 Nand driver
      NAND: Allow to read oob data
      i.MX flash header: make it work on i.MX35
      nand: refuse to write data if not beginning on a page boundary
      nand: do not write empty pages. Needed for writing UBI images
      PCA100: initialize pll in assembler code
      imxfb: show only for relevant i.MXs
      fb: Add FB_SYNC_ defines from kernel
      i.MX: split out iomux-v1 support
      complete i.MX GPIO support
      introduce GENERIC_GPIO label
      command line gpio support
      pcm043: add display support
      pcm043: Add MMU support
      omap: Add missing include
      beagle board: Compile fixes
      omap: Use correct label in arch/arm/Makefile
      i.MX31: Fix CCM_UPCTL register offset
      remove unused include files
      pcm038: Use a flash based bbt
      crc: Do not lseek if not necessary (bb devs do not allow lseek)
      nand bb: Be sure that fd is at the beginning when erasing
      i.MX Nand: fix bit clearing
      pcm038: update defconfig
      Merge branch 'for-sha-i2c-imx' of git://git.pengutronix.de/git/mk=
l/u-boot-v2
      rename U-Boot-v2 project to barebox
      Cleanup colleteral damage from renaming
      Merge branch 'for-sha-collateral' of git://git.pengutronix.de/git=
/mkl/barebox
      Merge branch 'for-sha-eabi-fixes' of git://git.pengutronix.de/git=
/mkl/barebox
      ppc bitops: Fix compiler warning
      i.MX35 3stack: select I2C drivers
      fix arch_execute prototype
      i.MX25 3stack: fixup flash header to new names/layout
      ipe337: add missing include
      scb9328: setup chipselect the correct way
      read_key: Use ARRAY_SIZE instead of hardcoded value
      Remove unnecessary casts in key defines
      replace // style comments
      netx: enable second ethernet device
      pcm037: Add missing include
      imx ipu fb: Make fb_videomode const
      i.MX nand: mx21 has a v1 type controller
      vsprintf: Only define PAGE_SIZE if not already defined
      i2c: Add a no-op i2c_register_board_info if i2c is disabled
      sandbox: update defconfig
      pcm030: Update defconfig
      mx21ads: update defconfig
      pcm037: update defconfig
      pca100: update defconfig
      mx27ads: update defconfig
      ipe337: update defconfig
      scb9328: update defconfig
      pcm043: update defconfig
      pm9263: update defconfig
      netx: update defconfig
      mmccpu: update defconfig
      eukrea cpuimx27: update defconfig
      at91sam9260ek: update defconfig
      at91sam9263ek: update defconfig
      Digi a9m2410: update defconfig
      Digi a9m2440: update defconfig
      i.MX25 3stack: update defconfig
      i.MX35 3stack: update defconfig
      sdp3430: update defconfig
      beagle board: update defconfig
      omap3_evm: update defconfig
      Makefile: clean barebox.ldr
      Fix barebox Version number
      commands/nand.c: Fix memory hole
      pcm030: remove dead code
      commands/nand.c: Fix memory hole
      Merge branch 'pu'
      barebox-2009.12.01
      barebox-2009.12.0

Uwe Kleine-K=C3=B6nig (1):
      Documentation/porting.txt: fix some spelling mistakes ...

rsc
--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
