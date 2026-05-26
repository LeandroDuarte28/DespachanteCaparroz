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
import 'seguro_model.dart';
export 'seguro_model.dart';

class SeguroWidget extends StatefulWidget {
  const SeguroWidget({super.key});
  static String routeName = 'Seguro';
  static String routePath = '/seguro';

  @override
  State<SeguroWidget> createState() => _SeguroWidgetState();
}

class _SeguroWidgetState extends State<SeguroWidget> with TickerProviderStateMixin {
  late SeguroModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeguroModel());
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
      Text('Seguro Veicular', style: GoogleFonts.mukta(fontWeight: FontWeight.bold,
          fontSize: 28, color: FFAppState().corFonte))
          .animateOnPageLoad(animationsMap['titleAnim']!),
      const SizedBox(height: 8),
      Text('Por que contratar um seguro para o meu carro?',
          style: GoogleFonts.roboto(fontSize: 16, color: const Color(0xFF555555))),
      const SizedBox(height: 16),
      Text('Contratar um seguro é essencial para proteger seu veículo contra imprevistos como acidentes, roubos, furtos e danos causados por terceiros.',
          style: _body),
      const SizedBox(height: 16),
      _buildInfoCard(
        'Quais as vantagens de contratar um seguro?\n\n'
        '- Proteção contra roubo, furto e colisão\n'
        '- Cobertura para danos a terceiros\n'
        '- Assistência 24h (guincho, carro reserva)\n'
        '- Tranquilidade para dirigir no dia a dia',
      ),
      _buildInfoCard(
        'Quais as principais empresas de seguros para carros?\n\n'
        'No Brasil, as maiores e mais confiáveis seguradoras são:\n'
        '- Porto Seguro\n- Bradesco Seguros\n- SulAmérica\n'
        '- Allianz\n- Tokio Marine\n- Mapfre\n- HDI Seguros\n\n'
        'Essas empresas oferecem ampla rede de atendimento e diferentes planos para atender suas necessidades.',
      ),
      _buildInfoCard(
        'Quanto custa um seguro?\n\n'
        'O preço do seguro varia conforme:\n'
        '- Modelo, ano e valor do veículo\n'
        '- Perfil do motorista (idade, tempo de habilitação, histórico de sinistros)\n'
        '- Região onde o veículo é utilizado\n'
        '- Coberturas escolhidas (básica, intermediária ou completa)',
      ),
      _buildInfoCard(
        'Por quanto tempo vale um seguro?\n\n'
        'O seguro tem validade geralmente de 12 meses, renovável automaticamente, '
        'desde que o pagamento seja efetuado e o contrato continue válido.',
      ),
      _buildInfoCard(
        'Como usar o seguro?\n\n'
        'Em caso de acidente ou problema coberto:\n'
        '- Contate imediatamente a seguradora pelo telefone de emergência\n'
        '- Registre boletim de ocorrência se for necessário (roubo, furto, colisão grave)\n'
        '- Siga as orientações da seguradora para reparos, reembolso ou indenização\n'
        '- Utilize serviços de assistência disponíveis, como guincho e carro reserva',
      ),
      _buildInfoCard(
        'O que é um sinistro de seguro?\n\n'
        'Sinistro é o termo usado para qualquer evento que cause dano ou perda ao veículo segurado '
        'e que esteja coberto pelo contrato. Exemplos: acidentes, roubos, colisões, incêndios. '
        'A ocorrência de um sinistro aciona a cobertura do seguro para que o cliente possa ser indenizado ou ter seu veículo reparado.',
      ),
      _buildInfoCard(
        'Vantagens de ter um corretor que também é despachante\n\n'
        'Quando seu corretor de seguros também é um despachante especializado em documentação de veículos, '
        'você ganha uma série de benefícios que facilitam a sua vida:\n\n'
        '- Atendimento completo e integrado: Você resolve o seguro e a documentação em um só lugar\n'
        '- Orientação especializada em sinistros com perda total\n'
        '- Agilidade na transferência de veículo em caso de indenização\n'
        '- Suporte em regularização de débitos e documentos do veículo',
      ),
      _buildCallout(
        'No Caparroz Despachantes, essa união de corretor e despachante é nossa grande vantagem '
        'para entregar um serviço completo e sem complicação.\n\n'
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
