# 無人帆船專題工作站（`web/sailboat/`）

網址：https://ijioxc.github.io/web/sailboat/

公開、唯讀。資料全部在 `data.json`，由 Claude 更新；Mr.張和隊友只看網頁。

```
index.html   頁面（HOME 色體圖＋本週／TASKS 甘特圖／PARTS 零件預算／DATA 實驗成果），不用改
data.json    全部資料，只改這份
```

## data.json 欄位

| 區塊 | 欄位 |
|---|---|
| `project` | `start`（W1 的星期一）、`weeks`、`budget`、`members`（me／mate／claude 的顯示名）、`phases`（n、name、start、end 週） |
| `tasks` | `id`、`title`、`owners`（me／mate／claude，可多人）、`phase`、`start`／`end`（週）、`status`（todo／doing／done）、`progress`（0–100）、`imp`／`urg`（1–3）、`note` |
| `parts` | `id`、`name`、`owner`、`priceLo`／`priceHi`、`qty`、`status`（plan／ordered／arrived）、`paid`（實付，0 表示照 `priceHi` 算）、`link`、`note`、`order` |
| `log` | `id`、`date`（YYYY-MM-DD）、`who`、`text`、`ts`（越大越新）。陣列新的在前 |
| `results` | `id`、`kind`、`date`、`phase`（掛在哪一站）、`title`、`summary`、`headers`、`rows`（`**x**` 會標成重點色）、`file`、`order` |

## 每次做完專題工作

1. 任務做完：`status` 改 `done`、`progress` 改 100
2. 在 `log` 最前面加一筆：日期、誰、做了什麼（一句話）
3. 有實驗結果：在 `results` 加一筆，`phase` 填所屬階段
4. 從 `origin/main` 開分支，只提交 `web/sailboat/data.json`，發 PR

## 頁面怎麼算

- 本週＝今天落在第幾週（從 `start` 起算，每 7 天一週）。網址加 `?w=5` 可以預覽第 5 週的樣子
- 色體圖：中間直軸＝整體完成度；每個階段一條分支，由下（第 1 階段）往上，左右交錯；分支長度＝該階段完成度，一格 10%，顏色依負責人拆開。全部完成的階段收成一顆小標籤
- 「現在」＝已開始、還有未完成任務的第一個階段
- 延遲＝`end` 週已過、還沒 `done`
- 四象限：重要＝`imp` 3；緊急＝`urg` 3，或這週／下週到期，或已延遲
- 資料庫首頁的卡片圖：headless Chrome 1280×800 截首頁，縮成 900 寬存到 `sites/sailboat.jpg`
