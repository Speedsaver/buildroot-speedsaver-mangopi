################################################################################
#
# ArduiPi_OLED
#
################################################################################

ARDUIPI_OLED_VERSION = 37230d87c3b855d54df302498eed96c16134cc47
ARDUIPI_OLED_SITE = $(call github,speedsaver,ArduiPi_OLED,$(ARDUIPI_OLED_VERSION))
ARDUIPI_OLED_DEPENDENCIES = i2c-tools
ARDUIPI_OLED_INSTALL_STAGING = YES

define ARDUIPI_OLED_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/examples
endef

define ARDUIPI_OLED_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) install PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D)/examples
	$(TARGET_MAKE_ENV) $(MAKE) install PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D)
	rm -r $(TARGET_DIR)/usr/include
endef

define ARDUIPI_OLED_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) install PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D)
endef

$(eval $(generic-package))
