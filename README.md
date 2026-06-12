# Despachante Caparroz

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
- **Nossa História**: O formulário verde de "Consulta de Débitos" foi removido da seção. O texto da apresentação do despachante foi centralizado em largura máxima e justificado.
- **Páginas de Licenciamento & Vencimentos**: Correção no carregamento local de fotos (`pessoa.jpeg` e `pessoa2.jpeg`) limpando caches.
- **IPVA**: Ajustada a ordem do painel direito, posicionando a tabela de vencimentos do IPVA 2025 de forma centralizada entre as duas fotos da seção.
