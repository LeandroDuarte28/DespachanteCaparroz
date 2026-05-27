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
          child: Image.asset('assets/images/fachada.png',
              width: double.infinity, height: 220, fit: BoxFit.cover),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8E1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFFFB300), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('⚠️ Consequências de multas não pagas',
                  style: GoogleFonts.mukta(fontWeight: FontWeight.bold,
                      fontSize: 14, color: const Color(0xFF7B4F00))),
              const SizedBox(height: 10),
              ...['Veículo não poderá ser licenciado',
                'Pontos lançados na CNH',
                'Incidência de juros e correção monetária',
                'Dívida pode ir para protesto ou Dívida Ativa',
              ].map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Icon(Icons.close_rounded, size: 16, color: Color(0xFFE65100)),
                  const SizedBox(width: 8),
                  Expanded(child: Text(s,
                      style: GoogleFonts.roboto(fontSize: 13, color: const Color(0xFF5D4037), height: 1.4))),
                ]),
              )),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return InnerPageLayout(
      titulo: 'Multas de Trânsito',
      subtitulo: 'Consulte, quite e regularize suas infrações online, de forma rápida e segura.',
      topBarModel: _model.topBarModel,
      rodapeModel: _model.rodapeModel,
      onUpdate: () => safeSetState(() {}),
      painelDireito: _buildPainelDireito(),
      secoes: [
        PageSection(
          titulo: '❓ Como sei se tomei multas?',
          icone: Icons.help_outline,
          conteudo: 'Você pode descobrir se tomou alguma multa de trânsito das seguintes formas:\n\n• Pelo site oficial do Detran do seu estado, usando o número do Renavam e a placa do veículo\n• Através de cartas de notificação enviadas ao endereço cadastrado\n• Pelo app da CDT (Carteira Digital de Trânsito)\n• Ou mais fácil: aqui no site do Caparroz Despachantes, onde fazemos a consulta completa para você',
        ),
        PageSection(
          titulo: '⚠️ O que acontece se eu não pagar?',
          icone: Icons.warning_amber_outlined,
          conteudo: 'Se você não pagar as multas:\n\n• Seu veículo não poderá ser licenciado\n• A dívida se acumula com juros e multas adicionais\n• Os pontos serão lançados na sua CNH\n• A dívida pode ir para protesto ou Dívida Ativa',
        ),
        PageSection(
          titulo: '💰 Como consultar o valor que devo pagar?',
          icone: Icons.search,
          conteudo: 'Para saber o valor exato das multas, basta ter:\n\n• Número do Renavam\n• Placa do veículo\n\nCom esses dados, consulte aqui no site e veja todos os débitos atualizados.',
        ),
        PageSection(
          titulo: '📅 Quando devo pagar?',
          icone: Icons.calendar_month_outlined,
          conteudo: 'Você deve pagar a multa até a data de vencimento informada na notificação. O pagamento em até 30 dias após a emissão da multa pode garantir 20% de desconto se for feito dentro do prazo e sem contestação.',
        ),
        PageSection(
          titulo: '⏳ Qual o prazo para pagar?',
          icone: Icons.hourglass_bottom_outlined,
          conteudo: 'O prazo varia de acordo com:\n\n• A data de emissão da infração\n• O órgão autuador (Detran, PRF, CET etc.)\n• Se houve ou não recurso da infração\n\nNormalmente, você tem até 60 dias para quitar a multa — quanto antes pagar, melhor, especialmente para manter o licenciamento em dia e evitar juros.',
        ),
        PageSection(
          titulo: '💳 Pague suas multas com facilidade',
          icone: Icons.credit_card_outlined,
          isCallout: true,
          conteudo: '✅ Online e segura, por meio da plataforma da PinPag\n✅ Parcelada no cartão em até 18x\n✅ Com atendimento por telefone, caso você tenha dúvidas\n✅ Sem sair de casa\n\n👉 Fale conosco pelo WhatsApp: (11) 4301-9829',
        ),
      ],
    );
  }
}
