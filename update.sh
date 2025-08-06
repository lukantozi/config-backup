#!/usr/bin/env bash
set -euo pipefail
B="$HOME/.config-backup"

syncdir() {
  src="$1"; dest="$2"
  mkdir -p "$B/$dest"
  rsync -a --delete --exclude '.git' --exclude '.git/' "$src/" "$B/$dest/"
}

# configs
[ -d "$HOME/.config/hypr" ]     && syncdir "$HOME/.config/hypr"     hypr
[ -d "$HOME/.config/waybar" ]   && syncdir "$HOME/.config/waybar"   waybar
[ -d "$HOME/.config/rofi" ]     && syncdir "$HOME/.config/rofi"     rofi
[ -d "$HOME/.config/kitty" ]    && syncdir "$HOME/.config/kitty"    kitty
[ -d "$HOME/.config/nvim" ]     && syncdir "$HOME/.config/nvim"     nvim
[ -d "$HOME/.config/gtk-3.0" ]  && syncdir "$HOME/.config/gtk-3.0"  gtk-3.0
[ -d "$HOME/.config/gtk-4.0" ]  && syncdir "$HOME/.config/gtk-4.0"  gtk-4.0
[ -d "$HOME/.config/mako" ]     && syncdir "$HOME/.config/mako"     mako

# SDDM (just small refs, not the whole theme dir)
mkdir -p "$B/sddm/etc" "$B/sddm/astronaut"
sudo cp -f /etc/sddm.conf "$B/sddm/etc/" 2>/dev/null || true
sudo cp -f /etc/sddm.conf.d/*.conf "$B/sddm/etc/" 2>/dev/null || true
sudo cp -f /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop "$B/sddm/astronaut/" 2>/dev/null || true
sudo cp -f /usr/share/sddm/themes/sddm-astronaut-theme/Themes/purple_leaves.conf "$B/sddm/astronaut/" 2>/dev/null || true

# Firefox (only if files exist)
FF="$HOME/.mozilla/firefox/wrlzhw2q.default"
DEST="$B/firefox"
mkdir -p "$DEST"
[ -d "$FF/chrome" ]          && rsync -a "$FF/chrome/" "$DEST/chrome/"
[ -f "$FF/user.js" ]         && cp -f "$FF/user.js" "$DEST/"
[ -f "$FF/prefs.js" ]        && cp -f "$FF/prefs.js" "$DEST/prefs.js"
[ -f "$FF/extensions.json" ] && jq -r '.addons[] | select(.type=="extension") | "\(.defaultLocale.name)  (\(.id))"' "$FF/extensions.json" > "$DEST/extensions_list.txt"

cd "$B"
git add -A
git commit -m "update: refresh configs $(date -Iseconds)" || true
