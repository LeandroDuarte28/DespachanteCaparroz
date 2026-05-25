import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/rodape_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'backend_widget.dart' show BackendWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BackendModel extends FlutterFlowModel<BackendWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel1;
  // State field(s) for inputCelular widget.
  FocusNode? inputCelularFocusNode;
  TextEditingController? inputCelularTextController;
  late MaskTextInputFormatter inputCelularMask;
  String? Function(BuildContext, String?)? inputCelularTextControllerValidator;
  // State field(s) for inputCPF widget.
  FocusNode? inputCPFFocusNode;
  TextEditingController? inputCPFTextController;
  late MaskTextInputFormatter inputCPFMask;
  String? Function(BuildContext, String?)? inputCPFTextControllerValidator;
  // State field(s) for inputPlaca widget.
  FocusNode? inputPlacaFocusNode;
  TextEditingController? inputPlacaTextController;
  String? Function(BuildContext, String?)? inputPlacaTextControllerValidator;
  // Stores action output result for [Custom Action - maxPlaca] action in inputPlaca widget.
  String? placaTratada;
  // State field(s) for inputRenavam widget.
  FocusNode? inputRenavamFocusNode;
  TextEditingController? inputRenavamTextController;
  late MaskTextInputFormatter inputRenavamMask;
  String? Function(BuildContext, String?)? inputRenavamTextControllerValidator;
  // State field(s) for inputEstado widget.
  FocusNode? inputEstadoFocusNode;
  TextEditingController? inputEstadoTextController;
  String? Function(BuildContext, String?)? inputEstadoTextControllerValidator;
  // Stores action output result for [Backend Call - API (ConsultaHash)] action in Button widget.
  ApiCallResponse? resultHash2;
  // Stores action output result for [Backend Call - API (ConsultaDebitos)] action in Button widget.
  ApiCallResponse? resultadoDebVeiculares;
  // Stores action output result for [Backend Call - API (ConsultaHash)] action in btnPesquisa widget.
  ApiCallResponse? resultHash;
  // Stores action output result for [Backend Call - API (ConsultaDebitos)] action in btnPesquisa widget.
  ApiCallResponse? debitos;
  // Stores action output result for [Backend Call - API (ConsultaDebitos)] action in btnPesquisa widget.
  ApiCallResponse? resultadoY;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap1 = {};
  List<dynamic> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap2 = {};
  List<dynamic> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Backend Call - API (PagamentoDebitos)] action in Button widget.
  ApiCallResponse? pagamentos;
  // Model for Rodape component.
  late RodapeModel rodapeModel;
  // Model for topBar component.
  late TopBarModel topBarModel2;
  // State field(s) for inputCPFX widget.
  FocusNode? inputCPFXFocusNode;
  TextEditingController? inputCPFXTextController;
  late MaskTextInputFormatter inputCPFXMask;
  String? Function(BuildContext, String?)? inputCPFXTextControllerValidator;
  // State field(s) for inputCelularX widget.
  FocusNode? inputCelularXFocusNode;
  TextEditingController? inputCelularXTextController;
  late MaskTextInputFormatter inputCelularXMask;
  String? Function(BuildContext, String?)? inputCelularXTextControllerValidator;
  // State field(s) for inputEstadoX widget.
  FocusNode? inputEstadoXFocusNode;
  TextEditingController? inputEstadoXTextController;
  String? Function(BuildContext, String?)? inputEstadoXTextControllerValidator;
  // State field(s) for inputRenavamX widget.
  FocusNode? inputRenavamXFocusNode;
  TextEditingController? inputRenavamXTextController;
  late MaskTextInputFormatter inputRenavamXMask;
  String? Function(BuildContext, String?)? inputRenavamXTextControllerValidator;
  // State field(s) for inputPlacaX widget.
  FocusNode? inputPlacaXFocusNode;
  TextEditingController? inputPlacaXTextController;
  String? Function(BuildContext, String?)? inputPlacaXTextControllerValidator;
  // Stores action output result for [Custom Action - maxPlaca] action in inputPlacaX widget.
  String? placaTratadaX;
  // Stores action output result for [Backend Call - API (ConsultaHash)] action in ButtonX widget.
  ApiCallResponse? resultHash2x;
  // Stores action output result for [Backend Call - API (ConsultaDebitos)] action in ButtonX widget.
  ApiCallResponse? resultadoDebVeicularesX;
  // Stores action output result for [Backend Call - API (ConsultaHash)] action in btnPesquisa widget.
  ApiCallResponse? resultHashX;
  // Stores action output result for [Backend Call - API (ConsultaDebitos)] action in btnPesquisa widget.
  ApiCallResponse? x2x;
  // Stores action output result for [Backend Call - API (ConsultaDebitos)] action in btnPesquisa widget.
  ApiCallResponse? primeiroDebitoQ;
  // Stores action output result for [Custom Action - valorStringFormatado] action in btnPesquisa widget.
  String? retornaValorFormatado;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap3 = {};
  List<dynamic> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Backend Call - API (PagamentoDebitos)] action in Button widget.
  ApiCallResponse? pagamentosXQ;

  @override
  void initState(BuildContext context) {
    topBarModel1 = createModel(context, () => TopBarModel());
    rodapeModel = createModel(context, () => RodapeModel());
    topBarModel2 = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel1.dispose();
    inputCelularFocusNode?.dispose();
    inputCelularTextController?.dispose();

    inputCPFFocusNode?.dispose();
    inputCPFTextController?.dispose();

    inputPlacaFocusNode?.dispose();
    inputPlacaTextController?.dispose();

    inputRenavamFocusNode?.dispose();
    inputRenavamTextController?.dispose();

    inputEstadoFocusNode?.dispose();
    inputEstadoTextController?.dispose();

    rodapeModel.dispose();
    topBarModel2.dispose();
    inputCPFXFocusNode?.dispose();
    inputCPFXTextController?.dispose();

    inputCelularXFocusNode?.dispose();
    inputCelularXTextController?.dispose();

    inputEstadoXFocusNode?.dispose();
    inputEstadoXTextController?.dispose();

    inputRenavamXFocusNode?.dispose();
    inputRenavamXTextController?.dispose();

    inputPlacaXFocusNode?.dispose();
    inputPlacaXTextController?.dispose();
  }
}
