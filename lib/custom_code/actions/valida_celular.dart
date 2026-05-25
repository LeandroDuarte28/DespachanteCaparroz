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

// crie uma funcao que recebe uma string e formata no modelo de numero de celular

Future<String> validaCelular(String? celular) async {
  if (celular == null || celular.isEmpty) {
    return 'Número inválido';
  }

  // Remove caracteres não numéricos
  String numero = celular.replaceAll(RegExp(r'[^0-9]'), '');

  // Verifica se o número tem 11 dígitos (incluindo DDD)
  //if (numero.length != 11) {
  //  return 'Número inválido';
  //}

  // Formata o número no modelo (XX) XXXXX-XXXX
  String formatted =
      '(${numero.substring(0, 2)}) ${numero.substring(2, 7)}-${numero.substring(7)}';

  return formatted;
}
