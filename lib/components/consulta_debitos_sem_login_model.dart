import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'consulta_debitos_sem_login_widget.dart'
    show ConsultaDebitosSemLoginWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConsultaDebitosSemLoginModel
    extends FlutterFlowModel<ConsultaDebitosSemLoginWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtPlaca widget.
  FocusNode? txtPlacaFocusNode;
  TextEditingController? txtPlacaTextController;
  String? Function(BuildContext, String?)? txtPlacaTextControllerValidator;
  // State field(s) for txtCPF widget.
  FocusNode? txtCPFFocusNode;
  TextEditingController? txtCPFTextController;
  String? Function(BuildContext, String?)? txtCPFTextControllerValidator;
  // State field(s) for txtRenavam widget.
  FocusNode? txtRenavamFocusNode;
  TextEditingController? txtRenavamTextController;
  String? Function(BuildContext, String?)? txtRenavamTextControllerValidator;
  // State field(s) for txtUF widget.
  FocusNode? txtUFFocusNode;
  TextEditingController? txtUFTextController;
  String? Function(BuildContext, String?)? txtUFTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtPlacaFocusNode?.dispose();
    txtPlacaTextController?.dispose();

    txtCPFFocusNode?.dispose();
    txtCPFTextController?.dispose();

    txtRenavamFocusNode?.dispose();
    txtRenavamTextController?.dispose();

    txtUFFocusNode?.dispose();
    txtUFTextController?.dispose();
  }
}
