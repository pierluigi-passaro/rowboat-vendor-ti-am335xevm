#
# USB gadget module
#
.PHONY: am335x_kernel_modules
am335x_kernel_modules:
	@echo "Copying USB gadget module"
	@mkdir -p $(ANDROID_INSTALL_DIR)/out/target/product/$(TARGET_PRODUCT)/system/bin/usb/
	@cp -r $(ANDROID_INSTALL_DIR)/kernel/drivers/usb/gadget/g_zero.ko $(ANDROID_INSTALL_DIR)/out/target/product/$(TARGET_PRODUCT)/system/bin/usb/g_zero.ko
	@cp -r $(ANDROID_INSTALL_DIR)/device/ti/am335xevm/rc.usb $(ANDROID_INSTALL_DIR)/out/target/product/$(TARGET_PRODUCT)/system/bin/usb/rc.usb
