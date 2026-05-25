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

// Crie uma função personalizada no FlutterFlow chamada buscarUltimoDigitoPlaca, com dois parâmetros placa (String) e caractereAlvo (String). A função deve localizar a última ocorrência do caractereAlvo na placa. Se for um número (0–9) e o último dígito da placa, retorne a placa completa.
Future<String> buscarUltimoDigitoPlaca(
  String? entradaPlaca,
  String? ultimoCaracter,
) async {
  // Verifica se os parâmetros são nulos ou vazios
  if (entradaPlaca == null || entradaPlaca.isEmpty) {
    return '';
  }

  if (ultimoCaracter == null || ultimoCaracter.isEmpty) {
    return '';
  }

  // Remove espaços em branco da placa
  String placa = entradaPlaca.trim();

  // Verifica se a placa tem pelo menos um caractere
  if (placa.isEmpty) {
    return '';
  }

  // Encontra a última ocorrência do caractere alvo na placa
  int ultimaOcorrencia = placa.lastIndexOf(ultimoCaracter);

  // Se o caractere não foi encontrado, retorna string vazia
  if (ultimaOcorrencia == -1) {
    return '';
  }

  // Verifica se o caractere alvo é um número (0-9)
  bool isNumero = RegExp(r'^[0-9]$').hasMatch(ultimoCaracter);

  // Verifica se a última ocorrência está na última posição da placa
  bool isUltimaPosicao = ultimaOcorrencia == (placa.length - 1);

  // Se é um número E está na última posição, retorna a placa completa
  if (isNumero && isUltimaPosicao) {
    return placa;
  }

  // Caso contrário, retorna string vazia
  return '';
}
