# Caparroz Despachantes

Este é o repositório oficial do portal **Caparroz Despachantes**, construído em Flutter (Dart) com suporte total à Web e hospedado na Vercel.

---

## 🛠️ Instruções para Execução Local

### Pré-requisitos
Certifique-se de possuir o **Flutter SDK** instalado em sua máquina e adicionado às variáveis de ambiente do sistema.

### Passo a Passo para Rodar o Projeto

1. **Limpeza do Cache de Assets**:
   Sempre limpe os caches de builds e manifesto de assets anteriores se adicionar novas imagens à pasta `assets/images/`:
   ```bash
   flutter clean
   ```

2. **Obtenção de Dependências**:
   Instale os pacotes definidos no `pubspec.yaml`:
   ```bash
   flutter pub get
   ```

3. **Iniciando o Servidor de Desenvolvimento**:
   Para rodar no navegador localmente (porta 8080):
   ```bash
   flutter run -d web-server --web-port 8080 --web-hostname localhost
   ```
   Acesse a URL `http://localhost:8080` no seu navegador de preferência.

---

## 🚀 Processo de Deploy na Vercel

O deploy do site de produção é servido a partir da pasta de saída `build/web` (conforme as configurações contidas em `vercel.json`).

Para publicar as alterações em produção:

1. **Gere o Build de Produção para Web**:
   ```bash
   flutter build web --release
   ```

2. **Suba para a Vercel**:
   Com o Vercel CLI instalado na máquina, execute o comando a partir do diretório raiz:
   ```bash
   vercel --prod --yes
   ```
   O projeto será compilado e hospedado no link de produção oficial do projeto.

---

## 📝 Resumo de Ajustes Recentes
- **Navegação Mobile Multi-linhas (15/07/2026)**: Em telas de celulares (`TopBarWidget`), a navegação foi ajustada com `Wrap` multi-linhas automático. Os botões que não cabem na linha são distribuídos nas próximas linhas com espaçamento uniforme (`6.0px`), estilizados com uma tonalidade de verde bem clarinho (`Color(0xFFE8F5E9)`) e texto verde escuro (`Color(0xFF1B5E20)`).
- **Página "Consulte seus débitos" (02/07/2026)**: Criação de nova página raiz (`/consulte_debitos`) contendo o formulário de consulta, serviços rápidos ("O que podemos fazer por você") e quadro informativo, que foram migrados da página "Nossa História". O menu principal e a rota inicial foram atualizados para dar prioridade a esta tela.
- **Calendário de Vencimentos 2026 (07/07/2026)**: Unificação das tabelas de licenciamento de Automóveis, pick-ups e motos em uma única tabela (2026), além da atualização dos prazos da tabela de Caminhões e tratores (2026).
- **Nossa História e Contato (07/07/2026)**: Atualização do endereço para "Mooca" e ajuste do horário de atendimento para Segunda a Sexta das 8h às 18h.
- **Foto da Fachada IPVA (07/07/2026)**: Substituição da imagem com texto da fachada em `IPVA` pela imagem limpa (`front.jpeg`).
- **Redirecionamento do Logotipo**: O logotipo no cabeçalho e rodapé agora direciona para `https://www.caparroz.com.br/`.
- **Barra de WhatsApp**: A barra verde (CTA) foi movida para o topo das páginas internas, logo abaixo do título.
- **Textos de IPVA, Licenciamento e Multas**: Ajustes textuais nos termos legais e informativos sobre multas, prazos, descontos e remoção de veículos em blitz/fiscalizações.
- **Vencimentos e Parcelamentos**: Garantido o uso do ano 2026 para licenciamentos e de parcelamento em até 21x nas páginas correspondentes.
