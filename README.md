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

## 設定

1. 在 Supabase 專案的 SQL Editor 執行 `schema.sql`
2. Authentication → Users 新增自己的帳號（Email／密碼）
3. 將 `index.html` 開頭的 `SUPABASE_URL`、`SUPABASE_ANON_KEY` 換成專案值（publishable／anon key，不要用 secret／service_role key）
4. Settings → Pages → Deploy from branch `main` / root

前端放 anon key 是 Supabase 的正常用法，資料以 RLS 限定本人讀寫。
