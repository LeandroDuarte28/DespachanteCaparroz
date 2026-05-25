import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? real(String? texto) {
// Verifica se a string recebida é válida
  if (texto == null || texto.isEmpty) {
    return null;
  }

  try {
    // Converte a string para um número inteiro
    int value = int.parse(texto);

    // Divide por 100 para obter o valor com centavos
    double amount = value / 100.0;

    // Formata o número no padrão de moeda brasileira
    var NumberFormat;
    var formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    // Retorna o valor formatado
    return formatter.format(amount);
  } catch (e) {
    // Retorna nulo caso a conversão falhe
    return null;
  }
}

String? dataBRZ(String? valor) {
  // flutterflow está apresentando erro ao converter a data, como resolvo? Type: InvalidType  The function 'DateFormat' isn't defined. Try importing the library that defines 'DateFormat', correcting the name to the name of an existing function, or defining a function named 'DateFormat'
  if (valor == null || valor.isEmpty) {
    return null;
  }

  final date = DateTime.tryParse(valor);
  if (date == null) {
    return null;
  }

  final formatter = DateFormat('dd/MM/yyyy');
  return formatter.format(date);
}

List<String> getCheckedDebitIds(String? checkboxCheckedItems) {
  // crie esta função: List<String> getCheckedDebitIds(List<Map<String, dynamic>> checkboxCheckedItems) {   // Filtra a lista para pegar apenas os debit_id de cada item   return checkboxCheckedItems.map((item) => item['debit_id'].toString()).toList(); }
  // Filtra a lista para pegar apenas os debit_id de cada item
  var checkboxCheckedItems;
  return checkboxCheckedItems
      .map((item) => item['debit_id'].toString())
      .toList();
}

String? concatenaStrings(
  String? var1,
  String? var2,
) {
  // Verifica se os valores são nulos
  if (var1 == null || var2 == null) {
    return null;
  }

  // Divide a string existente em uma lista, utilizando a vírgula e removendo espaços extras
  List<String> stringsList =
      var1.isNotEmpty ? var1.split(',').map((s) => s.trim()).toList() : [];

  // Alterna a presença da nova string na lista
  if (!stringsList.contains(var2)) {
    stringsList.add(var2); // Adiciona se não existir
  } else {
    stringsList.remove(var2); // Remove se já existir
  }

  // Junta a lista em uma string com vírgulas e garante que não há espaços extras
  return stringsList.join(',');
}

String? somaValoresDebitos(
  String? varE1,
  String? varE2,
) {
  // Crie uma função que receba dois valores string e realize a soma e retorne um string. Caso não seja informado um dos valores, considere como zero.
  // String valor1 = '10';
  // String valor2 = '20';

  String valor1 = varE1!;
  String valor2 = varE2!;

  int num1 = int.tryParse(valor1) ?? 0;
  int num2 = int.tryParse(valor2) ?? 0;

  int resultado = num1 + num2;

  return resultado.toString();
}

String? removeString(
  String? valA,
  String? valB,
) {
  // Verifica se as strings são válidas
  if (valA == null || valB == null) {
    return null;
  }

  // Divide `valB` em partes separadas por vírgulas
  List<String> parts = valB.split(',');

  // Remove espaços extras ao redor das strings
  parts = parts.map((e) => e.trim()).toList();

  // Verifica se `valA` está presente
  if (parts.contains(valA)) {
    int index = parts.indexOf(valA);

    // Remove a string `valA`
    parts.removeAt(index);

    // Remove a vírgula anterior ou posterior, conforme necessário
    if (index > 0) {
      // Caso não seja o primeiro elemento, remove a vírgula anterior
      // (essa lógica é implícita pela separação ao juntar os elementos com vírgulas depois).
    } else if (index == 0 && parts.isNotEmpty) {
      // Se `valA` for o primeiro elemento, ajusta a lista
      parts[0] = parts[0].trim(); // Garante que não há espaço inicial
    }
  }

  // Retorna a string ajustada, unindo as partes com vírgulas
  return parts.join(', ');
}

String? subtraiValoresDebitos(
  String? valSubA,
  String? valSubB,
) {
  // crie uma função que receba dois valores em string, compare as duas strings e subtraia o valor da menor na maior e retorne o resultado
  int subtractStrings(String str1, String str2) {
    int num1 = int.parse(str1);
    int num2 = int.parse(str2);

    if (num1 > num2) {
      return num1 - num2;
    } else {
      return num2 - num1;
    }
  }

  return subtractStrings(valSubA!, valSubB!).toString();
}

String? trataString(String? valStr) {
  // Crie uma função que recebe uma string e remova todos os espaços no inicio da string e no fim. Em seguida, substitua todas as virgulas por um espaço e depois substitua os espaços por virgula. Ao final retorne a String
  String? customFunction(String input) {
    String trimmedString = input.trim();
    String replacedCommas = trimmedString.replaceAll(',', ' ');
    String replacedSpaces = replacedCommas.replaceAll(' ', ',');
    return replacedSpaces;
  }

  // Test the function
  String input = valStr!;
  String result = customFunction(input)!;
  print(result); // Output: hello world
}

String? trocaVirgula(String? entrada) {
  // crie uma função que receba uma string, em seguida que seja lido o conteudo, e substituidos os espaços por virgulas, e por fim retornada a string completa
  if (entrada == null) {
    return null;
  }

  String resultado = entrada.replaceAll(' ', ',');
  return resultado;
}

String? fnTrataString(String? entr) {
  // crie uma função que recebe uma string e que seja verificada e removidos espaços que estiverem entre o primeiro e ultimo caractere. Caso seja encontrado mais de um espaço sequencial dentro da string, deverá ser substituido por uma virgula. Esta função deve retornar uma string com estas alterações
  String? customFunction(String input) {
    // Remove leading and trailing spaces
    input = input.trim();

    // Replace multiple spaces with a comma
    input = input.replaceAll(RegExp(r'\s{2,}'), ',');

    return input;
  }

  // Test the function
  //print(customFunction("  Hello   World  ")); // Output: Hello,World
}

String? abreURL(String? url) {
  // crie uma função que recebe uma url e abre no browser a url
  if (url != null && url.isNotEmpty) {
    // Open the URL in the browser
    return url;
  } else {
    return null;
  }
}

String? removeDominio(String? link) {
  // crie uma função que recebe uma string com nome de link e que esta função remova o texto 'despachante grazeffi.' dentro da string link. Ao final retorne a string restante
  if (link != null) {
    return link.replaceFirst('despachante grazeffi.', '');
  }
  return null;
}

String? converteInt(String? retornoInt) {
  // crie uma função que recebe um numero string e devolve um numero inteiro
  if (retornoInt != null) {
    return int.tryParse(retornoInt)?.toString();
  }
  return null;
}

String? somaDoisValores(
  String? valEntr,
  String? valEntr2,
) {
  // crie uma função que recebem dois valores numericos em String, some e retorne o valor em string
  if (valEntr == null || valEntr2 == null) {
    return null;
  }

  try {
    int num1 = int.parse(valEntr);
    int num2 = int.parse(valEntr2);
    int sum = num1 + num2;
    return sum.toString();
  } catch (e) {
    return null;
  }
}

int? somaDoisValoresDevolvInt(
  String? input1,
  String? input2,
) {
  // crie uma função que recebe 2 valores string e sejam somados. O retorno deverá ser convertido para inteiro
  if (input1 == null || input2 == null) {
    return null;
  }

  int value1 = int.tryParse(input1) ?? 0;
  int value2 = int.tryParse(input2) ?? 0;

  return value1 + value2;
}

String? aspas(String? arg01) {
  // crie uma funcao que coloque aspas antes do primeiro caracter e depois do ultimo caracter, alem de aspas antes das virgulas e depois das virgulas da string fornecida. Ao final faça o retorno
  if (arg01 == null) {
    return null;
  }

  String result =
      arg01.replaceAllMapped(RegExp(r'[^\s,][^,]*[^\s,]|[^,]'), (match) {
    return "'${match.group(0)}'";
  });

  return result;
}

String? aspasDuplas(String? arg2) {
  // crie uma funcao que coloque aspas duplas antes do primeiro caracter e depois do ultimo caracter, alem de aspas duplas antes das virgulas e depois das virgulas da string fornecida. Ao final faça o retorno
  if (arg2 == null) {
    return null;
  }

  //String result = '"';
  String result = '';
  result += arg2.replaceAll(',', '","');
  //result += '"';
  return result;
}

int? converteParaInteiro(String? entra) {
  // crie uma função que recebe um numero do tipo string e devolve um inteiro
  if (entra == null) {
    return null;
  }

  try {
    return int.parse(entra);
  } catch (e) {
    return null;
  }
}

String? colchetes(String? arg01) {
  // crie uma função que receba uma string e inclua antes do primeiro caractere um [" e ao final da string um "], e retorne a string completa
  if (arg01 == null) {
    return null;
  }
  return '["$arg01"]';
}

String? maximizaPlaca(String? strPlaca) {
  // crie uma função que receba uma string que representa uma placa  e transforme em caracteres maiusculo, retornando a string apenas com numeros e letras
  if (strPlaca == null) {
    return null;
  }

  String result = '';
  for (int i = 0; i < strPlaca.length; i++) {
    if (strPlaca[i].toUpperCase() != strPlaca[i].toLowerCase()) {
      result += strPlaca[i].toUpperCase();
    } else if (RegExp(r'[0-9]').hasMatch(strPlaca[i])) {
      result += strPlaca[i];
    }
  }

  return result;
}

String? converteDoubleReal(double? valor) {
  // recebe um parametro e verifica se não é nulo e converte para real, retornando valor na moeda brasileira em R$ com duas casas decimais depois da virgula
  if (valor == null) return null; // Verifica se o valor é nulo
  return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}'; // Converte para formato brasileiro
}

bool? verificaDataVencida(DateTime? data) {
  // recebe uma data e verifica se esta a mais de 365 dias. Se sim, retorna true, caso contrário retorna false
  if (data == null) return null; // Check for null input
  return DateTime.now().difference(data).inDays >
      365; // Check if more than 365 days have passed
}

String? formataValor(String? recebeValor) {
  // recebe uma string com numeros e formata em valor no formato brasileiro, retornando  o valor formatado. Esta string recebida os dois ultimos numeros são centavos separados por virgula. Não complemente com nenhum numero ou zero, utilize a string recebida Exemplo: 12345 ficaria R$ 123.45
  if (recebeValor == null || recebeValor.isEmpty) return null;

  // Remove any non-digit characters
  String sanitizedValue = recebeValor.replaceAll(RegExp(r'[^0-9]'), '');

  // Ensure the string has at least 2 digits for cents
  if (sanitizedValue.length < 2) {
    sanitizedValue = sanitizedValue.padLeft(2, '0');
  }

  // Split the string into whole and fractional parts
  String wholePart = sanitizedValue.substring(0, sanitizedValue.length - 2);
  String fractionalPart = sanitizedValue.substring(sanitizedValue.length - 2);

  // Format the whole part with thousand separators
  String formattedWholePart =
      NumberFormat('#,##0', 'pt_BR').format(int.parse(wholePart));

  // Combine whole and fractional parts
  return 'R\$ $formattedWholePart,$fractionalPart';
}

bool? validaRSSinal(String? entrada) {
  // Crie uma Custom Function em Dart chamada containsRS. Ela deve receber uma string como parâmetro e retornar true se o texto contiver a substring 'R$' em qualquer posição. Caso contrário, retorna false. A função deve ser segura, tratar nulos e funcionar com strings vazias. Código limpo, direto e funcional
  bool validaRSSinal(String? entrada) {
    if (entrada == null || entrada.isEmpty) {
      return false;
    }
    return entrada.contains('R\$');
  }
}
