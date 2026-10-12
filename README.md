# 加班時數追蹤 overtime-tracker

個人加班時數追蹤：以 21 日為週期起點，對照每月 54 小時與近三期 138 小時上限，後端使用 Supabase。

## 規則

- 週期：每月 21 日至次月 20 日
- 每期上限：54 小時
- 近三期（本期＋前兩期）上限：138 小時
- 本期還可加班 = min(54 − 本期實際, 138 − 近三期實際)
- 預估：已填實際用實際，未填用預計
- 週一至週六顯示；週日預設隱藏，可切換「顯示週日」（有資料的週日一律顯示）
- 平日實際加班超過 4 小時以紅字提示（單日工時上限 12 小時）

## 使用

- 免登入，打開即為唯讀
- Ctrl+Shift 點標題切換編輯模式（記在此瀏覽器）
- 實際時數與審核只能填今天（含）以前；勾選「審核」的日子會在該週收合成一列加總，點擊可展開

## 設定

1. 在 Supabase 專案的 SQL Editor 執行 `schema.sql`（已建過登入版者，依序執行 `migrations/` 內的檔案）
2. 將 `index.html` 開頭的 `SUPABASE_URL`、`SUPABASE_ANON_KEY` 換成專案值（publishable／anon key，不要用 secret／service_role key）
3. Settings → Pages → Deploy from branch `main` / root

注意：此表開放 anon 讀寫，編輯模式只是前端開關，知道網址與 key 的人技術上仍可修改資料。
