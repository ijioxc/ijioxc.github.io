# 資料庫（ijioxc.github.io，原 ppt）

- 網址：https://ijioxc.github.io/ ，由 `main` 部署。
- 改動從 `origin/main` 開分支再發 PR。本機 `main` 可能落後，也可能有未提交的改動，不要動那些改動。

## 刷題本（已拆出）

刷題本搬到獨立 repo `ijioxc/quiz`，網址 https://ijioxc.github.io/quiz/ 。新增科目、改刷題本都到那個 repo 做，規則看它的 CLAUDE.md。
這裡的 `web/quiz/index.html`、`play.html` 只是轉址頁，讓舊連結跳到新網址，不要刪。

## 活動視覺任務（`web/event-kit/`）

網址：https://ijioxc.github.io/web/event-kit/

系學會活動的任務清單，點項目開圖；名單由網頁照網格排版。

- 做法都在 `web/event-kit/README.md`，只讀這份就夠。
- 更新名單只改 `names/*.txt`；放圖只把 PNG 存成 `art/<id>.png`；調位置只改 `project.json`。
- 不要改 `index.html`，除非要加新功能。
