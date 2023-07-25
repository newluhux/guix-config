################################################################################
#
# ek
#
################################################################################

EK_VERSION = 18
EK_SITE = https://www.kermitproject.org/ftp/kermit/archives
EK_SOURCE = ek$(EK_VERSION).tar
EK_LICENSE = BSD-3
EK_LICENSE_FILES = COPYING

define EK_EXTRACT_CMDS
	mkdir -p $(BUILD_DIR)/ek-18/
	$(TAR) xf $(EK_DL_DIR)/$(EK_SOURCE) -C $(BUILD_DIR)/ek-18/
endef

define EK_BUILD_CMDS
	$(MAKE) ek -C $(@D) $(TARGET_CONFIGURE_OPTS)
endef

define EK_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/ek $(TARGET_DIR)/usr/bin/ek
endef

$(eval $(generic-package))
