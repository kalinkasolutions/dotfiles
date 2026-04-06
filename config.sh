DEST="./config-files"
FILES=(
    "$HOME/.zshrc"
    "$HOME/.zprofile"
    "$HOME/.gitconfig"
    "$HOME/.gitconfig-kalinkasolution"
    "$HOME/.gitconfig-work"
    "$HOME/.config/rofi"
    "$HOME/.ssh/configs/"
    "$HOME/.ssh/config"
)
ETC_FILES=(
    "/etc/keyd/default.conf"
    "/etc/ssh/sshd_config"
)

backup() {
    echo "==> Backing up home files..."
    for src in "${FILES[@]}"; do
        rel="${src#$HOME/}"
        dest="$DEST/$rel"
        mkdir -p "$(dirname "$dest")"
        [[ -d "$src" ]] && src="${src%/}/"
        rsync -av --ignore-missing-args "$src" "$dest"
    done
    echo "==> Backing up etc files..."
    for src in "${ETC_FILES[@]}"; do
        dest="$DEST/etc/${src#/etc/}"
        mkdir -p "$(dirname "$dest")"
        [[ -d "$src" ]] && src="${src%/}/"
        sudo rsync -av --chown=kalinka:kalinka "$src" "$dest"
    done
    echo "==> Done."
}

restore() {
    echo "==> Restoring home files..."
    for src in "${FILES[@]}"; do
        rel="${src#$HOME/}"
        backed_up="$DEST/$rel"
        mkdir -p "$(dirname "$src")"
        if [[ -d "$backed_up" ]]; then
            rsync -av --delete "${backed_up%/}/" "${src%/}/"
        else
            rsync -av --ignore-missing-args "$backed_up" "$src"
        fi
    done
    echo "==> Restoring etc files..."
    for src in "${ETC_FILES[@]}"; do
        backed_up="$DEST/etc/${src#/etc/}"
        sudo mkdir -p "$(dirname "$src")"
        if [[ -d "$backed_up" ]]; then
            sudo rsync -av --delete "${backed_up%/}/" "${src%/}/"
        else
            sudo rsync -av "$backed_up" "$src"
        fi
    done
    echo "==> Done."
}
case "$1" in
    backup)  backup ;;
    restore) restore ;;
    *) echo "Usage: $0 {backup|restore}" ;;
esac
