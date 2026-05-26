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
import 'licenciamento_model.dart';
export 'licenciamento_model.dart';

class LicenciamentoWidget extends StatefulWidget {
  const LicenciamentoWidget({super.key});
  static String routeName = 'Licenciamento';
  static String routePath = '/licenciamento';

  @override
  State<LicenciamentoWidget> createState() => _LicenciamentoWidgetState();
}

class _LicenciamentoWidgetState extends State<LicenciamentoWidget> with TickerProviderStateMixin {
  late LicenciamentoModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LicenciamentoModel());
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

  Widget _buildInfoCard(String text) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0))),
    child: Text(text, style: _body),
  );

  Widget _buildCallout(String text) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF008844), width: 1.5)),
    child: Text(text, style: GoogleFonts.roboto(fontSize: 15, height: 1.6, color: const Color(0xFF1B5E20))),
  );

  Widget _buildConteudo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Licenciamento', style: GoogleFonts.mukta(fontWeight: FontWeight.bold,
          fontSize: 28, color: FFAppState().corFonte))
          .animateOnPageLoad(animationsMap['titleAnim']!),
      const SizedBox(height: 8),
      Text('🔖 Tudo sobre o Licenciamento Anual do Veículo',
          style: GoogleFonts.roboto(fontSize: 16, color: const Color(0xFF555555))),
      const SizedBox(height: 16),
      Text('Manter o licenciamento do seu veículo em dia é essencial para circular legalmente e evitar multas. No Caparroz Despachantes, você resolve isso online, com segurança e rapidez.',
          style: _body),
      const SizedBox(height: 16),
      _buildInfoCard(
        '📌 Por que devo pagar o Licenciamento?\n\n'
        'O licenciamento anual é obrigatório para todos os veículos registrados no Brasil. Ele garante que o seu veículo está regularizado junto ao Detran e permite a circulação legal nas vias públicas.',
      ),
      _buildInfoCard(
        '⚠️ O que acontece se eu não pagar o Licenciamento?\n\n'
        'Se o licenciamento não for pago:\n'
        '• O veículo fica irregular para circulação\n'
        '• Você pode ser multado, com infração gravíssima (R\$ 293,47 e 7 pontos na CNH)\n'
        '• O veículo pode ser apreendido pela fiscalização\n'
        '• Não é possível fazer transferência de propriedade',
      ),
      _buildInfoCard(
        '🔍 Como faço para consultar o valor que devo pagar?\n\n'
        'Você precisa ter em mãos:\n'
        '• Placa do veículo\n'
        '• Número do Renavam\n\n'
        'Com esses dados, você pode consultar o valor exato do licenciamento aqui no site.',
      ),
      _buildInfoCard(
        '📅 Quando devo pagar o Licenciamento?\n\n'
        'O prazo para pagar varia de acordo com o último número da placa do veículo e segue um calendário anual estabelecido pelo Detran do seu estado.\n'
        'O licenciamento só pode ser feito após o pagamento do IPVA (quando houver débito).\n\n'
        '⏳ Qual o prazo para pagar?\n\n'
        'Cada estado divulga anualmente o calendário de licenciamento, com prazos de vencimento entre os meses de abril e dezembro, conforme o final da placa.',
      ),
      _buildCallout(
        '💳 Regularize o Licenciamento com o Caparroz Despachantes\n\n'
        '• Pagamento online em minutos\n'
        '• Parcelamento no cartão de crédito\n'
        '• Atualização automática no sistema do Detran\n'
        '• Emissão e envio do CRLV-e por e-mail\n\n'
        '👉 Fale com a gente\n'
        'Tem dúvidas ou quer regularizar agora mesmo?\n'
        'Converse com nosso time no WhatsApp:\n'
        '👉 Clique aqui para atendimento imediato',
      ),
    ],
  );

  Widget _buildPainelDireito() => Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset('assets/images/front.jpeg',
            width: double.infinity, fit: BoxFit.cover),
      ),
      const SizedBox(height: 16),
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset('assets/images/pessoa2.jpeg',
            width: double.infinity, fit: BoxFit.cover),
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
                          Expanded(flex: 2, child: _buildPainelDireito()),
                        ])
                      : Column(children: [
                          _buildPainelDireito(),
                          const SizedBox(height: 24),
                          _buildConteudo(),
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
