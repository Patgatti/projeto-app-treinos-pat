# App de treino (protótipo)

Musculação e ballet em um app que roda no navegador e se instala na tela inicial do iPhone e do iPad.

## O que já funciona

- **Hoje:** mostra os treinos marcados para o dia da semana, com a barra de séries feitas.
- **Treino e exercício:** nome, link do vídeo, regulagem do aparelho (texto livre, salva sozinha), séries com carga e repetições, cronômetro de descanso e sugestão de carga.
- **Ballet:** exercícios cadastrados como os da musculação (sem carga) e registro da aula do dia (duração, como foi, anotação).
- **Evolução:** gráfico da carga máxima por dia de treino, por exercício.
- **Treinos:** criar, editar, reordenar e excluir treinos e exercícios.
- **Backup:** exportar e importar um arquivo JSON.
- **Sincronização:** opcional, via Supabase (veja abaixo). Não foi testada contra um projeto Supabase real.

Os treinos que vêm prontos são exemplos: edite ou apague na aba Treinos.

## Regra de sugestão de carga

Na última sessão do exercício, se todas as séries chegaram ao número de repetições definido, o app sugere subir a carga pelo valor "Aumento sugerido de carga" do exercício. Caso contrário, sugere manter a carga.

## 1. Colocar o app no ar (grátis)

O app é uma pasta com arquivos estáticos. Uma opção simples é o GitHub Pages:

1. Crie uma conta no GitHub e um repositório novo (pode ser privado se o seu plano permitir Pages; senão, público).
2. Envie todos os arquivos desta pasta para o repositório (botão "Add file" > "Upload files").
3. Em Settings > Pages, escolha a branch `main` e a pasta `/ (root)`.
4. Depois de alguns minutos o GitHub mostra o endereço do site.

Alternativas: Netlify ou Cloudflare Pages (arraste a pasta e pronto).

## 2. Instalar no iPhone e no iPad

1. Abra o endereço no **Safari**.
2. Toque em Compartilhar > **Adicionar à Tela de Início**.
3. Abra pelo ícone novo. O app abre em tela cheia.

## 3. Sincronizar entre os dois aparelhos (Supabase)

1. Crie uma conta em supabase.com e um projeto novo.
2. Em SQL Editor, cole o conteúdo de `supabase.sql` e clique em Run.
3. Em Authentication > Users, adicione um usuário com o seu e-mail e uma senha (marque "Auto Confirm User").
4. Em Project Settings > API, copie a **Project URL** e a chave **anon public**.
5. No app, abra Ajustes e preencha URL, chave, e-mail e senha. Toque em Entrar. Repita nos dois aparelhos.

Como a sincronização funciona: os registros de séries e aulas dos dois aparelhos são juntados. O cadastro de treinos e exercícios fica com a versão editada mais recentemente. Excluir um registro de série ainda não é possível no app.

## 4. Lembrete ao chegar na academia

No app Atalhos do iPhone: Automação > Nova automação > Chegada > escolha a academia > Mostrar notificação (ou Abrir URL com o endereço do app seguido de `#/hoje`). Desligue "Perguntar antes de executar" para ela disparar sozinha.

## Limites conhecidos

- O iOS pode apagar os dados de sites que ficam muito tempo sem uso. Use o backup ou a sincronização.
- O aviso sonoro do descanso só toca com o app aberto; o iPhone não permite alertas em segundo plano para sites.
- O app Saúde, a balança Xiaomi e o LibreLink entram numa próxima etapa.
