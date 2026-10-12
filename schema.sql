-- 加班紀錄：每天一筆（免登入版本，以 anon key 讀寫）
create table if not exists public.overtime_days (
  work_date  date primary key,
  planned    numeric(4,1) check (planned between 0 and 12),   -- 預計加班時數
  actual     numeric(4,1) check (actual  between 0 and 12),   -- 實際加班時數
  note       text,
  updated_at timestamptz not null default now()
);

alter table public.overtime_days enable row level security;

-- 開放 anon 讀寫此表（僅此表，不影響同專案其他資料表）
create policy "public access" on public.overtime_days
  for all to anon
  using (true)
  with check (true);
