# 活動視覺任務（`web/event-kit/`）

系學會活動要做的圖和要溝通的事，一頁列完。點一項就開那張圖。
還沒設計的用灰色方塊代替；要加名字的由網頁照網格排上去。

```
index.html      清單頁 + 看圖頁（#<id>），不用改
project.json    所有任務：分類、項目、尺寸、文字層
art/<id>.png    Affinity 匯出的圖，檔名 = 項目 id，放進來就自動顯示
names/*.txt     名單，網頁會讀來排版
```

## 常見工作

### 放進設計好的圖

Affinity 匯出 PNG，尺寸照 `project.json` 的 `size`，存成 `art/<id>.png`。不用改任何設定。

### 更新名單

只改對應的 `names/*.txt`：

```
// 這種是註解
# 機械工程系
王小明
陳大文
# 電機工程系
林小華 張志豪、李宜蓁     ← 同一行用空白或頓號分開也可以
```

- 兩個字的名字會自動在中間補一格全形空白，不用自己加。
- 排不下會自動換到下一頁（IG 多圖）。改完開 `index.html#<id>` 逐頁確認沒有超出網格（按「顯示網格」）。

### 調整文字位置（主視覺做好之後）

改 `project.json` 那一項的 `layers`，單位是圖的 px，和 Affinity 裡的座標一樣。

```jsonc
{ "type": "text", "text": "報名成功名單", "x": 128, "y": 250, "size": 64, "weight": 600, "fill": "#333", "spacing": 0.2, "anchor": "start" }

{ "type": "names", "src": "names/signup-ok.txt",
  "area": [128, 330, 824, 880],   // 網格範圍 x, y, 寬, 高
  "columns": 5,                   // 一列幾個名字
  "rowHeight": 56, "groupGap": 28,
  "labelWidth": 0,                // 0 = 科系自己一列；>0 = 科系放左欄，寬度多少 px
  "size": 30, "labelSize": 26, "spacing": 0.15,
  "fill": "#333", "labelFill": "#a33f3c" }

{ "type": "each", "src": "names/badge-staff.txt",   // 一個名字一頁（名牌）
  "name":  { "x": 531, "y": 860,  "size": 150, "anchor": "middle" },
  "label": { "x": 531, "y": 1010, "size": 54,  "anchor": "middle" } }
```

- `y` 是文字基線。`spacing` 是字距，單位 em。
- 字型在 `project.json` 最上面的 `font`，要用電腦裡有裝的字型，匯出才會一致。

### 新增任務

在 `project.json` 對應分類的 `items` 加一筆 `{ "id", "title", "size" }`。
溝通事項用 `{ "id", "title", "kind": "note", "with": "找誰", "todo": [...] }`。
id 定了就不要改（圖檔名和勾選紀錄都跟著它）。

## 匯出

看圖頁右下角：

- **下載這頁 PNG**：圖 + 文字合好，直接發 IG。
- **下載文字層 SVG**：透明底、只有文字，拖進 Affinity 疊在主視覺上還能再調。
