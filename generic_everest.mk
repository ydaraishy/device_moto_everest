# Add CameraBrowser for testing PTP support until Gallery supports it
PRODUCT_PACKAGES := CameraBrowser

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)
$(call inherit-product, device/moto/everest/device.mk)
$(call inherit-product-if-exists, vendor/moto/everest/everest-vendor.mk)

# Overrides
PRODUCT_DEVICE := everest
PRODUCT_LOCALES += en_US
PRODUCT_MODEL := Xoom
PRODUCT_NAME := everest
