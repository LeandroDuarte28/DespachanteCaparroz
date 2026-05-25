import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _CodTemporario = '';
  String get CodTemporario => _CodTemporario;
  set CodTemporario(String value) {
    _CodTemporario = value;
  }

  List<DebitsStruct> _Debits = [
    DebitsStruct.fromSerializableMap(jsonDecode(
        '{\"ticket_time\":\"Hello World\",\"ticket_county\":\"Hello World\",\"ticket_description\":\"Hello World\",\"value\":\"0\",\"ticket_date\":\"Hello World\",\"aiip\":\"Hello World\",\"guide\":\"Hello World\",\"due_date\":\"Hello World\",\"type\":\"Hello World\",\"debit_id\":\"Hello World\",\"ticket_agency\":\"Hello World\"}'))
  ];
  List<DebitsStruct> get Debits => _Debits;
  set Debits(List<DebitsStruct> value) {
    _Debits = value;
  }

  void addToDebits(DebitsStruct value) {
    Debits.add(value);
  }

  void removeFromDebits(DebitsStruct value) {
    Debits.remove(value);
  }

  void removeAtIndexFromDebits(int index) {
    Debits.removeAt(index);
  }

  void updateDebitsAtIndex(
    int index,
    DebitsStruct Function(DebitsStruct) updateFn,
  ) {
    Debits[index] = updateFn(_Debits[index]);
  }

  void insertAtIndexInDebits(int index, DebitsStruct value) {
    Debits.insert(index, value);
  }

  List<String> _ResponseDebits = [];
  List<String> get ResponseDebits => _ResponseDebits;
  set ResponseDebits(List<String> value) {
    _ResponseDebits = value;
  }

  void addToResponseDebits(String value) {
    ResponseDebits.add(value);
  }

  void removeFromResponseDebits(String value) {
    ResponseDebits.remove(value);
  }

  void removeAtIndexFromResponseDebits(int index) {
    ResponseDebits.removeAt(index);
  }

  void updateResponseDebitsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ResponseDebits[index] = updateFn(_ResponseDebits[index]);
  }

  void insertAtIndexInResponseDebits(int index, String value) {
    ResponseDebits.insert(index, value);
  }

  String _formattedValue = '';
  String get formattedValue => _formattedValue;
  set formattedValue(String value) {
    _formattedValue = value;
  }

  String _formattedData = '';
  String get formattedData => _formattedData;
  set formattedData(String value) {
    _formattedData = value;
  }

  bool _showListItems = false;
  bool get showListItems => _showListItems;
  set showListItems(bool value) {
    _showListItems = value;
  }

  double _totalValue = 0.0;
  double get totalValue => _totalValue;
  set totalValue(double value) {
    _totalValue = value;
  }

  List<String> _selectedItems = [];
  List<String> get selectedItems => _selectedItems;
  set selectedItems(List<String> value) {
    _selectedItems = value;
  }

  void addToSelectedItems(String value) {
    selectedItems.add(value);
  }

  void removeFromSelectedItems(String value) {
    selectedItems.remove(value);
  }

  void removeAtIndexFromSelectedItems(int index) {
    selectedItems.removeAt(index);
  }

  void updateSelectedItemsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedItems[index] = updateFn(_selectedItems[index]);
  }

  void insertAtIndexInSelectedItems(int index, String value) {
    selectedItems.insert(index, value);
  }

  bool _isCheckedItem1 = false;
  bool get isCheckedItem1 => _isCheckedItem1;
  set isCheckedItem1(bool value) {
    _isCheckedItem1 = value;
  }

  String _debitIDs = '';
  String get debitIDs => _debitIDs;
  set debitIDs(String value) {
    _debitIDs = value;
  }

  String _valor = '';
  String get valor => _valor;
  set valor(String value) {
    _valor = value;
  }

  String _strDebitsIds = '';
  String get strDebitsIds => _strDebitsIds;
  set strDebitsIds(String value) {
    _strDebitsIds = value;
  }

  String _url = '';
  String get url => _url;
  set url(String value) {
    _url = value;
  }

  int _codStatus = 202;
  int get codStatus => _codStatus;
  set codStatus(int value) {
    _codStatus = value;
  }

  int _valInt = 0;
  int get valInt => _valInt;
  set valInt(int value) {
    _valInt = value;
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String _document = '';
  String get document => _document;
  set document(String value) {
    _document = value;
  }

  String _serviceAmount = '';
  String get serviceAmount => _serviceAmount;
  set serviceAmount(String value) {
    _serviceAmount = value;
  }

  String _intermediaryDocument = '';
  String get intermediaryDocument => _intermediaryDocument;
  set intermediaryDocument(String value) {
    _intermediaryDocument = value;
  }

  String _callbackURL = '';
  String get callbackURL => _callbackURL;
  set callbackURL(String value) {
    _callbackURL = value;
  }

  String _redirectURL = '';
  String get redirectURL => _redirectURL;
  set redirectURL(String value) {
    _redirectURL = value;
  }

  dynamic _requestBody;
  dynamic get requestBody => _requestBody;
  set requestBody(dynamic value) {
    _requestBody = value;
  }

  int _valIntServiceAmount = 0;
  int get valIntServiceAmount => _valIntServiceAmount;
  set valIntServiceAmount(int value) {
    _valIntServiceAmount = value;
  }

  String _consultid = '';
  String get consultid => _consultid;
  set consultid(String value) {
    _consultid = value;
  }

  String _status = 'PENDING';
  String get status => _status;
  set status(String value) {
    _status = value;
  }

  String _statusRetorno = '';
  String get statusRetorno => _statusRetorno;
  set statusRetorno(String value) {
    _statusRetorno = value;
  }

  String _valorString = '';
  String get valorString => _valorString;
  set valorString(String value) {
    _valorString = value;
  }

  /// Controla a visualização do grid no backoffice
  bool _Consult = false;
  bool get Consult => _Consult;
  set Consult(bool value) {
    _Consult = value;
  }

  /// Verifica se está logado, se tiver habilita controles da tela, caso
  /// contrário inativa.
  ///
  /// Tela de backoffice
  bool _logged = false;
  bool get logged => _logged;
  set logged(bool value) {
    _logged = value;
  }

  bool _confirmSenha = false;
  bool get confirmSenha => _confirmSenha;
  set confirmSenha(bool value) {
    _confirmSenha = value;
  }

  bool _btAlterar = false;
  bool get btAlterar => _btAlterar;
  set btAlterar(bool value) {
    _btAlterar = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varNome = '';
  String get varNome => _varNome;
  set varNome(String value) {
    _varNome = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varPlaca = '';
  String get varPlaca => _varPlaca;
  set varPlaca(String value) {
    _varPlaca = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varRenavam = '';
  String get varRenavam => _varRenavam;
  set varRenavam(String value) {
    _varRenavam = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varServico = '';
  String get varServico => _varServico;
  set varServico(String value) {
    _varServico = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varValor = '';
  String get varValor => _varValor;
  set varValor(String value) {
    _varValor = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varValorSinal = '';
  String get varValorSinal => _varValorSinal;
  set varValorSinal(String value) {
    _varValorSinal = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varEmail = '';
  String get varEmail => _varEmail;
  set varEmail(String value) {
    _varEmail = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varObservacao = '';
  String get varObservacao => _varObservacao;
  set varObservacao(String value) {
    _varObservacao = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varCNPJ = '';
  String get varCNPJ => _varCNPJ;
  set varCNPJ(String value) {
    _varCNPJ = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varCelular = '';
  String get varCelular => _varCelular;
  set varCelular(String value) {
    _varCelular = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varUF = '';
  String get varUF => _varUF;
  set varUF(String value) {
    _varUF = value;
  }

  /// Resultado Grid para carregar campos na Tela de BackOffice
  String _varValorResta = '';
  String get varValorResta => _varValorResta;
  set varValorResta(String value) {
    _varValorResta = value;
  }

  /// Variavel com a cor em hexadecimal para controle do widget
  Color _color = Colors.transparent;
  Color get color => _color;
  set color(Color value) {
    _color = value;
  }

  bool _btCadastra = true;
  bool get btCadastra => _btCadastra;
  set btCadastra(bool value) {
    _btCadastra = value;
  }

  bool _btLimpar = false;
  bool get btLimpar => _btLimpar;
  set btLimpar(bool value) {
    _btLimpar = value;
  }

  double _doubleValor = 0.0;
  double get doubleValor => _doubleValor;
  set doubleValor(double value) {
    _doubleValor = value;
  }

  double _doubleValorSinal = 0.0;
  double get doubleValorSinal => _doubleValorSinal;
  set doubleValorSinal(double value) {
    _doubleValorSinal = value;
  }

  double _doubleValorResta = 0.0;
  double get doubleValorResta => _doubleValorResta;
  set doubleValorResta(double value) {
    _doubleValorResta = value;
  }

  int _qtDebitos = 0;
  int get qtDebitos => _qtDebitos;
  set qtDebitos(int value) {
    _qtDebitos = value;
  }

  Color _corFonte = Color(4278224964);
  Color get corFonte => _corFonte;
  set corFonte(Color value) {
    _corFonte = value;
  }

  String _textoHomeCaracterEspecial = '';
  String get textoHomeCaracterEspecial => _textoHomeCaracterEspecial;
  set textoHomeCaracterEspecial(String value) {
    _textoHomeCaracterEspecial = value;
  }
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
