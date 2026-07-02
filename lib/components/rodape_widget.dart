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
    return Container(
      width: double.infinity,
      color: const Color(0xFF00734A),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 650;
        if (isMobile) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogo(),
              const SizedBox(height: 14),
              _buildEndereco(),
              const SizedBox(height: 14),
              _buildSocial(context),
              const SizedBox(height: 10),
              _buildCreditos(context, center: true),
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLogo(),
            const SizedBox(width: 20),
            Expanded(child: _buildEndereco()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSocial(context),
                const SizedBox(height: 8),
                _buildCreditos(context, center: false),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget _buildLogo() {
    return InkWell(
      onTap: () async {
        await launchURL('https://www.caparroz.com.br/');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('assets/images/logo.png',
            width: 56, height: 56, fit: BoxFit.contain),
      ),
    );
  }

  Widget _buildEndereco() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Caparroz Despachantes',
            style: GoogleFonts.mukta(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
        const SizedBox(height: 2),
        Text('Rua Siqueira Bueno, 2238 – Mooca – São Paulo/SP',
            style: GoogleFonts.roboto(
                color: Colors.white70, fontSize: 12, height: 1.5)),
        Text('CNPJ: 01.750.692/0001-58',
            style: GoogleFonts.roboto(
                color: Colors.white70, fontSize: 12, height: 1.5)),
      ],
    );
  }

  Widget _buildSocial(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Acompanhe nas redes',
            style: GoogleFonts.roboto(
                color: Colors.white70, fontSize: 12)),
        const SizedBox(width: 10),
        _socialIcon(FontAwesomeIcons.facebookSquare, null),
        const SizedBox(width: 8),
        _socialIcon(FontAwesomeIcons.linkedin, null),
        const SizedBox(width: 8),
        _socialIcon(FontAwesomeIcons.instagram,
            'https://www.instagram.com/caparroz_despachantes'),
      ],
    );
  }

  Widget _socialIcon(dynamic icon, String? url) {
    return InkWell(
      onTap: url != null ? () => launchURL(url) : null,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: FaIcon(icon as IconData?, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildCreditos(BuildContext context, {required bool center}) {
    return InkWell(
      onTap: () => launchURL('https://www.ittrust.com.br'),
      child: Text(
        'Todos os direitos reservados a Caparroz\nProduzido por IT Trust Solutions',
        textAlign: center ? TextAlign.center : TextAlign.end,
        style: GoogleFonts.roboto(
            color: Colors.white54, fontSize: 10, height: 1.6),
      ),
    );
  }
}
