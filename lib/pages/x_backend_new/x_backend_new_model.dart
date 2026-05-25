import '/backend/api_requests/api_calls.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'x_backend_new_widget.dart' show XBackendNewWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class XBackendNewModel extends FlutterFlowModel<XBackendNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;
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
  String? inputEstadoValue;
  FormFieldController<String>? inputEstadoValueController;
  // Stores action output result for [Backend Call - API (ConsultaHash)] action in Button widget.
  ApiCallResponse? hash;
  // Stores action output result for [Backend Call - API (ConsultaDebitos)] action in Button widget.
  ApiCallResponse? debitos;
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;
  int get tabBarPreviousIndex1 =>
      tabBarController1 != null ? tabBarController1!.previousIndex : 0;

  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;
  int get tabBarPreviousIndex2 =>
      tabBarController2 != null ? tabBarController2!.previousIndex : 0;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    inputCelularFocusNode?.dispose();
    inputCelularTextController?.dispose();

    inputCPFFocusNode?.dispose();
    inputCPFTextController?.dispose();

    inputPlacaFocusNode?.dispose();
    inputPlacaTextController?.dispose();

    inputRenavamFocusNode?.dispose();
    inputRenavamTextController?.dispose();

    tabBarController1?.dispose();
    tabBarController2?.dispose();
  }
}
