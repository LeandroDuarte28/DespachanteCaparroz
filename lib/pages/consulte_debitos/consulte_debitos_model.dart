import '/components/consulta_debitos_sem_login_widget.dart';
import '/components/rodape_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'consulte_debitos_widget.dart' show ConsulteDebitosWidget;
import 'package:flutter/material.dart';

class ConsulteDebitosModel extends FlutterFlowModel<ConsulteDebitosWidget> {
  late TopBarModel topBarModel;
  late ConsultaDebitosSemLoginModel consultaDebitosSemLoginModel1;
  late RodapeModel rodapeModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    consultaDebitosSemLoginModel1 =
        createModel(context, () => ConsultaDebitosSemLoginModel());
    rodapeModel = createModel(context, () => RodapeModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    consultaDebitosSemLoginModel1.dispose();
    rodapeModel.dispose();
  }
}
