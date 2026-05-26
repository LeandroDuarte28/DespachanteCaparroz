import '/components/rodape_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'top_bar_model.dart';
import 'rodape_model.dart';

/// Layout base responsivo compartilhado por todas as páginas internas.
/// Fornece: barra verde topo + TopBar + conteúdo em 2 colunas (desktop)
/// ou coluna única (mobile) + rodapé.
class PageBaseWidget extends StatelessWidget {
  final Widget leftContent;
  final Widget? rightContent;
  final TopBarModel topBarModel;
  final RodapeModel rodapeModel;
  final VoidCallback onUpdate;

  const PageBaseWidget({
    super.key,
    required this.leftContent,
    this.rightContent,
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
              // Barra verde topo
              Container(
                width: double.infinity,
                color: const Color(0xFF008844),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.lock,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 18),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text('Despachante Caparroz SEGURO',
                          style: GoogleFonts.roboto(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                    ),
                  ],
                ),
              ),

              // TopBar
              Padding(
                padding: const EdgeInsets.all(16),
                child: wrapWithModel(
                  model: topBarModel,
                  updateCallback: onUpdate,
                  child: const TopBarWidget(),
                ),
              ),

              // Conteúdo principal responsivo
              LayoutBuilder(builder: (context, constraints) {
                final isDesktop = constraints.maxWidth > 860;
                if (rightContent == null) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 60 : 16,
                      vertical: 16,
                    ),
                    child: leftContent,
                  );
                }
                return isDesktop
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 3, child: leftContent),
                            const SizedBox(width: 32),
                            Expanded(flex: 2, child: rightContent!),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            rightContent!,
                            const SizedBox(height: 24),
                            leftContent,
                          ],
                        ),
                      );
              }),

              // Rodapé
              wrapWithModel(
                model: rodapeModel,
                updateCallback: onUpdate,
                child: const RodapeWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Widgets helpers reutilizáveis ──────────────────────────────────────────

class SectionTitle extends StatelessWidget {
  final String text;
  final Color? color;
  const SectionTitle(this.text, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: Text(text,
          style: GoogleFonts.mukta(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: color ?? FFAppState().corFonte,
          )),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String content;
  final Color? bg;
  const InfoCard(this.content, {super.key, this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg ?? const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Text(content,
          style: GoogleFonts.roboto(
              fontSize: 15, height: 1.6, color: const Color(0xFF333333))),
    );
  }
}

class GreenCallout extends StatelessWidget {
  final String content;
  const GreenCallout(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF008844), width: 1.5),
      ),
      child: Text(content,
          style: GoogleFonts.roboto(
              fontSize: 15, height: 1.6, color: const Color(0xFF1B5E20))),
    );
  }
}

class ResponsiveImage extends StatelessWidget {
  final String asset;
  final double maxHeight;
  const ResponsiveImage(this.asset, {super.key, this.maxHeight = 320});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(asset,
            width: double.infinity,
            fit: BoxFit.cover),
      ),
    );
  }
}

class DataTable2Col extends StatelessWidget {
  final String title;
  final List<List<String>> rows;
  final List<String> headers;

  const DataTable2Col({
    super.key,
    required this.title,
    required this.rows,
    required this.headers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          // Título da tabela
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF008844),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Text(title,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
          ),
          // Header
          Container(
            color: const Color(0xFFE8F5E9),
            child: Row(
              children: headers
                  .map((h) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(h,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: const Color(0xFF1B5E20))),
                        ),
                      ))
                  .toList(),
            ),
          ),
          // Rows
          ...rows.asMap().entries.map((e) => Container(
                color: e.key.isEven ? Colors.white : const Color(0xFFF5F5F5),
                child: Row(
                  children: e.value
                      .map((cell) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Text(cell,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      color: const Color(0xFF333333))),
                            ),
                          ))
                      .toList(),
                ),
              )),
        ],
      ),
    );
  }
}
