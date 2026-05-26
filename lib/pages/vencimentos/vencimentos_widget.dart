import '/components/rodape_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vencimentos_model.dart';
export 'vencimentos_model.dart';

class VencimentosWidget extends StatefulWidget {
  const VencimentosWidget({super.key});
  static String routeName = 'Vencimentos';
  static String routePath = '/vencimentos';

  @override
  State<VencimentosWidget> createState() => _VencimentosWidgetState();
}

class _VencimentosWidgetState extends State<VencimentosWidget> with TickerProviderStateMixin {
  late VencimentosModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VencimentosModel());
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().textoHomeCaracterEspecial = '1ª via e 2ª via de documentos –';
      safeSetState(() {});
    });
    animationsMap['titleAnim'] = AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effectsBuilder: () => [FadeEffect(curve: Curves.easeIn, delay: 0.ms, duration: 500.ms, begin: 0, end: 1)],
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() { _model.dispose(); super.dispose(); }

  TextStyle get _body => GoogleFonts.roboto(fontSize: 15, height: 1.6, color: const Color(0xFF333333));
  TextStyle get _header => GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 13, color: const Color(0xFF1B5E20));

  Widget _buildTabela(String titulo, List<String> headers, List<List<String>> rows) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: const BoxDecoration(
            color: Color(0xFF008844),
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Text(titulo, textAlign: TextAlign.center,
              style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
        ),
        Container(
          color: const Color(0xFFE8F5E9),
          child: Row(children: headers.map((h) => Expanded(
            child: Padding(padding: const EdgeInsets.all(10),
              child: Text(h, textAlign: TextAlign.center, style: _header)))).toList()),
        ),
        ...rows.asMap().entries.map((e) => Container(
          color: e.key.isEven ? Colors.white : const Color(0xFFF5F5F5),
          child: Row(children: e.value.map((cell) => Expanded(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(cell, textAlign: TextAlign.center, style: _body)))).toList()),
        )),
      ]),
    );
  }

  Widget _buildMenuServicos() {
    final servicos = [
      {'icon': Icons.car_crash_outlined, 'label': 'IPVA', 'route': '/ipva'},
      {'icon': Icons.article_outlined, 'label': 'Licenciamento', 'route': '/licenciamento'},
      {'icon': Icons.warning_amber_outlined, 'label': 'Multas de Trânsito', 'route': '/multas'},
      {'icon': Icons.swap_horiz, 'label': 'Transferência de Veículo', 'route': '/home'},
      {'icon': Icons.description_outlined, 'label': '1ª e 2ª via de documentos', 'route': '/home'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nossos serviços', style: GoogleFonts.mukta(fontWeight: FontWeight.bold,
            fontSize: 20, color: FFAppState().corFonte)),
        const SizedBox(height: 12),
        ...servicos.map((s) => InkWell(
          onTap: () => context.pushNamed(s['route'] as String),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Row(children: [
              Icon(s['icon'] as IconData, color: const Color(0xFF008844), size: 22),
              const SizedBox(width: 12),
              Expanded(child: Text(s['label'] as String, style: _body.copyWith(fontWeight: FontWeight.w500))),
              const Icon(Icons.chevron_right, color: Color(0xFF008844), size: 20),
            ]),
          ),
        )),
      ],
    );
  }

  Widget _buildConteudo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Calendário de Vencimentos', style: GoogleFonts.mukta(fontWeight: FontWeight.bold,
          fontSize: 28, color: FFAppState().corFonte))
          .animateOnPageLoad(animationsMap['titleAnim']!),
      const SizedBox(height: 8),
      Text('Confira os prazos de IPVA e Licenciamento por tipo de veículo',
          style: GoogleFonts.roboto(fontSize: 16, color: const Color(0xFF555555))),
      const SizedBox(height: 24),

      // Tabela Carro
      _buildTabela(
        'Carro — Licenciamento',
        ['Mês Licenciamento', 'Final da Placa'],
        [
          ['Jan até Jun', 'Consultar Detran'],
          ['Julho', '1'],
          ['Agosto', '2'],
          ['Setembro', '3'],
          ['Outubro', '4'],
          ['Novembro', '5 e 6'],
          ['Dezembro', '7, 8, 9 e 0'],
        ],
      ),

      // Tabela Moto
      _buildTabela(
        'Moto — IPVA e Licenciamento',
        ['Final Placa', 'IPVA'],
        [
          ['Final 1 e 2', 'Consultar Detran'],
          ['Final 3 e 4', 'Consultar Detran'],
          ['Final 5 e 6', 'Consultar Detran'],
          ['Final 7 e 8', 'Consultar Detran'],
          ['Final 9', 'Consultar Detran'],
          ['Final 0', 'Consultar Detran'],
        ],
      ),

      // Tabela Caminhão
      _buildTabela(
        'Caminhão — Licenciamento',
        ['Mês Licenciamento', 'Final da Placa'],
        [
          ['Jan até Set', 'Consultar Detran'],
          ['Outubro', '1, 2, 3 e 4'],
          ['Novembro', '5, 6 e 7'],
          ['Dezembro', '8, 9 e 0'],
        ],
      ),

      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF008844), width: 1.5),
        ),
        child: Text(
          '👉 Fale com a gente:\nTem dúvidas ou quer regularizar agora mesmo?\n'
          'Converse com nosso time no WhatsApp:\n👉 Clique aqui para atendimento imediato',
          style: GoogleFonts.roboto(fontSize: 15, height: 1.6, color: const Color(0xFF1B5E20)),
        ),
      ),
    ],
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
              Container(
                width: double.infinity,
                color: const Color(0xFF008844),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FaIcon(FontAwesomeIcons.lock,
                      color: FlutterFlowTheme.of(context).secondaryBackground, size: 18),
                  const SizedBox(width: 10),
                  Flexible(child: Text('Despachante Caparroz SEGURO',
                      style: GoogleFonts.roboto(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          fontWeight: FontWeight.bold, fontSize: 15))),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: wrapWithModel(model: _model.topBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const TopBarWidget()),
              ),
              LayoutBuilder(builder: (context, constraints) {
                final isDesktop = constraints.maxWidth > 860;
                final hPad = isDesktop ? 60.0 : 16.0;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 16),
                  child: isDesktop
                      ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Expanded(flex: 3, child: _buildConteudo()),
                          const SizedBox(width: 32),
                          Expanded(flex: 2, child: Column(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset('assets/images/fachada.png',
                                  width: double.infinity, fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 20),
                            _buildMenuServicos(),
                          ])),
                        ])
                      : Column(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset('assets/images/fachada.png',
                                width: double.infinity, fit: BoxFit.cover),
                          ),
                          const SizedBox(height: 24),
                          _buildConteudo(),
                          const SizedBox(height: 24),
                          _buildMenuServicos(),
                        ]),
                );
              }),
              wrapWithModel(model: _model.rodapeModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const RodapeWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
