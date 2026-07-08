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
              width: double.infinity, fit: BoxFit.contain),
        ),
        const SizedBox(height: 16),
        PageTable(
          titulo: 'IPVA 2026 – SP\n(cota única ou 1ª parcela)',
          headers: const ['Final Placa', 'Vencimento (Jan/2026)'],
          rows: const [
            ['Final 1', '09/01'], ['Final 2', '10/01'], ['Final 3', '13/01'],
            ['Final 4', '14/01'], ['Final 5', '15/01'], ['Final 6', '16/01'],
            ['Final 7', '17/01'], ['Final 8', '20/01'], ['Final 9', '21/01'],
            ['Final 0', '22/01'],
          ],
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/atendimento.jpeg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return InnerPageLayout(
      titulo: 'IPVA',
      subtitulo: 'Consulte, calcule e pague seu IPVA com facilidade. Parcelamos em até 21x.',
      topBarModel: _model.topBarModel,
      rodapeModel: _model.rodapeModel,
      onUpdate: () => safeSetState(() {}),
      painelDireito: _buildPainelDireito(),
      secoes: [
        PageSection(
          titulo: '📌 Por que devo pagar o IPVA?',
          icone: Icons.info_outline,
          conteudo: 'O IPVA (Imposto sobre a Propriedade de Veículos Automotores) é um imposto estadual obrigatório para todos os proprietários de veículos. Ele é essencial para que seu veículo esteja regularizado e você possa:\n\n• Transitar legalmente pelas vias públicas\n• Pagar e renovar o licenciamento anual (CRLV), pois o sistema só libera o pagamento do licenciamento com o IPVA pago.\n• Vender ou transferir o veículo sem pendências\n• Evitar multas e a remoção do veículo ao pátio.',
        ),
        PageSection(
          titulo: '⚠️ O que acontece se eu não pagar?',
          icone: Icons.warning_amber_outlined,
          conteudo: 'Se você não pagar o IPVA:\n\n• Você não conseguirá fazer o licenciamento anual\n• Como o débito impede o licenciamento anual, sem o licenciamento em dia, o veículo poderá ser autuado por circulação irregular e removido ao pátio em uma fiscalização.\n• Serão aplicados multa e juros de mora sobre o débito, conforme a legislação estadual.\n• O débito poderá ser inscrito em Dívida Ativa, podendo resultar em protesto e cobrança judicial, nos termos da legislação aplicável.',
        ),
        PageSection(
          titulo: '🔍 Como consultar o valor que devo pagar?',
          icone: Icons.search,
          conteudo: 'É simples! Você só precisa ter em mãos:\n\n• Placa do veículo\n• Número do Renavam\n\nCom esses dados, você pode consultar os débitos atualizados diretamente aqui no site do Caparroz Despachantes.',
        ),
        PageSection(
          titulo: '📅 Quando devo pagar?',
          icone: Icons.calendar_month_outlined,
          conteudo: 'O IPVA começa a vencer no início de cada ano, geralmente em janeiro, conforme o último número da placa. Você pode optar por:\n\n• Pagamento à vista com desconto (em janeiro)\n• Pagamento parcelado no cartão em até 21x conosco',
        ),
        PageSection(
          titulo: '💳 Regularize com facilidade',
          icone: Icons.credit_card_outlined,
          isCallout: true,
          conteudo: '✅ Online e segura, por meio da plataforma da PinPag\n✅ Parcelada no cartão em até 21x\n✅ Com atendimento por telefone, caso você tenha dúvidas\n✅ Sem sair de casa\n\n📲 Fale com a gente: (11) 4301-9829',
        ),
      ],
    );
  }
}
