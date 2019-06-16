#環境設定
##名前
NAME = rusboot

##ターゲット
TARGET_ARCH = $(2)
ifeq ($(strip $(TARGET_ARCH)),)
    TARGET_ARCH = x86_64
endif

TARGET_MODE = $(3)
ifeq ($(strip $(TARGET_MODE)),)
    TARGET_MODE = debug
endif

RUST_TARGET = $(TARGET_ARCH)-unknown-uefi

#各コマンド
MKDIR = mkdir -p
CP = cp -rf
RM = rm -rf
XARGO = xargo
QEMU = qemu-system-$(TARGET_ARCH)
QEMU_FLAGS = -drive if=pflash,format=raw,readonly,file=bin/$(TARGET_ARCH)/OVMF/OVMF_CODE.fd -drive if=pflash,format=raw,file=tmp/$(TARGET_ARCH)/OVMF/OVMF_VARS.fd

##デフォルト動作
default:
	$(MAKE) bootloader

clean:
	$(XARGO) clean
	$(RM) tmp

run:
	$(MAKE) bootloader
	-$(MKDIR) target/$(RUST_TARGET)/$(TARGET_MODE)/EFI/BOOT
	$(CP) target/$(RUST_TARGET)/$(TARGET_MODE)/$(NAME).efi target/$(RUST_TARGET)/$(TARGET_MODE)/EFI/BOOT/bootx64.efi
	-$(MKDIR) tmp/$(TARGET_ARCH)/OVMF/
	-$(CP) bin/$(TARGET_ARCH)/OVMF/OVMF_VARS.fd tmp/$(TARGET_ARCH)/OVMF/OVMF_VARS.fd
	$(QEMU) $(QEMU_FLAGS) -drive format=raw,file=fat:rw:target/$(RUST_TARGET)/$(TARGET_MODE)/

bootloader:
	$(MAKE) $(NAME).efi


# ファイル生成規則
$(NAME).efi : Cargo.toml
ifeq ($(TARGET_MODE),release)
		$(XARGO) build --target $(RUST_TARGET) --$(TARGET_MODE)
else
		$(XARGO) build --target $(RUST_TARGET)
endif
