pgrep swaybg >/dev/null || swaybg -i ~/Pictures/Wallpapers/virshem_germaniia_zamok_119771_1920x1200.jpg -m fill &
pgrep pipewire >/dev/null && pkill pipewire
pipewire &

gtklock &

waybar &
