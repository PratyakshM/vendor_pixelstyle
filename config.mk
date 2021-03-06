# Copyright (C) 2017 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := vendor/pixelstyle

# Prebuilt Packages
PRODUCT_PACKAGES += \
 NexusLauncherRelease \
    AppLock \
    NexusWallpapersStubPrebuilt2019Static \
    PixelThemesStub2019 \
    SafetyHubPrebuilt \
    OPScreenRecord \
    SettingsIntelligenceGooglePrebuilt \
    GooglePermissionControllerOverlay

ifeq ($(TARGET_GAPPS_ARCH),arm64)
PRODUCT_PACKAGES += \
    MatchmakerPrebuiltPixel4
endif

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# build.prop entrys
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wallpapers_loc_request_suw=true

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "PixelStyle: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "PixelStyle: Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
endif

# Files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/etc,$(TARGET_COPY_OUT_PRODUCT)/etc)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/media,$(TARGET_COPY_OUT_PRODUCT)/media)

# SetupWizard
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.theme=glif_v3_light

# Gestures
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

# Sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=The_big_adventure.ogg \
    ro.config.notification_sound=Popcorn.ogg \
    ro.config.alarm_alert=Bright_morning.ogg

# IME
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.system_lm_dir=/system/product/usr/share/ime/google/d3_lms \
    ro.com.google.ime.theme_id=5


#Fonts
PRODUCT_COPY_FILES += \
    vendor/pixelstyle/cusfonts/gobold/Gobold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Gobold.ttf \
    vendor/pixelstyle/cusfonts/gobold/Gobold-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Gobold-Italic.ttf \
    vendor/pixelstyle/cusfonts/gobold/GoboldBold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoboldBold.ttf \
    vendor/pixelstyle/cusfonts/gobold/GoboldBold-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoboldBold-Italic.ttf \
    vendor/pixelstyle/cusfonts/gobold/GoboldThinLight.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoboldThinLight.ttf \
    vendor/pixelstyle/cusfonts/gobold/GoboldThinLight-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoboldThinLight-Italic.ttf \
    vendor/pixelstyle/cusfonts/roadrage/road_rage.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/RoadRage-Regular.ttf \
    vendor/pixelstyle/cusfonts/neoneon/neoneon.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Neoneon-Regular.ttf \
    vendor/pixelstyle/cusfonts/mexcellent/mexcellent.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Mexcellent-Regular.ttf \
    vendor/pixelstyle/cusfonts/burnstown/burnstown.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Burnstown-Regular.ttf \
    vendor/pixelstyle/cusfonts/dumbledor/dumbledor.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Dumbledor-Regular.ttf \
    vendor/pixelstyle/cusfonts/PhantomBold/PhantomBold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/PhantomBold-Regular.ttf \
    vendor/pixelstyle/cusfonts/snowstorm/snowstorm.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Snowstorm-Regular.ttf \
    vendor/pixelstyle/cusfonts/vcrosd/vcr_osd_mono.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/ThemeableFont-Regular.ttf \
    vendor/pixelstyle/cusfonts/Shamshung/Shamshung.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Shamshung.ttf \
    vendor/pixelstyle/fonts/GoogleSans-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Regular.ttf \
    vendor/pixelstyle/fonts/GoogleSans-Medium.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Medium.ttf \
    vendor/pixelstyle/fonts/GoogleSans-MediumItalic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-MediumItalic.ttf \
    vendor/pixelstyle/fonts/GoogleSans-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Italic.ttf \
    vendor/pixelstyle/fonts/GoogleSans-Bold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Bold.ttf \
    vendor/pixelstyle/fonts/GoogleSans-BoldItalic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-BoldItalic.ttf

# CarrierSettings, replace CarrierConfig
PRODUCT_PACKAGES += \
    CarrierSettings

#
# Carrier configs by Google, parsed by CarrierSettings
#
# Carrier List
PRODUCT_PACKAGES += \
    carrier_list.pb

# Defaults
PRODUCT_PACKAGES += \
    default.pb

# Australia
PRODUCT_PACKAGES += \
    optus_au.pb \
    telstra_au.pb \
    vodafone_au.pb

# Canada
PRODUCT_PACKAGES += \
    bell_ca.pb \
    fido_ca.pb \
    fizz_ca.pb \
    freedommobile_ca.pb \
    koodo_ca.pb \
    luckymobile_ca.pb \
    pcmobilebell_ca.pb \
    rogers_ca.pb \
    solomobile_ca.pb \
    telus_ca.pb \
    videotron_ca.pb \
    virgin_ca.pb

# France
PRODUCT_PACKAGES += \
    bouygues_fr.pb \
    orange_fr.pb \
    sfr_fr.pb

# Germany
PRODUCT_PACKAGES += \
    o2_de.pb \
    telekom_de.pb \
    vodafone_de.pb

# India
PRODUCT_PACKAGES += \
    airtel_in.pb \
    idea_in.pb \
    rjio_in.pb \
    vodafone_in.pb

# Italy
PRODUCT_PACKAGES += \
    vodafone_it.pb

# Japan
PRODUCT_PACKAGES += \
    docomo_jp.pb \
    kddi_jp.pb \
    rakuten_jp.pb \
    softbank_jp.pb

# Netherlands
PRODUCT_PACKAGES += \
    vodafone_nl.pb

# Singapore
PRODUCT_PACKAGES += \
    singtel_sg.pb \
    starhub_sg.pb

# Spain
PRODUCT_PACKAGES += \
    orange_es.pb \
    vodafone_es.pb

# Taiwan
PRODUCT_PACKAGES += \
    cht_tw.pb \
    fet_tw.pb \
    twm_tw.pb

# United Kingdom
PRODUCT_PACKAGES += \
    ee_gb.pb \
    h3_gb.pb \
    idmobile_gb.pb \
    o2postpaid_gb.pb \
    o2prepaid_gb.pb \
    vodafone_gb.pb

# United States
PRODUCT_PACKAGES += \
    att5g_us.pb \
    att_us.pb \
    cellcom_us.pb \
    cricket5g_us.pb \
    cricket_us.pb \
    cspire_us.pb \
    firstnetpacific_us.pb \
    firstnet_us.pb \
    fi_us.pb \
    sprint_us.pb \
    sprintwholesale_us.pb \
    tmobile_us.pb \
    uscc_us.pb \
    verizon_us.pb \
    visible_us.pb \
    xfinity_us.pb

# Other countries
PRODUCT_PACKAGES += \
    others.pb

#Fonts
PRODUCT_COPY_FILES += \
    vendor/pixelstyle/fonts/Aclonica.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Aclonica.ttf \
    vendor/pixelstyle/fonts/Amarante.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Amarante.ttf \
    vendor/pixelstyle/fonts/Bariol-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Bariol-Regular.ttf \
    vendor/pixelstyle/fonts/Cagliostro-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Cagliostro-Regular.ttf \
    vendor/pixelstyle/fonts/Coolstory-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Coolstory-Regular.ttf \
    vendor/pixelstyle/fonts/LGSmartGothic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/LGSmartGothic.ttf \
    vendor/pixelstyle/fonts/Comic_Sans.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Comic_Sans.ttf \
    vendor/pixelstyle/fonts/Rosemary-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Rosemary-Regular.ttf \
    vendor/pixelstyle/fonts/SonySketch.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SonySketch.ttf \
    vendor/pixelstyle/fonts/Surfer.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Surfer.ttf 

# Include package overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay/common/
