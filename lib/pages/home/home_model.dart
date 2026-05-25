import '/components/consulta_debitos_sem_login_widget.dart';
import '/components/rodape_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'home_widget.dart' show HomeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;
  // Model for ConsultaDebitosSemLogin component.
  late ConsultaDebitosSemLoginModel consultaDebitosSemLoginModel1;
  // Model for ConsultaDebitosSemLogin component.
  late ConsultaDebitosSemLoginModel consultaDebitosSemLoginModel2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for RatingBar widget.
  double? ratingBarValue4;
  // State field(s) for RatingBar widget.
  double? ratingBarValue5;
  // Model for Rodape component.
  late RodapeModel rodapeModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    consultaDebitosSemLoginModel1 =
        createModel(context, () => ConsultaDebitosSemLoginModel());
    consultaDebitosSemLoginModel2 =
        createModel(context, () => ConsultaDebitosSemLoginModel());
    rodapeModel = createModel(context, () => RodapeModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    consultaDebitosSemLoginModel1.dispose();
    consultaDebitosSemLoginModel2.dispose();
    rodapeModel.dispose();
  }
}
