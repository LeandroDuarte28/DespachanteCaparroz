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

Future<double> removeCaracteresConvDouble(String? entrada) async {
  if (entrada == null || entrada.isEmpty) {
    return 0.0;
  }

  // Remove todos os caracteres que não são dígitos, mantendo apenas números
  String numerosApenas = entrada.replaceAll(RegExp(r'[^0-9]'), '');

  // Se não restou nenhum número, retorna 0.0
  if (numerosApenas.isEmpty) {
    return 0.0;
  }

  // Converte para double
  try {
    return double.parse(numerosApenas);
  } catch (e) {
    // Em caso de erro na conversão, retorna 0.0
    return 0.0;
  }
}
