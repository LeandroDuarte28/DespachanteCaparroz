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

Future<double> valorResta(
  double? total,
  double? sinal,
) async {
  // recebe um parametro do tipo double chamado total e subtrai o parametro double chamado sinal, o resultado restante é retornado do tipo double
  // Verifica se os parâmetros são nulos e retorna 0.0 se forem
  if (total == null || sinal == null) {
    return 0.0;
  }
  // Realiza a subtração e retorna o resultado
  return total - sinal;
}
