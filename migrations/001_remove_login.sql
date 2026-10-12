-- 由登入版改為免登入版（資料表目前為空，可直接執行）
drop policy if exists "own rows" on public.overtime_days;
alter table public.overtime_days drop constraint if exists overtime_days_pkey;
alter table public.overtime_days drop column if exists user_id;
alter table public.overtime_days add primary key (work_date);

create policy "public access" on public.overtime_days
  for all to anon
  using (true)
  with check (true);
