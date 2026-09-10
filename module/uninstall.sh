#!/system/bin/sh
MODDIR=${0%/*}
. "$MODDIR/utils.sh"

if [ "$(mount_mode)" = nomount ]; then
        nm_uninject
fi

rm -f "$RVPATH"
rmdir "$RV_DIR" 2>/dev/null || :

rm -f "/data/adb/post-fs-data.d/$PKG_NAME-uninstall.sh"