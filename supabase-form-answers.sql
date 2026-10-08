-- Jalankan sekali di Supabase SQL Editor sebelum menerima jawaban dari form versi baru.
alter table public.survey_bangkom_2026
    add column if not exists jawaban_tambahan jsonb not null default '{}'::jsonb;
