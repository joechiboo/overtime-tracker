-- 新增「已填加班單」欄位
alter table public.overtime_days add column if not exists filed boolean not null default false;
