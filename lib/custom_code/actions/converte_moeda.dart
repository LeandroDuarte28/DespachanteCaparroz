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

Future<double> converteMoeda(String? valor) async {
  // crie uma funcao que recebe um valor do tuipo string como parametro e converta para moeda com duas casas decimeis e retorne ese valor do tipo moeda

  if (valor == null || valor.isEmpty) {
    return 0.0; // Retorna 0.0 se o valor for nulo ou vazio
  }

  // Remove caracteres não numéricos e converte para double
  double numero =
      double.tryParse(valor.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0;

  // Formata o número para duas casas decimais
  return double.parse(numero.toStringAsFixed(2));
}
