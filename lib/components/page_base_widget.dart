import '/components/rodape_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rodape_model.dart';
import 'top_bar_model.dart';

/// Layout base de página interna com visual profissional e responsivo
class InnerPageLayout extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final List<PageSection> secoes;
  final Widget? painelDireito;
  final TopBarModel topBarModel;
  final RodapeModel rodapeModel;
  final VoidCallback onUpdate;

  static const _green = Color(0xFF008844);
  static const _darkGreen = Color(0xFF003D20);

  const InnerPageLayout({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.secoes,
    this.painelDireito,
    required this.topBarModel,
    required this.rodapeModel,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra topo
              Container(
                width: double.infinity,
                color: _darkGreen,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(Icons.lock_outline, color: Colors.white70, size: 14),
                  const SizedBox(width: 8),
                  Flexible(child: Text('Caparroz Despachantes',
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
                ]),
              ),
              // TopBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: wrapWithModel(
                    model: topBarModel, updateCallback: onUpdate,
                    child: const TopBarWidget()),
              ),
              // Hero da página
              Container(
                width: double.infinity,
                color: const Color(0xFFF7F8FA),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _green.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _green.withOpacity(0.3)),
                    ),
                    child: Text('Caparroz Despachantes',
                        style: GoogleFonts.roboto(
                            fontSize: 11, fontWeight: FontWeight.w600, color: _green)),
                  ),
                  const SizedBox(height: 10),
                  Text(titulo,
                      style: GoogleFonts.mukta(
                          fontSize: 32, fontWeight: FontWeight.bold,
                          color: const Color(0xFF1A1A1A), height: 1.2)),
                  const SizedBox(height: 6),
                  Text(subtitulo,
                      style: GoogleFonts.roboto(
                          fontSize: 15, color: const Color(0xFF666666), height: 1.5)),
                ]),
              ),
              // CTA WhatsApp
              _buildCTA(context),
              // Conteúdo
              LayoutBuilder(builder: (context, c) {
                final isDesktop = c.maxWidth > 860;
                final hPad = isDesktop ? 60.0 : 20.0;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 28),
                  child: isDesktop && painelDireito != null
                      ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Expanded(flex: 3, child: _buildSecoes(context)),
                          const SizedBox(width: 36),
                          SizedBox(
                            width: 340,
                            child: painelDireito!,
                          ),
                        ])
                      : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          if (painelDireito != null) ...[
                            painelDireito!,
                            const SizedBox(height: 28),
                          ],
                          _buildSecoes(context),
                        ]),
                );
              }),
              const SizedBox(height: 8),
              // Rodapé
              wrapWithModel(model: rodapeModel, updateCallback: onUpdate,
                  child: const RodapeWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecoes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: secoes.map((s) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: s.build(context),
      )).toList(),
    );
  }

  Widget _buildCTA(BuildContext context) => Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFF003D20), Color(0xFF008844)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
    child: LayoutBuilder(builder: (context, c) {
      final isMobile = c.maxWidth < 480;
      final txt = Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        Text('Precisa de ajuda?',
            style: GoogleFonts.mukta(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        Text('Fale com nosso time agora pelo WhatsApp',
            style: GoogleFonts.roboto(fontSize: 12, color: Colors.white70)),
      ]);
      final btn = ElevatedButton.icon(
        onPressed: () => launchURL('https://wa.me/551143019829'),
        icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 16),
        label: Text('(11) 4301-9829',
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 13)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF25D366),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
        ),
      );
      return isMobile
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [txt, const SizedBox(height: 16), btn])
          : Row(children: [Expanded(child: txt), const SizedBox(width: 20), btn]);
    }),
  );
}

/// Seção de conteúdo com título, ícone e texto
class PageSection {
  final String titulo;
  final String conteudo;
  final IconData? icone;
  final bool isCallout;
  final Widget? customWidget;

  const PageSection({
    required this.titulo,
    this.conteudo = '',
    this.icone,
    this.isCallout = false,
    this.customWidget,
  });

  static const _green = Color(0xFF008844);

  Widget build(BuildContext context) {
    if (customWidget != null) return customWidget!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isCallout ? const Color(0xFFE8F5E9) : const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCallout ? const Color(0xFF008844) : const Color(0xFFE8E8E8),
          width: isCallout ? 1.5 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            if (icone != null) ...[
              Icon(icone, color: _green, size: 20),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Text(titulo,
                  style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isCallout ? const Color(0xFF1B5E20) : const Color(0xFF1A1A1A))),
            ),
          ]),
          if (conteudo.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(conteudo,
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    height: 1.65,
                    color: isCallout ? const Color(0xFF2E7D32) : const Color(0xFF444444))),
          ],
        ],
      ),
    );
  }
}

/// Tabela responsiva de dados
class PageTable extends StatelessWidget {
  final String titulo;
  final List<String> headers;
  final List<List<String>> rows;

  const PageTable({
    super.key,
    required this.titulo,
    required this.headers,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: const [BoxShadow(blurRadius: 6, color: Color(0x08000000), offset: Offset(0, 2))],
      ),
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF005C2E), Color(0xFF008844)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Text(titulo,
              textAlign: TextAlign.center,
              style: GoogleFonts.mukta(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
        ),
        Container(
          color: const Color(0xFFEBF5EE),
          child: Row(children: headers.map((h) => Expanded(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Text(h, textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 12,
                    color: const Color(0xFF1B5E20)))))).toList()),
        ),
        ...rows.asMap().entries.map((e) => Container(
          color: e.key.isEven ? Colors.white : const Color(0xFFFAFAFA),
          child: Row(children: e.value.map((cell) => Expanded(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
              child: Text(cell, textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontSize: 13, color: const Color(0xFF333333)))))).toList()),
        )),
      ]),
    );
  }
}
