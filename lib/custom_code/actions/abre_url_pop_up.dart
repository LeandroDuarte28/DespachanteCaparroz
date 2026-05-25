// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// crie uma custom action que use javascript e recebe uma url e abre a url burlando o bloqueador de pop up
import 'dart:js' as js;

Future abreUrlPopUp(String? urlX) async {
  if (urlX == null || urlX.isEmpty) {
    return;
  }

  try {
    js.context.callMethod('eval', ["window.location.href = '$urlX';"]);
  } catch (e) {
    print('Error redirecting to URL: $e');
  }
}
