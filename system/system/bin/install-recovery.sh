#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:4c8cd69f1c12b35247125dd5a6e3c6c06e54ea05; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:134217728:8c46df99bdccf1e5190602c24296ca7aa24dce2e \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:4c8cd69f1c12b35247125dd5a6e3c6c06e54ea05 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
