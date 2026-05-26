import '/components/consulta_debitos_sem_login_widget.dart';
import '/components/rodape_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
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
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().textoHomeCaracterEspecial = '1ª via e 2ª via de documentos –';
      safeSetState(() {});
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // ─── helpers de estilo ────────────────────────────────────────────────
  TextStyle _bodyLight(BuildContext context) =>
      GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 16, height: 1.4, color: const Color(0xFF333333));
  TextStyle _bodyBold(BuildContext context) =>
      GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, height: 1.4, color: const Color(0xFF333333));
  TextStyle _bodySemi(BuildContext context) =>
      GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 16, height: 1.4, color: const Color(0xFF333333));

  // ─── Seção "Quem Somos" ───────────────────────────────────────────────
  Widget _buildQuemSomos(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isDesktop = constraints.maxWidth > 800;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _buildQuemSomosTexto(context)),
                  const SizedBox(width: 32),
                  Expanded(flex: 2, child: _buildConsultaBox(context)),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildConsultaBox(context),
                  const SizedBox(height: 24),
                  _buildQuemSomosTexto(context),
                ],
              ),
      );
    });
  }

  Widget _buildConsultaBox(BuildContext context) {
    return wrapWithModel(
      model: _model.consultaDebitosSemLoginModel1,
      updateCallback: () => safeSetState(() {}),
      child: const ConsultaDebitosSemLoginWidget(),
    );
  }

  Widget _buildQuemSomosTexto(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUEM SOMOS',
          style: GoogleFonts.mukta(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: FFAppState().corFonte,
          ),
        ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
        const SizedBox(height: 16),
        RichText(
          textScaler: MediaQuery.of(context).textScaler,
          text: TextSpan(children: [
            TextSpan(text: 'A Caparroz Despachantes', style: _bodyBold(context)),
            TextSpan(text: ' atua no setor desde 1951, sendo referência em serviços de documentação veicular em São Paulo.', style: _bodyLight(context)),
          ]),
        ),
        const SizedBox(height: 12),
        RichText(
          textScaler: MediaQuery.of(context).textScaler,
          text: TextSpan(children: [
            TextSpan(text: 'A trajetória começou com ', style: _bodyLight(context)),
            TextSpan(text: 'Pedro Caparroz', style: _bodyBold(context)),
            TextSpan(text: ', despachante desde 1945, que iniciou sua carreira em Penápolis e depois se estabeleceu na capital. Em 1953, fundou o escritório no centro da cidade, na Rua do Carmo, e passou a atender como ', style: _bodyLight(context)),
            TextSpan(text: 'Despachante Caparroz.', style: _bodyBold(context)),
          ]),
        ),
        const SizedBox(height: 12),
        RichText(
          textScaler: MediaQuery.of(context).textScaler,
          text: TextSpan(children: [
            TextSpan(text: 'O crescimento constante levou à abertura da filial na ', style: _bodyLight(context)),
            TextSpan(text: 'Rua Siqueira Bueno, na Mooca', style: _bodyBold(context)),
            TextSpan(text: ', em 1963. Com o sucesso da nova unidade, a matriz foi transferida para o bairro, onde estamos até hoje.', style: _bodyLight(context)),
          ]),
        ),
        const SizedBox(height: 12),
        RichText(
          textScaler: MediaQuery.of(context).textScaler,
          text: TextSpan(children: [
            TextSpan(text: 'Atualmente, a empresa é conduzida por ', style: _bodyLight(context)),
            TextSpan(text: 'David Caparroz', style: _bodyBold(context)),
            TextSpan(text: ', filho de Pedro, que dá continuidade à visão de confiança, qualidade e tradição no atendimento.', style: _bodyLight(context)),
          ]),
        ),
        const SizedBox(height: 24),
        _buildTimeline(context),
      ],
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final items = [
      {'ano': '1945', 'label': 'Início em\nPenápolis'},
      {'ano': '1953', 'label': 'Primeiro\nescritório\nna Rua do Carmo'},
      {'ano': '1963', 'label': 'Abertura da\nfilial na Mooca'},
      {'ano': '2025', 'label': 'Em pleno crescimento\ncom serviços digitais'},
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            _buildTimelineItem(context, items[i]['ano']!, items[i]['label']!),
            if (i < items.length - 1)
              const Icon(Icons.arrow_forward_ios_rounded, size: 20),
          ],
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, String ano, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Icon(Icons.check_circle_outline_sharp, color: Color(0xFF008844), size: 28),
          const SizedBox(height: 4),
          Text(ano, style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            letterSpacing: 0,
            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
          )),
          Text(label, textAlign: TextAlign.center, style: _bodyLight(context).copyWith(fontSize: 13)),
        ],
      ),
    );
  }

  // ─── Seção Estrutura e Atuação ────────────────────────────────────────
  Widget _buildEstrutura(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isDesktop = constraints.maxWidth > 800;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: _buildFachada(context)),
                  const SizedBox(width: 32),
                  Expanded(flex: 3, child: _buildEstruturaTexto(context)),
                ],
              )
            : Column(
                children: [
                  _buildFachada(context),
                  const SizedBox(height: 16),
                  _buildEstruturaTexto(context),
                ],
              ),
      );
    });
  }

  Widget _buildFachada(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        'assets/images/fachada.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildEstruturaTexto(BuildContext context) {
    return RichText(
      textScaler: MediaQuery.of(context).textScaler,
      text: TextSpan(children: [
        TextSpan(text: 'Estrutura e Atuação\n', style: _bodyBold(context).copyWith(fontSize: 18)),
        TextSpan(text: 'Com sede no Alto da Mooca, em um espaço de mais de 200 m², atendemos pessoas físicas e jurídicas, com destaque para o atendimento especializado a taxistas e empresas de frotas.\n\n', style: _bodyLight(context)),
        TextSpan(text: 'Nossos serviços incluem:\n', style: _bodyLight(context)),
        TextSpan(text: '• IPVA – ', style: _bodySemi(context)),
        TextSpan(text: 'Consulta e pagamento à vista ou parcelado em até 18x\n', style: _bodyLight(context)),
        TextSpan(text: '• Licenciamento – ', style: _bodySemi(context)),
        TextSpan(text: 'Emissão rápida do CRLV-e\n', style: _bodyLight(context)),
        TextSpan(text: '• Multas de trânsito – ', style: _bodySemi(context)),
        TextSpan(text: 'Consulta, orientação e quitação\n', style: _bodyLight(context)),
        TextSpan(text: '• Transferência de veículo – ', style: _bodySemi(context)),
        TextSpan(text: 'Compra e venda sem dor de cabeça\n', style: _bodyLight(context)),
        TextSpan(text: '• 1ª via e 2ª via de documentos – ', style: _bodySemi(context)),
        TextSpan(text: 'CRV, CRLV, placas e mais\n', style: _bodyLight(context)),
        TextSpan(text: '• Regularização de débitos e bloqueios – ', style: _bodySemi(context)),
        TextSpan(text: 'Detran, Sefaz, Sinesp', style: _bodyLight(context)),
      ]),
    );
  }

  // ─── Seção Onde Estamos ───────────────────────────────────────────────
  Widget _buildOndeEstamos(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isDesktop = constraints.maxWidth > 800;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: _buildOndeEstamosTexto(context)),
                  const SizedBox(width: 32),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/Captura_de_Tela_2025-10-09_as_17.31.46.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOndeEstamosTexto(context),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/Captura_de_Tela_2025-10-09_as_17.31.46.png',
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
      );
    });
  }

  Widget _buildOndeEstamosTexto(BuildContext context) {
    return RichText(
      textScaler: MediaQuery.of(context).textScaler,
      text: TextSpan(children: [
        TextSpan(text: 'Onde estamos?\n\n', style: _bodySemi(context).copyWith(fontSize: 18)),
        TextSpan(text: 'Nosso escritório está localizado no Alto da Mooca, com fácil acesso para toda São Paulo.\n\n', style: _bodyLight(context)),
        TextSpan(text: 'Rua Siqueira Bueno, nº 2238 – Mooca, São Paulo – SP\n', style: _bodyLight(context)),
      ]),
    );
  }

  // ─── Seção Avaliações ─────────────────────────────────────────────────
  Widget _buildAvaliacoes(BuildContext context) {
    final reviews = [
      {'nome': 'Amanda Silva', 'foto': 'https://images.unsplash.com/photo-1614436163996-25cee5f54290?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80', 'nota': 5.0, 'texto': 'Ótimo atendimento e resolução imediata do problema'},
      {'nome': 'Wesley Soares', 'foto': 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&w=200', 'nota': 3.0, 'texto': 'Atendimento especializado\nParabéns!'},
      {'nome': 'Erika Santos', 'foto': 'https://images.unsplash.com/photo-1591950845424-4d3ef17c72d8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&w=200', 'nota': 4.0, 'texto': 'Resolvida a transferência do meu veículo de forma rápida. Indico!!!'},
      {'nome': 'Luciana Pereira', 'foto': 'https://images.unsplash.com/photo-1580489944761-15a19d654956?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&w=200', 'nota': 5.0, 'texto': 'Esclareceu todas as minhas dúvidas e realizei os pagamentos online. Top!!!'},
      {'nome': 'Lucas Teixeira', 'foto': 'https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&w=200', 'nota': 5.0, 'texto': 'Consultei os débitos de forma eletrônica e realizei os pagamentos de forma simples'},
    ];

    return Container(
      color: FlutterFlowTheme.of(context).primaryBackground,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: reviews.map((r) => _buildReviewCard(context, r)).toList(),
        ),
      ),
    );
  }

  Widget _buildReviewCard(BuildContext context, Map<String, dynamic> review) {
    return Container(
      width: 270,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 42, height: 42,
                    decoration: BoxDecoration(shape: BoxShape.circle,
                      border: Border.all(color: FlutterFlowTheme.of(context).secondary, width: 2)),
                    child: ClipOval(child: Image.network(review['foto'] as String, fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 8),
                  Text(review['nome'] as String,
                    style: GoogleFonts.lexendDeca(color: const Color(0xFF57636C), fontSize: 14)),
                ],
              ),
              Container(
                width: 30, height: 30,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  color: const Color(0x4C4B39EF),
                  border: Border.all(color: FlutterFlowTheme.of(context).secondary, width: 2)),
                child: ClipOval(child: Image.asset('assets/images/icons8-google-logo-48.png', fit: BoxFit.contain)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          RatingBar.builder(
            onRatingUpdate: (_) {},
            itemBuilder: (context, _) => Icon(Icons.star_rounded, color: FlutterFlowTheme.of(context).secondary),
            direction: Axis.horizontal,
            initialRating: review['nota'] as double,
            unratedColor: FlutterFlowTheme.of(context).accent1,
            itemCount: 5,
            itemSize: 22,
            ignoreGestures: true,
            glowColor: FlutterFlowTheme.of(context).secondary,
          ),
          const SizedBox(height: 10),
          Text(review['texto'] as String,
            style: FlutterFlowTheme.of(context).labelLarge.override(
              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
              letterSpacing: 0,
              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
            )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Barra verde topo ──────────────────────────────────────
              Container(
                width: double.infinity,
                color: const Color(0xFF008844),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.lock,
                        color: FlutterFlowTheme.of(context).secondaryBackground, size: 18),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        'Despachante Caparroz SEGURO',
                        style: GoogleFonts.roboto(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── TopBar ────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.all(16),
                child: wrapWithModel(
                  model: _model.topBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const TopBarWidget(),
                ),
              ),

              // ── Quem Somos ────────────────────────────────────────────
              _buildQuemSomos(context),

              const Divider(height: 32, thickness: 1, color: Color(0xFFDBE2E7)),

              // ── Foto fachada mobile ───────────────────────────────────
              if (responsiveVisibility(context: context, tabletLandscape: false, desktop: false))
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/fachada.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              // ── Estrutura e Atuação ───────────────────────────────────
              if (responsiveVisibility(context: context, phone: false, tablet: false))
                _buildEstrutura(context),

              const Divider(height: 32, thickness: 1, color: Color(0xFFDBE2E7)),

              // ── Onde Estamos ──────────────────────────────────────────
              _buildOndeEstamos(context),

              const Divider(height: 32, thickness: 1, color: Color(0xFFDBE2E7)),

              // ── Título avaliações ─────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Alguns de nossos clientes:',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color(0xFF57636C),
                      height: 1.4,
                    ),
                  ),
                ),
              ),

              // ── Avaliações ────────────────────────────────────────────
              _buildAvaliacoes(context),

              const SizedBox(height: 16),

              // ── Rodapé ────────────────────────────────────────────────
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
