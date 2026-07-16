# Relatório de Ajustes Efetuados

Este arquivo documenta as alterações realizadas em resposta às solicitações do cliente no dia 01/07/2026.

---

## 📋 Lista de Ajustes (16/07/2026)

### 💻 Layout e Navegação Mobile
1. **Feedback Visual ao Clicar no Menu Mobile**:
   * Os 7 botões do menu exibido quando a página é acessada pelo celular (`Consulte seus débitos`, `Nossa História`, `IPVA`, `Licenciamento`, `Multas`, `Vencimentos` e `Seguros`) foram ajustados para que ao clicar (`onPressed` / touch / hover), o botão adquira uma tonalidade de verde mais escuro (`Color(0xFFA5D6A7)` via `splashColor` e `hoverColor`), mantendo o texto em verde escuro legível (`Color(0xFF1B5E20)`).
   * **Arquivo alterado:**
     * `lib/components/top_bar_widget.dart`

---

## 📋 Lista de Ajustes (Anteriores)

### 💻 Layout e Navegação
1. **Remoção do Menu Hambúrguer no Desktop**:
   * Confirmamos que em resoluções de computador (desktop) o site renderiza as opções de menu na horizontal no cabeçalho. As regras de responsividade no `TopBarWidget` previnem a renderização do layout mobile (com menus verticais empilhados) em telas grandes.
2. **Redirecionamento do Logotipo**:
   * O logotipo da empresa (brasão verde e amarelo) no cabeçalho (desktop/mobile) e no rodapé foi envolto em um widget `InkWell`. O clique agora redireciona os usuários para o site principal: `https://www.caparroz.com.br/`.
   * **Arquivos alterados:**
     * `lib/components/top_bar_widget.dart`
     * `lib/components/rodape_widget.dart`
3. **Reposicionamento do Bloco Verde de WhatsApp (CTA)**:
   * A barra verde que exibe *"Precisa de ajuda? Fale com nosso time agora pelo WhatsApp (11) 4301-9829"* foi movida do rodapé/fim das páginas internas para o topo, posicionada logo abaixo da seção Hero (cabeçalho da página interna) e acima do conteúdo principal.
   * **Arquivo alterado:**
     * `lib/components/page_base_widget.dart`
4. **Alteração de Rota de Nossa História**:
   * A página Nossa História (Home) foi alterada para responder na URL `/nossa_historia` ver de `/home`. O roteamento foi ajustado no GoRouter e na rota de autenticação.
   * **Arquivos alterados:**
     * `lib/pages/home/home_widget.dart`
     * `lib/flutter_flow/nav/nav.dart`
5. **Adição de Texto na Nossa História**:
   * Adicionamos um card informativo com borda e fundo em cinza claro entre as seções "O que podemos fazer por você" (Serviços Rápidos) e "Quem Somos".
   * **Texto adicionado:**
     > O pagamento de débitos, como IPVA, Licenciamento e Multas pode ser feito diretamente pelo site.
     > Para emissão de documentos, seguros e outros serviços, entrar em contato com o Caparroz pelo WhatsApp (11) 4301-9829.
   * **Arquivo alterado:**
     * `lib/pages/home/home_widget.dart`

---

## 📝 Alterações Textuais

### 📄 IPVA
* **Arquivo alterado:** `lib/pages/ipva/ipva_widget.dart`
* **Seção:** *"⚠️ O que acontece se eu não pagar?"*
* **Alterado para:**
  * Você não conseguirá fazer o licenciamento anual
  * Como o débito impede o licenciamento anual, sem o licenciamento em dia, o veículo poderá ser autuado por circulação irregular e removido ao pátio em uma fiscalização.
  * Serão aplicados multa e juros de mora sobre o débito, conforme a legislação estadual.
  * O débito poderá ser inscrito em Dívida Ativa, podendo resultar em protesto e cobrança judicial, nos termos da legislação aplicável.

### 📄 Licenciamento
* **Arquivo alterado:** `lib/pages/licenciamento/licenciamento_widget.dart`
* **Seção:** *"⚠️ O que acontece se eu não pagar?"*
* **Alterado para:**
  * O veículo pode ser removido ao pátio pela fiscalização até a regularização da documentação.

### 📄 Multas
* **Arquivo alterado:** `lib/pages/multas/multas_widget.dart`
* **Seção:** *"⚠️ O que acontece se eu não pagar?"*
* **Alterado para:**
  * Seu veículo não poderá ser licenciado
  * A dívida se acumula com juros e correção monetária
  * A dívida pode ir para protesto ou Divida Ativa
* **Seção:** *"📅 Quando devo pagar?"*
* **Alterado para:**
  * Você deve pagar a multa até a data de vencimento informada na notificação. O pagamento dentro do prazo pode garantir descontos previstos em lei.
* **Seção:** *"⏳ Qual o prazo para pagar?"*
* **Alterado para:**
  * O prazo para pagamento consta na notificação da autuação ou da penalidade e pode variar conforme o órgão

### 💰 Parcelamento no Cartão
* **Status:** Verificamos que todas as referências ativas de parcelamento no código Dart já constam como "21x" (anteriormente "18x").

### 📅 Vencimentos
* **Status:** Verificamos que os calendários de licenciamento para Carro e Moto contidos no arquivo `lib/pages/vencimentos/vencimentos_widget.dart` já constam como ano 2026 (anteriormente 2025).

---

## 🔧 Correções de Dependências e Build Local
Para viabilizar a compilação do projeto web localmente utilizando o Flutter SDK atual (3.44.4) instalado na máquina do desenvolvedor, realizamos as seguintes atualizações no `pubspec.yaml` e no código gerado:
1. **`intl`**: Atualizado para `^0.20.2` para resolver conflitos de versão do SDK.
2. **`font_awesome_flutter`**: Atualizado para `^11.0.0` e substituímos a instanciação de `FaIcon` por `Icon` na linha 214 de `flutter_flow_widgets.dart` para suportar a classe `IconData` marcada como `final` no Flutter.
3. **`google_fonts`**: Atualizado para `^8.0.0` para solucionar erro de compilação constante de FontWeight.
4. **`page_transition`**: Atualizado para `^2.2.0` para resolver a ausência do construtor `CupertinoPageTransitionsBuilder`.
5. **`rodape_widget.dart`**: Atualizado o tipo do parâmetro do método `_socialIcon` para `dynamic` para suportar `FaIconData` do FontAwesome.

---

## 🚀 Alterações Efetuadas (02/07/2026)

### 🆕 Nova Página: Consulte seus débitos
1. **Criação da Página `Consulte seus débitos`**:
   * Foi criada a nova página e rota `/consulte_debitos` (`ConsulteDebitosWidget`).
   * Todo o bloco de consulta e serviços rápidos que estava em "Nossa História" (Hero com o formulário "Consulte seus débitos", cards de "O que podemos fazer por você" e o quadro informativo sobre pagamentos) foi transferido para esta nova página.
   * **Arquivos criados:**
     * `lib/pages/consulte_debitos/consulte_debitos_widget.dart`
     * `lib/pages/consulte_debitos/consulte_debitos_model.dart`
2. **Atualização da Página `Nossa História`**:
   * Removido o conteúdo de regularização e consulta de débitos do arquivo `home_widget.dart`, mantendo a página focada exclusivamente na história e estrutura da empresa ("Quem Somos", "Como atuamos", localização e avaliações).
   * O banner verde de atendimento via WhatsApp (*"Regularize agora mesmo / Fale com nosso time pelo WhatsApp"*) foi movido do final da página para logo abaixo do título principal **"Quem Somos"**.
3. **Menu de Navegação e Rotas**:
   * O menu de navegação (`TopBarWidget`), tanto na versão Desktop quanto Mobile, foi atualizado para exibir o link **"Consulte seus débitos"** antes de **"Nossa História"**.
   * O roteador principal do site (`nav.dart`) foi configurado para que a rota raiz `/` e o fallback apontem diretamente para `ConsulteDebitosWidget`, garantindo que ao acessar o site o cliente veja a tela principal de consulta.

### 🖼️ Como Trocar a Foto da Página IPVA
Para trocar a imagem da tela de IPVA **sem alterar o código**, basta substituir o arquivo físico mantendo exatamente o mesmo nome e formato no diretório do projeto:
* **Caminho da imagem:** `assets/images/front.jpeg`
* **Passo a passo:**
  1. Acesse a pasta `assets/images/` dentro do projeto (`C:\Projetos\DespachanteCaparroz\assets\images\`).
  2. Substitua o arquivo `front.jpeg` por sua nova imagem, renomeando a nova imagem para ter **exatamente o mesmo nome** (`front.jpeg`).

---

## 🚀 Alterações Efetuadas (07/07/2026)

### 📅 Calendário de Vencimentos
1. **Unificação de Automóveis, pick-ups e motos**:
   * O calendário de licenciamento para carros e motos foi unificado na tabela **"🚗 🏍️ Automóveis, pick-ups e motos — Calendário de Licenciamento 2026"**, removendo a tabela separada para motos.
   * Os prazos e finais de placa foram atualizados (Final 1 e 2 em Julho até Final 0 em Dezembro).
2. **Atualização de Caminhões e tratores**:
   * A tabela foi atualizada para **"🚛 Caminhões e tratores — Calendário de Licenciamento 2026"** com os prazos corretos (Final 1 e 2 em Setembro até Final 9 e 0 em Dezembro).
   * **Arquivo alterado:**
     * `lib/pages/vencimentos/vencimentos_widget.dart`

### 🏢 Nossa História
1. **Atualização de Localização e Horário**:
   * O texto de localização e endereço foi ajustado de "Alto da Mooca" para **"Mooca"**.
   * O horário de funcionamento na seção "Onde estamos" foi alterado para **Segunda a Sexta: 8h às 18h**.
   * **Arquivo alterado:**
     * `lib/pages/home/home_widget.dart`

### 🖼️ IPVA
1. **Atualização da Foto da Fachada**:
   * A foto da fachada com texto ("Consulte sua placa e PARCELE...") foi substituída pela foto limpa da fachada (`front.jpeg`).
   * **Arquivo alterado:**
     * `lib/pages/ipva/ipva_widget.dart`

---

## 🚀 Alterações Efetuadas (15/07/2026)

### 📱 Navegação Mobile Multi-linhas (Wrap)
1. **Opções de Navegação Ajustadas para Múltiplas Linhas em Celulares**:
   * Na visualização exclusiva para dispositivos móveis (`responsiveVisibility` para celulares e tablets em modo retrato), as opções de navegação (`Consulte seus débitos`, `Nossa História`, `IPVA`, `Licenciamento`, `Multas`, `Vencimentos` e `Seguros`) foram reestruturadas para um layout inteligente **multi-linhas** (`Wrap`), substituindo a rolagem horizontal em linha única.
   * **Quebra Automática e Espaçamento (`spacing` e `runSpacing`)**: Os botões que não cabem na mesma linha são automaticamente ajustados e distribuídos nas próximas linhas (`WrapAlignment.end`), mantendo um espaçamento uniforme (`6.0px` entre bordas horizontais e verticais) para evitar sobreposição ou colisão visual.
   * **Ajuste Visual dos Botões (`Pílulas Verde Claro`)**: Os botões receberam uma tonalidade de verde bem clarinho (`Color(0xFFE8F5E9)`) no fundo, acompanhada por texto em verde escuro (`Color(0xFF1B5E20)`) e altura otimizada (`height: 26.0`), proporcionando excelente contraste, usabilidade no toque e uma estética moderna.
   * **Arquivo alterado:**
     * `lib/components/top_bar_widget.dart`


