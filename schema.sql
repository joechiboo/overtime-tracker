-- 加班紀錄：每人每天一筆
create table if not exists public.overtime_days (
  user_id    uuid not null default auth.uid() references auth.users on delete cascade,
  work_date  date not null,
  planned    numeric(4,1) check (planned between 0 and 12),   -- 預計加班時數
  actual     numeric(4,1) check (actual  between 0 and 12),   -- 實際加班時數
  note       text,
  updated_at timestamptz not null default now(),
  primary key (user_id, work_date)
);

alter table public.overtime_days enable row level security;

-- 只能讀寫自己的資料
create policy "own rows" on public.overtime_days
  for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
