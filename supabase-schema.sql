-- Run this once in your Supabase project's SQL Editor
-- (Dashboard -> SQL Editor -> New query -> paste -> Run)

create extension if not exists pgcrypto;

create table if not exists subscribers (
  id uuid primary key default gen_random_uuid(),
  email text not null unique check (email ~* '^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  subscribed_at timestamptz not null default now(),
  active boolean not null default true,
  source text not null default 'website'
);

-- Lock the table down, then open only the two doors we actually need
alter table subscribers enable row level security;

-- Anyone (the public subscribe form) can INSERT a new row...
create policy "public can subscribe"
  on subscribers for insert
  to anon
  with check (true);

-- ...but only a logged-in admin (via Supabase Auth) can READ the list
create policy "only authenticated can read"
  on subscribers for select
  to authenticated
  using (true);

-- No public update/delete policies exist, so those stay blocked entirely.
