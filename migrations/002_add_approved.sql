-- 新增「已審核」欄位
alter table public.overtime_days add column if not exists approved boolean not null default false;
