#!/system/bin/sh
MODDIR="$(dirname "$(readlink -f "$0")")"
export MODDIR
. "$MODDIR/utils.sh"

echo ""

DFILE="$MODDIR/disabled_by_action"

if is_active; then
        touch "$DFILE"
        disable_rv
        echo "* Disabled successfully"

        ch_desc "⛔ Disabled by action"
else
        rm -f "$DFILE"
        if enable_rv; then
                echo "* Enabled successfully"
        else
                echo "* Failed to enable"
        fi
        echo ""
        show_status
fi