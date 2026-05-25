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

// recebe um parametro de valor, formata e retorna o valor formatado em String. Exemplos: Recebe 12345, devolve R$ 123,45. Recebe 4567, devolve R$ 45,67. Recebe 123456, devolve R$ 1234,56
import 'package:intl/intl.dart';

Future<String> valorStringFormatado(String? valorString) async {
  if (valorString == null || valorString.isEmpty) {
    return 'R\$ 0,00';
  }

  // Remove any non-numeric characters
  String numericOnly = valorString.replaceAll(RegExp(r'[^0-9]'), '');

  if (numericOnly.isEmpty) {
    return 'R\$ 0,00';
  }

  // Convert to integer (representing cents)
  int valueInCents = int.tryParse(numericOnly) ?? 0;

  // Convert cents to reais (divide by 100)
  double valueInReais = valueInCents / 100.0;

  // Format using NumberFormat for Brazilian currency
  final formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  return formatter.format(valueInReais);
}
