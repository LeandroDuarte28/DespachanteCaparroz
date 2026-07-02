# Product Requirements Document (PRD) — Plataforma Despachante Caparroz

**Documento:** Requisitos do Produto e Relatório Consolidado de Funcionalidades  
**Produto:** Plataforma Web & Mobile – Despachante Caparroz  
**Data:** 02 de Julho de 2026  
**Versão:** 1.0.0  

---

## 1. Visão Geral do Produto

O **Despachante Caparroz Web/App** é uma plataforma digital focada em simplificar a regularização documental veicular, consulta e pagamento de débitos (IPVA, Licenciamento, Multas) e contratação de seguros veiculares no Estado de São Paulo.

Com mais de 70 anos de tradição no setor (desde 1951 em São Paulo e 1945 em Penápolis), o sistema combina credibilidade institucional com um fluxo digital ágil, permitindo ao cidadão ou empresa consultar débitos sem burocracia, parcelar encargos no cartão de crédito em até 21x e obter atendimento humanizado via WhatsApp diretamente com especialistas.

---

## 2. Objetivos do Produto

1. **Desburocratização:** Disponibilizar uma interface simples e intuitiva para consulta gratuita de débitos veiculares a partir de dados básicos do veículo.
2. **Conversão Rápida:** Posicionar estrategicamente chamadas para ação (CTAs) para o WhatsApp em pontos de alta visibilidade (abaixo dos títulos principais e no topo das páginas de serviços).
3. **Facilidade de Pagamento:** Integrar opções financeiras flexíveis (plataforma PinPag com parcelamento em até 21x no cartão de crédito).
4. **Autoridade Institucional:** Destacar a infraestrutura física de mais de 200m² no Alto da Mooca, o histórico familiar e o atendimento especializado a frotas e taxistas.

---

## 3. Arquitetura de Navegação e Páginas

A plataforma está estruturada em um modelo de aplicação web de página única (SPA) responsiva desenvolvida em **Flutter Web**, dividida nos seguintes módulos principais:

### 3.1. Página Principal / Consulta de Débitos (`/` ou `/consulte_debitos`)
* **Objetivo:** Ponto de entrada prioritário da plataforma, focado na conversão imediata e consulta de situação veicular.
* **Funcionalidades:**
  * **Hero Consulta:** Formulário simplificado de consulta sem necessidade de login prévio (`ConsultaDebitosSemLoginWidget`).
  * **Serviços Rápidos:** Grid interativo destacando os pilares de atuação ("O que podemos fazer por você": IPVA, Licenciamento, Multas e Transferência).
  * **Quadro Informativo de Pagamentos:** Card destacado informando que IPVA, Licenciamento e Multas podem ser pagos no site, direcionando para o WhatsApp `(11) 4301-9829` em casos de emissão de novos documentos e seguros.

### 3.2. Página Institucional — Nossa História (`/nossa_historia`)
* **Objetivo:** Reforçar a confiança, tradição e solidez da Caparroz Despachantes.
* **Funcionalidades:**
  * **Seção Quem Somos:** Apresentação institucional com o **Banner CTA Verde do WhatsApp** reposicionado estrategicamente logo abaixo do título principal para capturar conversões institucionais imediatas.
  * **Linha do Tempo Histórica:** Marco temporal iterativo (1945 - Início em Penápolis; 1953 - Escritório no Carmo; 1963 - Abertura na Mooca; Atualidade - Gestão por David Caparroz).
  * **Como Atuamos (Estrutura):** Detalhamento da sede própria no Alto da Mooca (>200m²) e especialização em taxistas/frotas.
  * **Onde Estamos & Avaliações:** Mapa de localização, endereço físico e prova social (depoimentos de clientes).

### 3.3. Páginas Específicas de Serviços
Todas as páginas internas utilizam o template padronizado `PageBaseWidget`, contendo barra de ajuda rápida no cabeçalho e estrutura otimizada:
* **IPVA (`/ipva`):** Informações sobre datas, cálculo, vantagens do pagamento online em até 21x e esclarecimentos sobre consequências do inadimplemento (bloqueio de licenciamento, remoção ao pátio e Dívida Ativa).
* **Licenciamento (`/licenciamento`):** Explicação sobre o CRLV-e digital, atualização no sistema do Detran e riscos de circulação irregular.
* **Multas (`/multas`):** Orientações sobre notificações de autuação e penalidade, cumprimento de prazos para descontos legais e parcelamento.
* **Seguro Veicular (`/seguro`):** Integração de corretora com despachante, agilidade no suporte a sinistros, perda total e transferência indenizatória.
* **Vencimentos (`/vencimentos`):** Tabelas e calendários de vencimentos oficiais atualizados para o ano vigente (**2026**) separados por tipo de veículo (Automóveis e Motocicletas).

---

## 4. Design System & Componentes Compartilhados

* **TopBarWidget:** Cabeçalho responsivo com menu em linha no Desktop e adaptação mobile fluida. O logotipo da empresa possui evento interativo (`InkWell`) que redireciona para o domínio principal (`https://www.caparroz.com.br/`).
* **PageBaseWidget:** Estrutura base de layouts internos que injeta automaticamente um banner verde de WhatsApp logo abaixo do título Hero da página, maximizando a visibilidade de suporte no topo da tela.
* **RodapeWidget:** Rodapé informacional completo, com links institucionais, redes sociais e logotipo com redirecionamento à página raiz.

---

## 5. Requisitos Não Funcionais & Stack Tecnológica

1. **Framework e Linguagem:** Flutter SDK `3.44.4` (Dart `3.x`), utilizando componentes otimizados para compilação Web (`flutter build web --release`).
2. **Responsividade:** Layout 100% adaptável para telas Desktop, Tablet e Mobile através do uso de `LayoutBuilder` e regras de media queries dinâmicas.
3. **Estilização:** Tipografia moderna via Google Fonts (`Mukta` para títulos de impacto e `Roboto` para legibilidade de texto corrido) e paleta institucional verde escuro/verde esmeralda.
4. **CI/CD e Deploy Automático:** Integração contínua configurada através de GitHub Actions (`.github/workflows/deploy.yml`) conectada à infraestrutura da **Vercel** (`vercel.json`), garantindo deploy em produção automatizado a cada merge/push na branch `main`.

---

## 6. Resumo das Últimas Entregas e Validações

* [x] Validação e aprovação em análise estática do compilador Dart/Flutter (`flutter analyze`).
* [x] Reposicionamento do Banner de Contato via WhatsApp para o topo da página **Nossa História** (abaixo do título principal *Quem Somos*).
* [x] Redirecionamento unificado dos logotipos (cabeçalho e rodapé) para o domínio oficial.
* [x] Atualização de calendários e regras para o ano de 2026 e parcelamentos fixados em até 21x.
* [x] Deploy contínuo disparado e validado via pipeline na branch `main`.
