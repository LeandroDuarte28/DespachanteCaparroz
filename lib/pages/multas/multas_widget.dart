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
import 'multas_model.dart';
export 'multas_model.dart';

class MultasWidget extends StatefulWidget {
  const MultasWidget({super.key});
  static String routeName = 'Multas';
  static String routePath = '/multas';

  @override
  State<MultasWidget> createState() => _MultasWidgetState();
}

class _MultasWidgetState extends State<MultasWidget> with TickerProviderStateMixin {
  late MultasModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultasModel());
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
      Text('Multas de Trânsito', style: GoogleFonts.mukta(fontWeight: FontWeight.bold,
          fontSize: 28, color: FFAppState().corFonte))
          .animateOnPageLoad(animationsMap['titleAnim']!),
      const SizedBox(height: 8),
      Text('🚨 Consultas e Pagamento de Multas de Trânsito',
          style: GoogleFonts.roboto(fontSize: 16, color: const Color(0xFF555555))),
      const SizedBox(height: 16),
      Text('Levar uma multa faz parte da rotina de muitos motoristas. O importante é saber como consultar, quitar e, quando possível, recorrer. No Caparroz Despachantes, facilitamos todo esse processo para você.',
          style: _body),
      const SizedBox(height: 16),
      _buildInfoCard(
        '❓ Como sei se tomei multas?\n\n'
        'Você pode descobrir se tomou alguma multa de trânsito das seguintes formas:\n'
        '- Pelo site ou app do Detran do seu estado\n'
        '- Pelo portal do SENATRAN\n'
        '- Pela notificação enviada pelo Correios\n'
        '- Diretamente aqui no site do Caparroz Despachantes',
      ),
      _buildInfoCard(
        '⚠️ O que acontece se eu não pagar as multas?\n\n'
        'Se você não pagar as multas:\n'
        '- Seu veículo não poderá ser licenciado\n'
        '- Os pontos serão lançados na sua CNH\n'
        '- Haverá incidência de juros e correção monetária\n'
        '- A dívida pode ir para protesto ou Dívida Ativa',
      ),
      _buildInfoCard(
        '💰 Como faço para consultar o valor que devo pagar?\n\n'
        'Para saber o valor exato das multas, basta ter:\n'
        '- Número do Renavam\n'
        '- Placa do veículo\n\n'
        'Com esses dados, consulte aqui no site e veja todos os débitos atualizados.',
      ),
      _buildInfoCard(
        '📆 Quando devo pagar?\n\n'
        'Você deve pagar a multa até a data de vencimento informada na notificação ou boleto da infração.\n\n'
        '⏳ Qual o prazo para pagar?\n\n'
        'O prazo varia de acordo com:\n'
        '- A data de emissão da infração\n'
        '- O órgão autuador (Detran, PRF, CET etc.)\n'
        '- O estado onde a infração ocorreu\n\n'
        'Em geral, o prazo para pagamento com desconto é de 30 dias após a notificação.',
      ),
      _buildCallout(
        '💳 Pague suas multas com facilidade\n'
        'Na Caparroz Despachantes, você tem:\n\n'
        '✅ Online e segura, por meio da plataforma da PinPag.\n'
        '✅ Parcelada no cartão em até 18x.\n'
        '✅ Com atendimento por telefone, caso você tenha dúvidas.\n'
        '✅ Sem sair de casa.\n\n'
        '👉 Fale com a gente:\n'
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
        child: Image.asset('assets/images/fachada.png',
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
