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
          child: Image.asset('assets/images/pessoa.jpeg',
              width: double.infinity, height: 220, fit: BoxFit.cover),
        ),
        const SizedBox(height: 16),
        // Menu rápido de serviços
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Acesse nossos serviços',
                  style: GoogleFonts.mukta(fontWeight: FontWeight.bold,
                      fontSize: 15, color: const Color(0xFF1A1A1A))),
              const SizedBox(height: 12),
              ...([
                [Icons.receipt_long_outlined, 'IPVA', 'Ipva'],
                [Icons.article_outlined, 'Licenciamento', 'Licenciamento'],
                [Icons.warning_amber_outlined, 'Multas', 'Multas'],
                [Icons.shield_outlined, 'Seguros', 'Seguro'],
              ] as List<List<dynamic>>).map((s) => InkWell(
                onTap: () => context.pushNamed(s[2] as String),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    Icon(s[0] as IconData, color: const Color(0xFF008844), size: 18),
                    const SizedBox(width: 10),
                    Expanded(child: Text(s[1] as String,
                        style: GoogleFonts.roboto(fontSize: 14,
                            color: const Color(0xFF333333), fontWeight: FontWeight.w500))),
                    const Icon(Icons.chevron_right, size: 16, color: Color(0xFFCCCCCC)),
                  ]),
                ),
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
      titulo: 'Calendário de Vencimentos',
      subtitulo: 'Confira os prazos de IPVA e Licenciamento para carros, motos e caminhões.',
      topBarModel: _model.topBarModel,
      rodapeModel: _model.rodapeModel,
      onUpdate: () => safeSetState(() {}),
      painelDireito: _buildPainelDireito(),
      secoes: [
        PageSection(
          titulo: '',
          customWidget: PageTable(
            titulo: '🚗 Carro — Calendário de Licenciamento 2026',
            headers: const ['Mês', 'Final da Placa'],
            rows: const [
              ['Jan até Jun', 'Consultar Detran'],
              ['Julho', 'Final 1'],
              ['Agosto', 'Final 2'],
              ['Setembro', 'Final 3'],
              ['Outubro', 'Final 4'],
              ['Novembro', 'Final 5 e 6'],
              ['Dezembro', 'Final 7, 8, 9 e 0'],
            ],
          ),
        ),
        PageSection(
          titulo: '',
          customWidget: PageTable(
            titulo: '🏍️ Moto — Calendário de Licenciamento 2026',
            headers: const ['Final da Placa', 'Mês do IPVA'],
            rows: const [
              ['Final 1 e 2', 'Consultar Detran'],
              ['Final 3 e 4', 'Consultar Detran'],
              ['Final 5 e 6', 'Consultar Detran'],
              ['Final 7 e 8', 'Consultar Detran'],
              ['Final 9', 'Consultar Detran'],
              ['Final 0', 'Consultar Detran'],
            ],
          ),
        ),
        PageSection(
          titulo: '',
          customWidget: PageTable(
            titulo: '🚛 Caminhão — Calendário de Licenciamento 2026',
            headers: const ['Mês', 'Final da Placa'],
            rows: const [
              ['Jan até Set', 'Consultar Detran'],
              ['Outubro', 'Final 1, 2, 3 e 4'],
              ['Novembro', 'Final 5, 6 e 7'],
              ['Dezembro', 'Final 8, 9 e 0'],
            ],
          ),
        ),
        PageSection(
          titulo: '⚠️ Atenção aos prazos',
          icone: Icons.access_time_outlined,
          conteudo: 'O não pagamento do IPVA ou do Licenciamento dentro do prazo gera multa por infração de trânsito e impede a regularização do veículo. Fique atento ao calendário e regularize antes do vencimento.',
        ),
        PageSection(
          titulo: '💳 Regularize agora com o Caparroz',
          icone: Icons.credit_card_outlined,
          isCallout: true,
          conteudo: '✅ Consulta gratuita de todos os débitos\n✅ Pagamento online e seguro\n✅ Parcelamento no cartão em até 21x\n✅ Sem sair de casa\n\n👉 Fale conosco pelo WhatsApp: (11) 4301-9829',
        ),
      ],
    );
  }
}
