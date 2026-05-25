// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DebitosVeicularesStruct extends BaseStruct {
  DebitosVeicularesStruct({
    FlagsStruct? flags,
    List<DebitsStruct>? debits,
    String? consultId,
    VehicleStruct? vehicle,
    List<String>? warnings,
    String? fetchedAt,
    String? status,
  })  : _flags = flags,
        _debits = debits,
        _consultId = consultId,
        _vehicle = vehicle,
        _warnings = warnings,
        _fetchedAt = fetchedAt,
        _status = status;

  // "flags" field.
  FlagsStruct? _flags;
  FlagsStruct get flags => _flags ?? FlagsStruct();
  set flags(FlagsStruct? val) => _flags = val;

  void updateFlags(Function(FlagsStruct) updateFn) {
    updateFn(_flags ??= FlagsStruct());
  }

  bool hasFlags() => _flags != null;

  // "debits" field.
  List<DebitsStruct>? _debits;
  List<DebitsStruct> get debits => _debits ?? const [];
  set debits(List<DebitsStruct>? val) => _debits = val;

  void updateDebits(Function(List<DebitsStruct>) updateFn) {
    updateFn(_debits ??= []);
  }

  bool hasDebits() => _debits != null;

  // "consult_id" field.
  String? _consultId;
  String get consultId => _consultId ?? '';
  set consultId(String? val) => _consultId = val;

  bool hasConsultId() => _consultId != null;

  // "vehicle" field.
  VehicleStruct? _vehicle;
  VehicleStruct get vehicle => _vehicle ?? VehicleStruct();
  set vehicle(VehicleStruct? val) => _vehicle = val;

  void updateVehicle(Function(VehicleStruct) updateFn) {
    updateFn(_vehicle ??= VehicleStruct());
  }

  bool hasVehicle() => _vehicle != null;

  // "warnings" field.
  List<String>? _warnings;
  List<String> get warnings => _warnings ?? const [];
  set warnings(List<String>? val) => _warnings = val;

  void updateWarnings(Function(List<String>) updateFn) {
    updateFn(_warnings ??= []);
  }

  bool hasWarnings() => _warnings != null;

  // "fetched_at" field.
  String? _fetchedAt;
  String get fetchedAt => _fetchedAt ?? '';
  set fetchedAt(String? val) => _fetchedAt = val;

  bool hasFetchedAt() => _fetchedAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static DebitosVeicularesStruct fromMap(Map<String, dynamic> data) =>
      DebitosVeicularesStruct(
        flags: data['flags'] is FlagsStruct
            ? data['flags']
            : FlagsStruct.maybeFromMap(data['flags']),
        debits: getStructList(
          data['debits'],
          DebitsStruct.fromMap,
        ),
        consultId: data['consult_id'] as String?,
        vehicle: data['vehicle'] is VehicleStruct
            ? data['vehicle']
            : VehicleStruct.maybeFromMap(data['vehicle']),
        warnings: getDataList(data['warnings']),
        fetchedAt: data['fetched_at'] as String?,
        status: data['status'] as String?,
      );

  static DebitosVeicularesStruct? maybeFromMap(dynamic data) => data is Map
      ? DebitosVeicularesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'flags': _flags?.toMap(),
        'debits': _debits?.map((e) => e.toMap()).toList(),
        'consult_id': _consultId,
        'vehicle': _vehicle?.toMap(),
        'warnings': _warnings,
        'fetched_at': _fetchedAt,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'flags': serializeParam(
          _flags,
          ParamType.DataStruct,
        ),
        'debits': serializeParam(
          _debits,
          ParamType.DataStruct,
          isList: true,
        ),
        'consult_id': serializeParam(
          _consultId,
          ParamType.String,
        ),
        'vehicle': serializeParam(
          _vehicle,
          ParamType.DataStruct,
        ),
        'warnings': serializeParam(
          _warnings,
          ParamType.String,
          isList: true,
        ),
        'fetched_at': serializeParam(
          _fetchedAt,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static DebitosVeicularesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DebitosVeicularesStruct(
        flags: deserializeStructParam(
          data['flags'],
          ParamType.DataStruct,
          false,
          structBuilder: FlagsStruct.fromSerializableMap,
        ),
        debits: deserializeStructParam<DebitsStruct>(
          data['debits'],
          ParamType.DataStruct,
          true,
          structBuilder: DebitsStruct.fromSerializableMap,
        ),
        consultId: deserializeParam(
          data['consult_id'],
          ParamType.String,
          false,
        ),
        vehicle: deserializeStructParam(
          data['vehicle'],
          ParamType.DataStruct,
          false,
          structBuilder: VehicleStruct.fromSerializableMap,
        ),
        warnings: deserializeParam<String>(
          data['warnings'],
          ParamType.String,
          true,
        ),
        fetchedAt: deserializeParam(
          data['fetched_at'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DebitosVeicularesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DebitosVeicularesStruct &&
        flags == other.flags &&
        listEquality.equals(debits, other.debits) &&
        consultId == other.consultId &&
        vehicle == other.vehicle &&
        listEquality.equals(warnings, other.warnings) &&
        fetchedAt == other.fetchedAt &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([flags, debits, consultId, vehicle, warnings, fetchedAt, status]);
}

DebitosVeicularesStruct createDebitosVeicularesStruct({
  FlagsStruct? flags,
  String? consultId,
  VehicleStruct? vehicle,
  String? fetchedAt,
  String? status,
}) =>
    DebitosVeicularesStruct(
      flags: flags ?? FlagsStruct(),
      consultId: consultId,
      vehicle: vehicle ?? VehicleStruct(),
      fetchedAt: fetchedAt,
      status: status,
    );
