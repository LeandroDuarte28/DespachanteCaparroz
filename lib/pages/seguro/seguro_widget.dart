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
    animationsMap['fade'] = AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effectsBuilder: () => [FadeEffect(curve: Curves.easeOut, delay: 0.ms, duration: 500.ms, begin: 0, end: 1)],
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() { _model.dispose(); super.dispose(); }

  Widget _buildPainelDireito() {
    final seguradoras = ['Porto Seguro', 'Bradesco Seguros', 'SulAmérica',
        'Allianz', 'Tokio Marine', 'Mapfre', 'HDI Seguros'];
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/fachada.png',
              width: double.infinity, height: 220, fit: BoxFit.cover),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Principais seguradoras',
                  style: GoogleFonts.mukta(fontWeight: FontWeight.bold,
                      fontSize: 15, color: const Color(0xFF1A1A1A))),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: seguradoras.map((s) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFDDDDDD)),
                  ),
                  child: Text(s, style: GoogleFonts.roboto(fontSize: 12,
                      color: const Color(0xFF444444))),
                )).toList(),
              ),
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
      titulo: 'Seguro Veicular',
      subtitulo: 'Proteja seu veículo com o suporte completo de quem entende de documentação.',
      topBarModel: _model.topBarModel,
      rodapeModel: _model.rodapeModel,
      onUpdate: () => safeSetState(() {}),
      painelDireito: _buildPainelDireito(),
      secoes: [
        PageSection(
          titulo: 'Por que contratar um seguro para o meu carro?',
          icone: Icons.shield_outlined,
          conteudo: 'Contratar um seguro é essencial para proteger seu veículo contra imprevistos como acidentes, roubos, furtos e danos causados a terceiros. Com um seguro, você tem tranquilidade para dirigir sabendo que está protegido.',
        ),
        PageSection(
          titulo: 'Quais as vantagens de contratar um seguro?',
          icone: Icons.star_outline,
          conteudo: '• Proteção contra roubo, furto e colisão\n• Cobertura para danos a terceiros\n• Assistência 24h (guincho, carro reserva)\n• Tranquilidade para dirigir no dia a dia\n• Indenização em caso de perda total',
        ),
        PageSection(
          titulo: 'Quanto custa um seguro?',
          icone: Icons.attach_money,
          conteudo: 'O preço do seguro varia conforme:\n\n• Modelo, ano e valor do veículo\n• Perfil do motorista (idade, tempo de habilitação, histórico de sinistros)\n• Região onde o veículo é utilizado\n• Coberturas escolhidas (básica, intermediária ou completa)',
        ),
        PageSection(
          titulo: 'Como usar o seguro em caso de sinistro?',
          icone: Icons.car_crash_outlined,
          conteudo: 'Em caso de acidente ou problema coberto:\n\n• Contate imediatamente a seguradora pelo telefone de emergência\n• Registre boletim de ocorrência se necessário (roubo, furto, colisão grave)\n• Siga as orientações da seguradora para reparos ou indenização\n• Utilize os serviços de assistência disponíveis, como guincho e carro reserva',
        ),
        PageSection(
          titulo: 'O que é um sinistro?',
          icone: Icons.info_outline,
          conteudo: 'Sinistro é qualquer evento que cause dano ou perda ao veículo segurado e que esteja coberto pelo contrato — como acidentes, roubos, colisões ou incêndios. O sinistro aciona a cobertura para que você possa ser indenizado ou ter seu veículo reparado.',
        ),
        PageSection(
          titulo: '🏆 Vantagem Caparroz: corretor + despachante',
          icone: Icons.emoji_events_outlined,
          isCallout: true,
          conteudo: 'Quando seu corretor de seguros também é despachante, você resolve tudo em um só lugar:\n\n✅ Seguro e documentação integrados\n✅ Orientação especializada em sinistros com perda total\n✅ Agilidade na transferência do veículo em caso de indenização\n✅ Suporte em regularização de débitos e documentos\n\n👉 Fale conosco: (11) 4301-9829',
        ),
      ],
    );
  }
}
