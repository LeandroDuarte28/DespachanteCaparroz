import '/components/consulta_debitos_sem_login_widget.dart';
import '/components/rodape_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});
  static String routeName = 'Home';
  static String routePath = '/nossa_historia';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  static const _green = Color(0xFF008844);
  static const _darkGreen = Color(0xFF005C2E);
  static const _textDark = Color(0xFF1A1A1A);
  static const _textMed = Color(0xFF444444);
  static const _textLight = Color(0xFF777777);
  static const _bg = Color(0xFFF7F8FA);

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().textoHomeCaracterEspecial = '1ª via e 2ª via de documentos –';
      safeSetState(() {});
    });
    animationsMap['fadeIn'] = AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effectsBuilder: () => [
        FadeEffect(curve: Curves.easeOut, delay: 0.ms, duration: 600.ms, begin: 0, end: 1),
        MoveEffect(curve: Curves.easeOut, delay: 0.ms, duration: 600.ms, begin: const Offset(0, 20), end: Offset.zero),
      ],
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() { _model.dispose(); super.dispose(); }

  // ─── Helpers ──────────────────────────────────────────────────────────
  TextStyle _t(double size, FontWeight w, Color c, {double h = 1.5}) =>
      GoogleFonts.roboto(fontSize: size, fontWeight: w, color: c, height: h);

  Widget _divider() => const Padding(
    padding: EdgeInsets.symmetric(vertical: 32),
    child: Divider(height: 1, thickness: 1, color: Color(0xFFEAEAEA)),
  );

  Widget _sectionBadge(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: _green.withOpacity(0.08),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: _green.withOpacity(0.3)),
    ),
    child: Text(text,
        style: GoogleFonts.roboto(
            fontSize: 12, fontWeight: FontWeight.w600, color: _green)),
  );

  Widget _sectionTitle(String text) => Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 16),
    child: Text(text,
        style: GoogleFonts.mukta(
            fontSize: 28, fontWeight: FontWeight.bold, color: _textDark)),
  );

  // ─── Quem Somos ───────────────────────────────────────────────────────
  Widget _buildQuemSomos(BuildContext context) {
    final texto = _buildQuemSomosTexto();
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionBadge('Nossa História'),
            _sectionTitle('Quem Somos'),
            _buildCTA(context),
            const SizedBox(height: 24),
            texto,
          ],
        ),
      ),
    );
  }

  Widget _buildQuemSomosTexto() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.justify,
          textScaler: MediaQuery.of(context).textScaler,
          text: TextSpan(children: [
            TextSpan(text: 'A Caparroz Despachantes', style: _t(15, FontWeight.bold, _textDark)),
            TextSpan(text: ' atua no setor desde 1951, sendo referência em serviços de documentação veicular em São Paulo.', style: _t(15, FontWeight.normal, _textMed)),
          ]),
        ),
        const SizedBox(height: 12),
        Text('A trajetória começou com Pedro Caparroz, despachante desde 1945, que iniciou sua carreira em Penápolis e depois se estabeleceu na capital. Em 1953, fundou o escritório no centro da cidade, na Rua do Carmo, e passou a atender como Caparroz Despachantes.',
            textAlign: TextAlign.justify,
            style: _t(15, FontWeight.normal, _textMed)),
        const SizedBox(height: 12),
        Text('O crescimento constante levou à abertura da filial na Rua Siqueira Bueno, na Mooca, em 1963. Com o sucesso da nova unidade, a matriz foi transferida para o bairro, onde estamos até hoje.',
            textAlign: TextAlign.justify,
            style: _t(15, FontWeight.normal, _textMed)),
        const SizedBox(height: 12),
        Text('Atualmente, a empresa é conduzida por David Caparroz, filho de Pedro, que dá continuidade à visão de confiança, qualidade e tradição no atendimento.',
            textAlign: TextAlign.justify,
            style: _t(15, FontWeight.normal, _textMed)),
        const SizedBox(height: 24),
        _buildTimeline(),
      ],
    );
  }

  Widget _buildTimeline() {
    final items = [
      {'ano': '1945', 'label': 'Início em Penápolis'},
      {'ano': '1953', 'label': 'Escritório na Rua do Carmo'},
      {'ano': '1963', 'label': 'Filial na Mooca'},
      {'ano': '2025', 'label': 'Serviços digitais'},
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(items.length, (i) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFDDDDDD)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 32, height: 32,
                    decoration: BoxDecoration(
                      color: _green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: _green, size: 16),
                  ),
                  const SizedBox(height: 6),
                  Text(items[i]['ano']!,
                      style: _t(14, FontWeight.bold, _green)),
                  const SizedBox(height: 2),
                  SizedBox(
                    width: 90,
                    child: Text(items[i]['label']!,
                        textAlign: TextAlign.center,
                        style: _t(11, FontWeight.normal, _textLight, h: 1.3)),
                  ),
                ],
              ),
            ),
            if (i < items.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.arrow_forward_ios_rounded,
                    size: 14, color: Colors.grey.shade400),
              ),
          ],
        )),
      ),
    );
  }

  // ─── Estrutura e Atuação ─────────────────────────────────────────────
  Widget _buildEstrutura(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _bg,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: LayoutBuilder(builder: (context, c) {
        final isMobile = c.maxWidth < 700;
        final img = ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset('assets/images/fachada.png',
              width: double.infinity,
              height: isMobile ? 220 : 320,
              fit: BoxFit.cover),
        );
        final texto = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionBadge('Estrutura'),
            _sectionTitle('Como atuamos'),
            Text('Com sede no Alto da Mooca, em um espaço de mais de 200 m², atendemos pessoas físicas e jurídicas, com destaque para o atendimento especializado a taxistas e empresas de frotas.',
                style: _t(15, FontWeight.normal, _textMed)),
            const SizedBox(height: 20),
            Text('Nossos principais serviços:',
                style: _t(14, FontWeight.bold, _textDark)),
            const SizedBox(height: 12),
            ...[
              ['IPVA', 'Consulta e pagamento à vista ou parcelado em até 21x'],
              ['Licenciamento', 'Emissão rápida do CRLV-e'],
              ['Multas de trânsito', 'Consulta, orientação e quitação'],
              ['Transferência de veículo', 'Compra e venda sem burocracia'],
              ['1ª e 2ª via de documentos', 'CRV, CRLV, placas e mais'],
              ['Regularização de débitos', 'Detran, Sefaz, Sinesp'],
            ].map((s) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 6, height: 6,
                        margin: const EdgeInsets.only(top: 7),
                        decoration: const BoxDecoration(color: _green, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(children: [
                            TextSpan(text: '${s[0]} – ', style: _t(14, FontWeight.w600, _textDark)),
                            TextSpan(text: s[1], style: _t(14, FontWeight.normal, _textMed)),
                          ]),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        );
        if (isMobile) {
          return Column(children: [img, const SizedBox(height: 24), texto]);
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: img),
            const SizedBox(width: 36),
            Expanded(flex: 3, child: texto),
          ],
        );
      }),
    );
  }

  // ─── Onde Estamos ────────────────────────────────────────────────────
  Widget _buildOndeEstamos(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final isMobile = c.maxWidth < 700;
      final mapa = ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/images/Captura_de_Tela_2025-10-09_as_17.31.46.png',
          width: double.infinity,
          fit: BoxFit.contain,
        ),
      );
      final info = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionBadge('Localização'),
          _sectionTitle('Onde estamos'),
          Text('Nosso escritório está localizado no Alto da Mooca, com fácil acesso para toda São Paulo.',
              style: _t(15, FontWeight.normal, _textMed)),
          const SizedBox(height: 16),
          _infoRow(Icons.location_on_outlined, 'Rua Siqueira Bueno, nº 2238 – Mooca, São Paulo – SP'),
          const SizedBox(height: 8),
          _infoRow(Icons.phone_outlined, '(11) 4301-9829'),
          const SizedBox(height: 8),
          _infoRow(Icons.access_time_outlined, 'Segunda a Sexta: 9h às 18h'),
        ],
      );
      if (isMobile) {
        return Column(children: [info, const SizedBox(height: 24), mapa]);
      }
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: info),
          const SizedBox(width: 36),
          Expanded(flex: 2, child: mapa),
        ],
      );
    });
  }

  Widget _infoRow(IconData icon, String text) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 18, color: _green),
      const SizedBox(width: 10),
      Expanded(child: Text(text, style: _t(14, FontWeight.normal, _textMed))),
    ],
  );

  // ─── Avaliações ──────────────────────────────────────────────────────
  Widget _buildAvaliacoes(BuildContext context) {
    final reviews = [
      {'nome': 'Amanda Silva', 'foto': 'https://images.unsplash.com/photo-1614436163996-25cee5f54290?w=200&q=80', 'nota': 5.0, 'texto': 'Ótimo atendimento e resolução imediata do problema'},
      {'nome': 'Wesley Soares', 'foto': 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200&q=80', 'nota': 3.0, 'texto': 'Atendimento especializado. Parabéns!'},
      {'nome': 'Erika Santos', 'foto': 'https://images.unsplash.com/photo-1591950845424-4d3ef17c72d8?w=200&q=80', 'nota': 4.0, 'texto': 'Resolvi a transferência do meu veículo de forma rápida. Indico!!!'},
      {'nome': 'Luciana Pereira', 'foto': 'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=200&q=80', 'nota': 5.0, 'texto': 'Esclareceu todas as dúvidas e realizei os pagamentos online. Top!!!'},
      {'nome': 'Lucas Teixeira', 'foto': 'https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?w=200&q=80', 'nota': 5.0, 'texto': 'Consultei os débitos de forma eletrônica e paguei de forma simples'},
    ];
    return Container(
      color: _bg,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionBadge('Avaliações'),
                _sectionTitle('O que nossos clientes dizem'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: reviews.map((r) => _reviewCard(r)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviewCard(Map<String, dynamic> r) => Container(
    width: 260,
    margin: const EdgeInsets.only(right: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFEEEEEE)),
      boxShadow: const [BoxShadow(blurRadius: 8, color: Color(0x08000000), offset: Offset(0, 2))],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(r['foto'] as String),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r['nome'] as String,
                      style: _t(13, FontWeight.w600, _textDark)),
                  RatingBar.builder(
                    onRatingUpdate: (_) {},
                    itemBuilder: (_, __) =>
                        const Icon(Icons.star_rounded, color: _green),
                    direction: Axis.horizontal,
                    initialRating: r['nota'] as double,
                    unratedColor: const Color(0xFFDDDDDD),
                    itemCount: 5,
                    itemSize: 14,
                    ignoreGestures: true,
                    glowColor: _green,
                  ),
                ],
              ),
            ),
            ClipOval(
              child: Image.asset(
                'assets/images/icons8-google-logo-48.png',
                width: 24, height: 24, fit: BoxFit.contain),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(r['texto'] as String,
            style: _t(13, FontWeight.normal, _textMed, h: 1.5)),
      ],
    ),
  );

  // ─── CTA Banner ───────────────────────────────────────────────────────
  Widget _buildCTA(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(28),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFF003D20), Color(0xFF008844)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
    child: LayoutBuilder(builder: (context, c) {
      final isMobile = c.maxWidth < 500;
      return isMobile
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _ctaTexto(),
              const SizedBox(height: 16),
              _ctaBotao(context),
            ])
          : Row(
              children: [
                Expanded(child: _ctaTexto()),
                const SizedBox(width: 24),
                _ctaBotao(context),
              ],
            );
    }),
  );

  Widget _ctaTexto() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Regularize agora mesmo',
          style: GoogleFonts.mukta(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
      const SizedBox(height: 4),
      Text('Fale com nosso time pelo WhatsApp',
          style: GoogleFonts.roboto(fontSize: 13, color: Colors.white70)),
    ],
  );

  Widget _ctaBotao(BuildContext context) => ElevatedButton.icon(
    onPressed: () => launchURL('https://wa.me/551143019829'),
    icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 18),
    label: Text('(11) 4301-9829',
        style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF25D366),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra verde topo
              Container(
                width: double.infinity,
                color: _darkGreen,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock_outline, color: Colors.white70, size: 14),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text('Caparroz Despachantes',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                  ],
                ),
              ),

              // TopBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: wrapWithModel(
                  model: _model.topBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const TopBarWidget(),
                ),
              ),

              // Quem somos
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                child: _buildQuemSomos(context),
              ),

              _divider(),

              // Estrutura
              _buildEstrutura(context),

              const SizedBox(height: 8),

              // Onde estamos
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: _buildOndeEstamos(context),
              ),

              // Avaliações
              _buildAvaliacoes(context),

              const SizedBox(height: 32),

              // Rodapé
              wrapWithModel(
                model: _model.rodapeModel,
                updateCallback: () => safeSetState(() {}),
                child: const RodapeWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
