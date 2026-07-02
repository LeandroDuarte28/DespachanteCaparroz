import '/components/page_base_widget.dart';
import '/components/rodape_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    animationsMap['fade'] = AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effectsBuilder: () => [FadeEffect(curve: Curves.easeOut, delay: 0.ms, duration: 500.ms, begin: 0, end: 1)],
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() { _model.dispose(); super.dispose(); }

  Widget _buildPainelDireito() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/front.jpeg',
              width: double.infinity, height: 220, fit: BoxFit.cover),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF008844), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('💳 Regularize com o Caparroz',
                  style: GoogleFonts.mukta(fontWeight: FontWeight.bold,
                      fontSize: 15, color: const Color(0xFF1B5E20))),
              const SizedBox(height: 10),
              ...['Pagamento online em minutos',
                'Parcelamento no cartão de crédito',
                'Atualização automática no Detran',
                'Emissão e envio do CRLV-e por e-mail',
                'Atendimento humanizado por especialistas',
              ].map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Icon(Icons.check_circle_outline, size: 16, color: Color(0xFF008844)),
                  const SizedBox(width: 8),
                  Expanded(child: Text(s,
                      style: GoogleFonts.roboto(fontSize: 13, color: const Color(0xFF2E7D32), height: 1.4))),
                ]),
              )),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/pessoa2.jpeg',
              width: double.infinity, height: 220, fit: BoxFit.cover),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return InnerPageLayout(
      titulo: 'Licenciamento',
      subtitulo: 'Emita seu CRLV-e com rapidez e segurança, sem sair de casa.',
      topBarModel: _model.topBarModel,
      rodapeModel: _model.rodapeModel,
      onUpdate: () => safeSetState(() {}),
      painelDireito: _buildPainelDireito(),
      secoes: [
        PageSection(
          titulo: '📌 Por que devo pagar o Licenciamento?',
          icone: Icons.info_outline,
          conteudo: 'O licenciamento anual é obrigatório para todos os veículos registrados no Brasil. Ele garante que seu veículo está regularizado junto ao Detran e permite a circulação legal nas vias públicas.',
        ),
        PageSection(
          titulo: '⚠️ O que acontece se eu não pagar?',
          icone: Icons.warning_amber_outlined,
          conteudo: 'Se o licenciamento não for pago:\n\n• O veículo fica irregular para circulação\n• Você pode ser multado com infração gravíssima (R\$ 293,47 e 7 pontos na CNH)\n• O veículo pode ser removido ao pátio pela fiscalização até a regularização da documentação\n• Não é possível fazer transferência de propriedade\n• Pode haver dificuldade para contratar seguro ou vender o carro',
        ),
        PageSection(
          titulo: '🔍 Como consultar o valor que devo pagar?',
          icone: Icons.search,
          conteudo: 'Você precisa ter em mãos:\n\n• Placa do veículo\n• Número do Renavam\n\nCom esses dados, você consulta o valor exato do licenciamento aqui no site e realiza o pagamento com facilidade.',
        ),
        PageSection(
          titulo: '📅 Quando devo pagar?',
          icone: Icons.calendar_month_outlined,
          conteudo: 'O prazo para pagar varia de acordo com o último número da placa do veículo e segue um calendário anual estabelecido pelo Detran do seu estado.\n\nO licenciamento só pode ser feito após o pagamento do IPVA (quando houver débito). Cada estado divulga anualmente o calendário de licenciamento, com prazos entre os meses de abril e dezembro.',
        ),
        PageSection(
          titulo: '💳 Regularize o Licenciamento com o Caparroz',
          icone: Icons.credit_card_outlined,
          isCallout: true,
          conteudo: '✅ Pagamento online em minutos\n✅ Parcelamento no cartão de crédito\n✅ Atualização automática no sistema do Detran\n✅ Emissão e envio do CRLV-e por e-mail\n\n👉 Fale conosco pelo WhatsApp: (11) 4301-9829',
        ),
      ],
    );
  }
}
