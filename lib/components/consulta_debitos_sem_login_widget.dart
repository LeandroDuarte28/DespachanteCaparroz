import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'consulta_debitos_sem_login_model.dart';
export 'consulta_debitos_sem_login_model.dart';

class ConsultaDebitosSemLoginWidget extends StatefulWidget {
  const ConsultaDebitosSemLoginWidget({super.key});

  @override
  State<ConsultaDebitosSemLoginWidget> createState() =>
      _ConsultaDebitosSemLoginWidgetState();
}

class _ConsultaDebitosSemLoginWidgetState
    extends State<ConsultaDebitosSemLoginWidget> {
  late ConsultaDebitosSemLoginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsultaDebitosSemLoginModel());
    _model.txtPlacaTextController ??= TextEditingController();
    _model.txtPlacaFocusNode ??= FocusNode();
    _model.txtCPFTextController ??= TextEditingController();
    _model.txtCPFFocusNode ??= FocusNode();
    _model.txtRenavamTextController ??= TextEditingController();
    _model.txtRenavamFocusNode ??= FocusNode();
    _model.txtUFTextController ??= TextEditingController();
    _model.txtUFFocusNode ??= FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.txtUFTextController?.text = 'SP';
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hint,
    required String? Function(BuildContext, String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF555555),
                  letterSpacing: 0.3)),
          const SizedBox(height: 4),
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.roboto(
                  fontSize: 14, color: const Color(0xFFAAAAAA)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFDDDDDD), width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF008844), width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: FlutterFlowTheme.of(context).error, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: FlutterFlowTheme.of(context).error, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            style: GoogleFonts.roboto(fontSize: 14, color: const Color(0xFF222222)),
            cursorColor: const Color(0xFF008844),
            validator: validator?.call(context, null) != null
                ? null
                : validator?.asValidator(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Color(0x15000000),
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header verde
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF005C2E), Color(0xFF008844)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Consulte seus débitos',
                      style: GoogleFonts.mukta(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text('Resultado em menos de 5 minutos',
                      style: GoogleFonts.roboto(
                          fontSize: 12, color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            _buildField(
              label: 'Placa do veículo',
              controller: _model.txtPlacaTextController!,
              focusNode: _model.txtPlacaFocusNode!,
              hint: 'Ex: ABC1D23',
              validator: _model.txtPlacaTextControllerValidator,
            ),
            _buildField(
              label: 'CPF / CNPJ',
              controller: _model.txtCPFTextController!,
              focusNode: _model.txtCPFFocusNode!,
              hint: 'Somente números',
              validator: _model.txtCPFTextControllerValidator,
            ),
            _buildField(
              label: 'Renavam',
              controller: _model.txtRenavamTextController!,
              focusNode: _model.txtRenavamFocusNode!,
              hint: 'Número do Renavam',
              validator: _model.txtRenavamTextControllerValidator,
            ),
            _buildField(
              label: 'Estado (UF)',
              controller: _model.txtUFTextController!,
              focusNode: _model.txtUFFocusNode!,
              hint: 'Ex: SP',
              validator: _model.txtUFTextControllerValidator,
            ),

            const SizedBox(height: 4),

            // Botão consultar
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  context.goNamed(
                    BackendWidget.routeName,
                    queryParameters: {
                      'cpf': serializeParam(
                          _model.txtCPFTextController!.text, ParamType.String),
                      'placa': serializeParam(
                          _model.txtPlacaTextController!.text, ParamType.String),
                      'renavam': serializeParam(
                          _model.txtRenavamTextController!.text, ParamType.String),
                      'uf': serializeParam(
                          _model.txtUFTextController!.text, ParamType.String),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF008844),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text('Consultar grátis',
                    style: GoogleFonts.mukta(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5)),
              ),
            ),

            const SizedBox(height: 16),

            // Logos parceiros
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/Captura_de_Tela_2025-10-08_as_16.05.53.png',
                width: double.infinity,
                height: 48,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline, size: 12, color: Color(0xFF888888)),
                const SizedBox(width: 4),
                Text('Consulta segura e gratuita',
                    style: GoogleFonts.roboto(
                        fontSize: 11, color: const Color(0xFF888888))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
