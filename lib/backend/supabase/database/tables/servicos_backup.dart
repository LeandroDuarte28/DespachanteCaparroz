import '../database.dart';

class ServicosBackupTable extends SupabaseTable<ServicosBackupRow> {
  @override
  String get tableName => 'servicos_backup';

  @override
  ServicosBackupRow createRow(Map<String, dynamic> data) =>
      ServicosBackupRow(data);
}

class ServicosBackupRow extends SupabaseDataRow {
  ServicosBackupRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServicosBackupTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get cpfCnpj => getField<String>('cpf_cnpj');
  set cpfCnpj(String? value) => setField<String>('cpf_cnpj', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get placa => getField<String>('placa');
  set placa(String? value) => setField<String>('placa', value);

  String? get renavam => getField<String>('renavam');
  set renavam(String? value) => setField<String>('renavam', value);

  String? get uf => getField<String>('uf');
  set uf(String? value) => setField<String>('uf', value);

  String? get servico => getField<String>('servico');
  set servico(String? value) => setField<String>('servico', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  DateTime? get dataServico => getField<DateTime>('dataServico');
  set dataServico(DateTime? value) => setField<DateTime>('dataServico', value);

  String? get celular => getField<String>('celular');
  set celular(String? value) => setField<String>('celular', value);

  String? get userAuth => getField<String>('user_auth');
  set userAuth(String? value) => setField<String>('user_auth', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  String? get observacoes => getField<String>('observacoes');
  set observacoes(String? value) => setField<String>('observacoes', value);

  double? get valorSinal => getField<double>('valorSinal');
  set valorSinal(double? value) => setField<double>('valorSinal', value);

  double? get valorResta => getField<double>('valorResta');
  set valorResta(double? value) => setField<double>('valorResta', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);
}
