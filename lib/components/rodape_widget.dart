import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rodape_model.dart';
export 'rodape_model.dart';

class RodapeWidget extends StatefulWidget {
  const RodapeWidget({super.key});

  @override
  State<RodapeWidget> createState() => _RodapeWidgetState();
}

class _RodapeWidgetState extends State<RodapeWidget> {
  late RodapeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RodapeModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 700;
        return Container(
          width: double.infinity,
          color: FlutterFlowTheme.of(context).secondary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: isNarrow
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLogo(context),
                    const SizedBox(height: 12),
                    _buildAddress(context),
                    const SizedBox(height: 12),
                    _buildRights(context),
                    const SizedBox(height: 8),
                    _buildSocial(context),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLogo(context),
                    Expanded(child: _buildAddress(context)),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildRights(context),
                        const SizedBox(height: 8),
                        _buildSocial(context),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildLogo(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/images/logo.png',
        width: 60,
        height: 60,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildAddress(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        'Rua Siqueira Bueno, 2238 - Mooca - São Paulo/SP\n\nDespachante Caparroz\nCNPJ: 01.750.692/0001-58',
        style: GoogleFonts.urbanist(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          fontWeight: FontWeight.w100,
          fontSize: 13,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildRights(BuildContext context) {
    return InkWell(
      onTap: () async => launchURL('https://www.ittrust.com.br'),
      child: Text(
        'Todos os direitos reservados a Caparroz\nProduzido por IT Trust Solutions',
        textAlign: TextAlign.end,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              fontSize: 10,
              letterSpacing: 0,
              fontWeight: FontWeight.w100,
              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
            ),
      ),
    );
  }

  Widget _buildSocial(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Acompanhe nas redes',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                letterSpacing: 0,
                fontWeight: FontWeight.w100,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).bodyMediumIsCustom,
              ),
        ),
        const SizedBox(width: 10),
        FaIcon(FontAwesomeIcons.facebookSquare,
            color: FlutterFlowTheme.of(context).secondaryBackground, size: 24),
        const SizedBox(width: 5),
        FaIcon(FontAwesomeIcons.linkedin,
            color: FlutterFlowTheme.of(context).secondaryBackground, size: 24),
        const SizedBox(width: 5),
        InkWell(
          onTap: () async => launchURL(
              'https://www.instagram.com/caparroz_despachantes?igsh=aG41Z3E1NTFyNWE='),
          child: FaIcon(FontAwesomeIcons.instagram,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 24),
        ),
      ],
    );
  }
}
