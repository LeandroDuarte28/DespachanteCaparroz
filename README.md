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
- **Redirecionamento do Logotipo**: O logotipo no cabeçalho e rodapé agora direciona para `https://www.caparroz.com.br/`.
- **Barra de WhatsApp**: A barra verde (CTA) foi movida para o topo das páginas internas, logo abaixo do título.
- **Nossa História**: Adição de um card informativo sobre pagamentos de débitos e WhatsApp na página inicial, e alteração da rota da página para `/nossa_historia`.
- **Textos de IPVA, Licenciamento e Multas**: Ajustes textuais nos termos legais e informativos sobre multas, prazos, descontos e remoção de veículos em blitz/fiscalizações.
- **Vencimentos e Parcelamentos**: Garantido o uso do ano 2026 para licenciamentos e de parcelamento em até 21x nas páginas correspondentes.
- **Nossa História (Anterior)**: O formulário verde de "Consulta de Débitos" foi removido da seção. O texto da apresentação do despachante foi centralizado em largura máxima e justificado.
- **Páginas de Licenciamento & Vencimentos (Anterior)**: Correção no carregamento local de fotos (`pessoa.jpeg` e `pessoa2.jpeg`) limpando caches.
- **IPVA (Anterior)**: Ajustada a ordem do painel direito, posicionando a tabela de vencimentos do IPVA 2026 de forma centralizada entre as duas fotos da seção.
