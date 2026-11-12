#!/bin/sh
# 把 drafts/index.html 的草稿算成 ../art/<id>.png。用法：sh render.sh [id ...]（不給 id 就全部）
cd "$(dirname "$0")" || exit 1
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
ALL="success:1080x1350 form-header:1600x400 badge-staff:1063x1535 badge-guest:1063x1535 backdrop:3000x2000"
for item in $ALL; do
  id=${item%%:*}; size=${item##*:}
  if [ $# -gt 0 ]; then case " $* " in *" $id "*) ;; *) continue ;; esac; fi
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
    --window-size="${size%x*},${size#*x}" --screenshot="../art/$id.png" \
    "file://$PWD/index.html?d=$id" >/dev/null 2>&1
  echo "$id $(sips -g pixelWidth -g pixelHeight "../art/$id.png" | awk '/pixel/{printf "%s ", $2}')"
done
