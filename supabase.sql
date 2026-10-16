-- Rode este arquivo uma vez no Supabase: SQL Editor > New query > colar > Run.
-- Cria uma tabela com o estado do app de cada usuário e libera cada pessoa
-- para ler e gravar somente a própria linha.

create table if not exists public.app_state (
  user_id    uuid primary key default auth.uid() references auth.users (id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.app_state enable row level security;

create policy "dono le" on public.app_state
  for select using (auth.uid() = user_id);

create policy "dono insere" on public.app_state
  for insert with check (auth.uid() = user_id);

create policy "dono atualiza" on public.app_state
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
