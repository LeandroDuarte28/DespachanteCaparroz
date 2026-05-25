// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleStruct extends BaseStruct {
  VehicleStruct({
    String? licensePlate,
    String? ownerDocument,
    String? uf,
    String? ownerName,
    String? renavam,
  })  : _licensePlate = licensePlate,
        _ownerDocument = ownerDocument,
        _uf = uf,
        _ownerName = ownerName,
        _renavam = renavam;

  // "license_plate" field.
  String? _licensePlate;
  String get licensePlate => _licensePlate ?? '';
  set licensePlate(String? val) => _licensePlate = val;

  bool hasLicensePlate() => _licensePlate != null;

  // "owner_document" field.
  String? _ownerDocument;
  String get ownerDocument => _ownerDocument ?? '';
  set ownerDocument(String? val) => _ownerDocument = val;

  bool hasOwnerDocument() => _ownerDocument != null;

  // "uf" field.
  String? _uf;
  String get uf => _uf ?? '';
  set uf(String? val) => _uf = val;

  bool hasUf() => _uf != null;

  // "owner_name" field.
  String? _ownerName;
  String get ownerName => _ownerName ?? '';
  set ownerName(String? val) => _ownerName = val;

  bool hasOwnerName() => _ownerName != null;

  // "renavam" field.
  String? _renavam;
  String get renavam => _renavam ?? '';
  set renavam(String? val) => _renavam = val;

  bool hasRenavam() => _renavam != null;

  static VehicleStruct fromMap(Map<String, dynamic> data) => VehicleStruct(
        licensePlate: data['license_plate'] as String?,
        ownerDocument: data['owner_document'] as String?,
        uf: data['uf'] as String?,
        ownerName: data['owner_name'] as String?,
        renavam: data['renavam'] as String?,
      );

  static VehicleStruct? maybeFromMap(dynamic data) =>
      data is Map ? VehicleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'license_plate': _licensePlate,
        'owner_document': _ownerDocument,
        'uf': _uf,
        'owner_name': _ownerName,
        'renavam': _renavam,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'license_plate': serializeParam(
          _licensePlate,
          ParamType.String,
        ),
        'owner_document': serializeParam(
          _ownerDocument,
          ParamType.String,
        ),
        'uf': serializeParam(
          _uf,
          ParamType.String,
        ),
        'owner_name': serializeParam(
          _ownerName,
          ParamType.String,
        ),
        'renavam': serializeParam(
          _renavam,
          ParamType.String,
        ),
      }.withoutNulls;

  static VehicleStruct fromSerializableMap(Map<String, dynamic> data) =>
      VehicleStruct(
        licensePlate: deserializeParam(
          data['license_plate'],
          ParamType.String,
          false,
        ),
        ownerDocument: deserializeParam(
          data['owner_document'],
          ParamType.String,
          false,
        ),
        uf: deserializeParam(
          data['uf'],
          ParamType.String,
          false,
        ),
        ownerName: deserializeParam(
          data['owner_name'],
          ParamType.String,
          false,
        ),
        renavam: deserializeParam(
          data['renavam'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VehicleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VehicleStruct &&
        licensePlate == other.licensePlate &&
        ownerDocument == other.ownerDocument &&
        uf == other.uf &&
        ownerName == other.ownerName &&
        renavam == other.renavam;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([licensePlate, ownerDocument, uf, ownerName, renavam]);
}

VehicleStruct createVehicleStruct({
  String? licensePlate,
  String? ownerDocument,
  String? uf,
  String? ownerName,
  String? renavam,
}) =>
    VehicleStruct(
      licensePlate: licensePlate,
      ownerDocument: ownerDocument,
      uf: uf,
      ownerName: ownerName,
      renavam: renavam,
    );
