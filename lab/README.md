# lab：首頁陳列方式的原型

11/12 在本機做的原型，當時沒提交；11/19 從對話紀錄還原回來。

| 檔案 | 是什麼 | 狀態 |
|---|---|---|
| `map.html` | **色體圖**：中心一條線，每個領域一個方向，每個專案一條橫線，線越長完成度越高。右下角列出所有領域 | 首頁設定裡的「色體圖」就是嵌入這一頁 |
| `projects.json` | 色體圖的資料：專案、所屬領域、狀態、包含哪些作品 | 新作品要自己加進來 |
| `map-v1.html` | 色立體：角度＝領域、內外圈＝給自己看／給別人看、上下＝理解／做出 | 舊版，留著參考 |
| `space.html`、`space-v1.html` | 時間線：有空間感，往前滾動穿過去 | 舊版，留著參考 |

## projects.json

- `dom`：領域，決定在哪個方向。
- `state`：`seed` 未開始、`doing` 進行中、`done` 完成、`live` 持續更新。
- `progress`：0–10，決定線的長度；沒填就照 `state` 推估。
- `items`：填 `decks.json`／`sites.json` 的 `id`。
- `tray`：頂端「手邊」要放哪幾個專案。
- `who`、`kind` 只有 `map-v1.html` 用到。

本機預覽：在 repo 根目錄跑 `python3 -m http.server 8766`，打開 http://localhost:8766/lab/map.html 。
