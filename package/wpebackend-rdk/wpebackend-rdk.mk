################################################################################
#
# WPEBackend-RDK
#
################################################################################

WPEBACKEND_RDK_VERSION = 1f433a07b784ee85481f52b3b5be1cc62670e7e9
WPEBACKEND_RDK_SITE = $(call github,WebPlatformForEmbedded,WPEBackend-rdk,$(WPEBACKEND_RDK_VERSION))
WPEBACKEND_RDK_INSTALL_STAGING = YES
WPEBACKEND_RDK_DEPENDENCIES = libwpe libglib2

ifeq ($(BR2_PACKAGE_XKEYBOARD_CONFIG),y)
WPEBACKEND_RDK_DEPENDENCIES += xkeyboard-config
endif

# USE_BACKEND_BCM_RPI
ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
WPEBACKEND_RDK_DEPENDENCIES += rpi-userland libegl libinput
WPEBACKEND_RDK_CONF_OPTS += -DUSE_BACKEND_BCM_RPI=ON
endif

$(eval $(cmake-package))
