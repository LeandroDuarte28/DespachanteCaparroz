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

Future<String> maxPlaca(String? entradaPlaca) async {
  // crie uma funcao que recebe uma placa e transforme as letras em maiusculas, retornando apenas numeros e letras maiusculas

  if (entradaPlaca == null) {
    return "Placa inválida";
  }

  String placaMaiuscula = entradaPlaca.toUpperCase();
  String placaFormatada = "";

  for (int i = 0; i < placaMaiuscula.length; i++) {
    if (RegExp(r'[A-Z0-9]').hasMatch(placaMaiuscula[i])) {
      placaFormatada += placaMaiuscula[i];
    }
  }

  return placaFormatada;
}
