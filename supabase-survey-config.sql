-- Jalankan sekali di Supabase SQL Editor.
create table if not exists public.survey_admins (user_id uuid primary key references auth.users(id) on delete cascade);
create table if not exists public.survey_config (id text primary key check (id = 'active'), config jsonb not null, updated_at timestamptz not null default now());
alter table public.survey_admins enable row level security;
alter table public.survey_config enable row level security;
revoke all on public.survey_admins from anon, authenticated;
grant select on public.survey_config to anon, authenticated;
grant insert, update on public.survey_config to authenticated;
-- Create the admin user in Supabase Authentication first, then add its auth.users id:
-- insert into public.survey_admins (user_id) values ('PASTE-ADMIN-USER-UUID-HERE');
create or replace function public.is_survey_admin() returns boolean language sql stable security definer set search_path = '' as $$ select exists (select 1 from public.survey_admins where user_id = (select auth.uid())); $$;
revoke all on function public.is_survey_admin() from public;
grant execute on function public.is_survey_admin() to authenticated;
drop policy if exists "Anyone can read active survey config" on public.survey_config;
create policy "Anyone can read active survey config" on public.survey_config for select to anon, authenticated using (id = 'active');
drop policy if exists "Admins can insert survey config" on public.survey_config;
create policy "Admins can insert survey config" on public.survey_config for insert to authenticated with check (id = 'active' and public.is_survey_admin());
drop policy if exists "Admins can update survey config" on public.survey_config;
create policy "Admins can update survey config" on public.survey_config for update to authenticated using (public.is_survey_admin()) with check (id = 'active' and public.is_survey_admin());
