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
import 'ipva_model.dart';
export 'ipva_model.dart';

class IpvaWidget extends StatefulWidget {
  const IpvaWidget({super.key});
  static String routeName = 'Ipva';
  static String routePath = '/ipva';

  @override
  State<IpvaWidget> createState() => _IpvaWidgetState();
}

class _IpvaWidgetState extends State<IpvaWidget> with TickerProviderStateMixin {
  late IpvaModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IpvaModel());
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

  // ── Estilos ──────────────────────────────────────────────────────────
  TextStyle get _body => GoogleFonts.roboto(fontSize: 15, height: 1.6, color: const Color(0xFF333333));
  TextStyle get _bodyBold => GoogleFonts.roboto(fontSize: 15, height: 1.6, fontWeight: FontWeight.bold, color: const Color(0xFF333333));

  // ── Tabela IPVA ───────────────────────────────────────────────────────
  Widget _buildTabelaIPVA() {
    final rows = [
      ['Final 1', '09/01'], ['Final 2', '10/01'], ['Final 3', '13/01'],
      ['Final 4', '14/01'], ['Final 5', '15/01'], ['Final 6', '16/01'],
      ['Final 7', '17/01'], ['Final 8', '20/01'], ['Final 9', '21/01'],
      ['Final 0', '22/01'],
    ];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF008844),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Text(
              'IPVA 2025 – SP\n(pagamento em cota única ou 1ª parcela)',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Container(
            color: const Color(0xFFE8F5E9),
            child: Row(children: [
              Expanded(child: Padding(padding: const EdgeInsets.all(10),
                child: Text('Final Placa', textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 13, color: const Color(0xFF1B5E20))))),
              Expanded(child: Padding(padding: const EdgeInsets.all(10),
                child: Text('Vencimento (Jan/2025)', textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 13, color: const Color(0xFF1B5E20))))),
            ]),
          ),
          ...rows.asMap().entries.map((e) => Container(
            color: e.key.isEven ? Colors.white : const Color(0xFFF5F5F5),
            child: Row(children: [
              Expanded(child: Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text(e.value[0], textAlign: TextAlign.center, style: _body))),
              Expanded(child: Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text(e.value[1], textAlign: TextAlign.center, style: _body))),
            ]),
          )),
        ],
      ),
    );
  }

  // ── Callout verde ─────────────────────────────────────────────────────
  Widget _buildCallout(String text) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFE8F5E9),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFF008844), width: 1.5),
    ),
    child: Text(text, style: GoogleFonts.roboto(fontSize: 15, height: 1.6, color: const Color(0xFF1B5E20))),
  );

  Widget _buildInfoCard(String text) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFF8F9FA),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFE0E0E0)),
    ),
    child: Text(text, style: _body),
  );

  // ── Conteúdo esquerdo (texto) ─────────────────────────────────────────
  Widget _buildConteudo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('IPVA', style: GoogleFonts.mukta(fontWeight: FontWeight.bold, fontSize: 28,
          color: FFAppState().corFonte))
          .animateOnPageLoad(animationsMap['titleAnim']!),
      const SizedBox(height: 8),
      Text('Tudo o que você precisa saber sobre o IPVA',
          style: GoogleFonts.roboto(fontSize: 16, color: const Color(0xFF555555))),
      const SizedBox(height: 20),
      _buildInfoCard(
        '📌 Por que devo pagar o IPVA?\n'
        'O IPVA (Imposto sobre a Propriedade de Veículos Automotores) é um imposto estadual obrigatório para todos os proprietários de veículos. Ele é essencial para que seu veículo esteja regularizado e você possa:\n'
        '- Transitar legalmente pelas vias públicas\n'
        '- Renovar o licenciamento anual (CRLV)\n'
        '- Vender ou transferir o veículo sem pendências\n'
        '- Evitar multas e apreensão',
      ),
      _buildInfoCard(
        '⚠️ O que acontece se eu não pagar o IPVA?\n'
        'Se você não pagar o IPVA:\n'
        '- Seu veículo poderá ser multado e apreendido em uma blitz\n'
        '- Você não conseguirá fazer o licenciamento anual\n'
        '- Serão aplicados juros e multa diária sobre o valor\n'
        '- A dívida será encaminhada para a Dívida Ativa, podendo causar protesto em cartório e até bloqueio judicial',
      ),
      _buildInfoCard(
        '🔍 Como faço para consultar o valor que devo pagar?\n'
        'É simples! Você só precisa ter em mãos:\n'
        '- Placa do veículo\n'
        '- Número do Renavam\n\n'
        'Com esses dados, você pode consultar os débitos atualizados diretamente aqui no site do Caparroz Despachantes.',
      ),
      _buildInfoCard(
        '📅 Quando devo pagar o IPVA?\n'
        'O IPVA começa a vencer no início de cada ano, geralmente em janeiro, conforme o último número da placa. Você pode optar por:\n'
        '- Pagamento à vista com desconto (em janeiro)\n'
        '- Pagamento parcelado em até 3 vezes (janeiro, fevereiro e março)\n'
        '- Pagamento parcelado no cartão em até 12x conosco\n\n'
        '⏳ Qual o prazo para pagar?\n'
        'O prazo depende do número final da placa do seu veículo. Os vencimentos variam conforme o estado e o ano, mas normalmente seguem um calendário divulgado pela Secretaria da Fazenda (Sefaz) de cada estado.',
      ),
      _buildCallout(
        '💳 Regularize seu IPVA com facilidade\n'
        'Com o Caparroz Despachantes, você paga seu IPVA de forma:\n'
        '✅ Online e segura, por meio da plataforma da PinPag.\n'
        '✅ Parcelada no cartão em até 18x.\n'
        '✅ Com atendimento por telefone, caso você tenha dúvidas.\n'
        '✅ Sem sair de casa.\n\n'
        '📲 Fale com a gente\n'
        'Tem dúvidas ou precisa de ajuda?\n'
        'Fale com nosso time pelo WhatsApp: (11) 4301-9829',
      ),
    ],
  );

  // ── Painel direito (tabela + imagem) ──────────────────────────────────
  Widget _buildPainelDireito() => Column(
    children: [
      _buildTabelaIPVA(),
      const SizedBox(height: 20),
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset('assets/images/Captura_de_Tela_2025-10-08_as_16.13.07.png',
            width: double.infinity, fit: BoxFit.contain),
      ),
      const SizedBox(height: 20),
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset('assets/images/atendimento.jpeg',
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
              // Barra verde topo
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
              // TopBar
              Padding(
                padding: const EdgeInsets.all(16),
                child: wrapWithModel(model: _model.topBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const TopBarWidget()),
              ),
              // Conteúdo responsivo
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
              // Rodapé
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
