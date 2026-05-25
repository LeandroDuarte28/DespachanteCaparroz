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

Future<String> maiusculo(String? uf) async {
  // crie uma funcao que recebe uma string uf por parametro, verifica se é uma uf valida e retorna a string convertida para maiuscula

  // Lista de UFs válidas
  List<String> ufsValidas = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];

  // Verifica se a uf é válida e retorna em maiúsculas
  if (uf != null && ufsValidas.contains(uf.toUpperCase())) {
    return uf.toUpperCase();
  } else {
    throw Exception('UF inválida');
  }
}
