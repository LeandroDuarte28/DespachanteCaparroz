// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlagsStruct extends BaseStruct {
  FlagsStruct({
    bool? tooManyTickets,
    bool? activeDebt,
    bool? hasRenainfDebits,
    bool? licensingBlocked,
  })  : _tooManyTickets = tooManyTickets,
        _activeDebt = activeDebt,
        _hasRenainfDebits = hasRenainfDebits,
        _licensingBlocked = licensingBlocked;

  // "too_many_tickets" field.
  bool? _tooManyTickets;
  bool get tooManyTickets => _tooManyTickets ?? false;
  set tooManyTickets(bool? val) => _tooManyTickets = val;

  bool hasTooManyTickets() => _tooManyTickets != null;

  // "active_debt" field.
  bool? _activeDebt;
  bool get activeDebt => _activeDebt ?? false;
  set activeDebt(bool? val) => _activeDebt = val;

  bool hasActiveDebt() => _activeDebt != null;

  // "has_renainf_debits" field.
  bool? _hasRenainfDebits;
  bool get hasRenainfDebits => _hasRenainfDebits ?? false;
  set hasRenainfDebits(bool? val) => _hasRenainfDebits = val;

  bool hasHasRenainfDebits() => _hasRenainfDebits != null;

  // "licensing_blocked" field.
  bool? _licensingBlocked;
  bool get licensingBlocked => _licensingBlocked ?? false;
  set licensingBlocked(bool? val) => _licensingBlocked = val;

  bool hasLicensingBlocked() => _licensingBlocked != null;

  static FlagsStruct fromMap(Map<String, dynamic> data) => FlagsStruct(
        tooManyTickets: data['too_many_tickets'] as bool?,
        activeDebt: data['active_debt'] as bool?,
        hasRenainfDebits: data['has_renainf_debits'] as bool?,
        licensingBlocked: data['licensing_blocked'] as bool?,
      );

  static FlagsStruct? maybeFromMap(dynamic data) =>
      data is Map ? FlagsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'too_many_tickets': _tooManyTickets,
        'active_debt': _activeDebt,
        'has_renainf_debits': _hasRenainfDebits,
        'licensing_blocked': _licensingBlocked,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'too_many_tickets': serializeParam(
          _tooManyTickets,
          ParamType.bool,
        ),
        'active_debt': serializeParam(
          _activeDebt,
          ParamType.bool,
        ),
        'has_renainf_debits': serializeParam(
          _hasRenainfDebits,
          ParamType.bool,
        ),
        'licensing_blocked': serializeParam(
          _licensingBlocked,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FlagsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FlagsStruct(
        tooManyTickets: deserializeParam(
          data['too_many_tickets'],
          ParamType.bool,
          false,
        ),
        activeDebt: deserializeParam(
          data['active_debt'],
          ParamType.bool,
          false,
        ),
        hasRenainfDebits: deserializeParam(
          data['has_renainf_debits'],
          ParamType.bool,
          false,
        ),
        licensingBlocked: deserializeParam(
          data['licensing_blocked'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FlagsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlagsStruct &&
        tooManyTickets == other.tooManyTickets &&
        activeDebt == other.activeDebt &&
        hasRenainfDebits == other.hasRenainfDebits &&
        licensingBlocked == other.licensingBlocked;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([tooManyTickets, activeDebt, hasRenainfDebits, licensingBlocked]);
}

FlagsStruct createFlagsStruct({
  bool? tooManyTickets,
  bool? activeDebt,
  bool? hasRenainfDebits,
  bool? licensingBlocked,
}) =>
    FlagsStruct(
      tooManyTickets: tooManyTickets,
      activeDebt: activeDebt,
      hasRenainfDebits: hasRenainfDebits,
      licensingBlocked: licensingBlocked,
    );
