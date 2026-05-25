// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DebitsStruct extends BaseStruct {
  DebitsStruct({
    String? ticketTime,
    String? ticketCounty,
    String? ticketDescription,
    int? value,
    String? ticketDate,
    String? aiip,
    String? guide,
    String? dueDate,
    String? type,
    String? debitId,
    String? ticketAgency,
  })  : _ticketTime = ticketTime,
        _ticketCounty = ticketCounty,
        _ticketDescription = ticketDescription,
        _value = value,
        _ticketDate = ticketDate,
        _aiip = aiip,
        _guide = guide,
        _dueDate = dueDate,
        _type = type,
        _debitId = debitId,
        _ticketAgency = ticketAgency;

  // "ticket_time" field.
  String? _ticketTime;
  String get ticketTime => _ticketTime ?? '';
  set ticketTime(String? val) => _ticketTime = val;

  bool hasTicketTime() => _ticketTime != null;

  // "ticket_county" field.
  String? _ticketCounty;
  String get ticketCounty => _ticketCounty ?? '';
  set ticketCounty(String? val) => _ticketCounty = val;

  bool hasTicketCounty() => _ticketCounty != null;

  // "ticket_description" field.
  String? _ticketDescription;
  String get ticketDescription => _ticketDescription ?? '';
  set ticketDescription(String? val) => _ticketDescription = val;

  bool hasTicketDescription() => _ticketDescription != null;

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  set value(int? val) => _value = val;

  void incrementValue(int amount) => value = value + amount;

  bool hasValue() => _value != null;

  // "ticket_date" field.
  String? _ticketDate;
  String get ticketDate => _ticketDate ?? '';
  set ticketDate(String? val) => _ticketDate = val;

  bool hasTicketDate() => _ticketDate != null;

  // "aiip" field.
  String? _aiip;
  String get aiip => _aiip ?? '';
  set aiip(String? val) => _aiip = val;

  bool hasAiip() => _aiip != null;

  // "guide" field.
  String? _guide;
  String get guide => _guide ?? '';
  set guide(String? val) => _guide = val;

  bool hasGuide() => _guide != null;

  // "due_date" field.
  String? _dueDate;
  String get dueDate => _dueDate ?? '';
  set dueDate(String? val) => _dueDate = val;

  bool hasDueDate() => _dueDate != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "debit_id" field.
  String? _debitId;
  String get debitId => _debitId ?? '';
  set debitId(String? val) => _debitId = val;

  bool hasDebitId() => _debitId != null;

  // "ticket_agency" field.
  String? _ticketAgency;
  String get ticketAgency => _ticketAgency ?? '';
  set ticketAgency(String? val) => _ticketAgency = val;

  bool hasTicketAgency() => _ticketAgency != null;

  static DebitsStruct fromMap(Map<String, dynamic> data) => DebitsStruct(
        ticketTime: data['ticket_time'] as String?,
        ticketCounty: data['ticket_county'] as String?,
        ticketDescription: data['ticket_description'] as String?,
        value: castToType<int>(data['value']),
        ticketDate: data['ticket_date'] as String?,
        aiip: data['aiip'] as String?,
        guide: data['guide'] as String?,
        dueDate: data['due_date'] as String?,
        type: data['type'] as String?,
        debitId: data['debit_id'] as String?,
        ticketAgency: data['ticket_agency'] as String?,
      );

  static DebitsStruct? maybeFromMap(dynamic data) =>
      data is Map ? DebitsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ticket_time': _ticketTime,
        'ticket_county': _ticketCounty,
        'ticket_description': _ticketDescription,
        'value': _value,
        'ticket_date': _ticketDate,
        'aiip': _aiip,
        'guide': _guide,
        'due_date': _dueDate,
        'type': _type,
        'debit_id': _debitId,
        'ticket_agency': _ticketAgency,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ticket_time': serializeParam(
          _ticketTime,
          ParamType.String,
        ),
        'ticket_county': serializeParam(
          _ticketCounty,
          ParamType.String,
        ),
        'ticket_description': serializeParam(
          _ticketDescription,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.int,
        ),
        'ticket_date': serializeParam(
          _ticketDate,
          ParamType.String,
        ),
        'aiip': serializeParam(
          _aiip,
          ParamType.String,
        ),
        'guide': serializeParam(
          _guide,
          ParamType.String,
        ),
        'due_date': serializeParam(
          _dueDate,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'debit_id': serializeParam(
          _debitId,
          ParamType.String,
        ),
        'ticket_agency': serializeParam(
          _ticketAgency,
          ParamType.String,
        ),
      }.withoutNulls;

  static DebitsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DebitsStruct(
        ticketTime: deserializeParam(
          data['ticket_time'],
          ParamType.String,
          false,
        ),
        ticketCounty: deserializeParam(
          data['ticket_county'],
          ParamType.String,
          false,
        ),
        ticketDescription: deserializeParam(
          data['ticket_description'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.int,
          false,
        ),
        ticketDate: deserializeParam(
          data['ticket_date'],
          ParamType.String,
          false,
        ),
        aiip: deserializeParam(
          data['aiip'],
          ParamType.String,
          false,
        ),
        guide: deserializeParam(
          data['guide'],
          ParamType.String,
          false,
        ),
        dueDate: deserializeParam(
          data['due_date'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        debitId: deserializeParam(
          data['debit_id'],
          ParamType.String,
          false,
        ),
        ticketAgency: deserializeParam(
          data['ticket_agency'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DebitsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DebitsStruct &&
        ticketTime == other.ticketTime &&
        ticketCounty == other.ticketCounty &&
        ticketDescription == other.ticketDescription &&
        value == other.value &&
        ticketDate == other.ticketDate &&
        aiip == other.aiip &&
        guide == other.guide &&
        dueDate == other.dueDate &&
        type == other.type &&
        debitId == other.debitId &&
        ticketAgency == other.ticketAgency;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ticketTime,
        ticketCounty,
        ticketDescription,
        value,
        ticketDate,
        aiip,
        guide,
        dueDate,
        type,
        debitId,
        ticketAgency
      ]);
}

DebitsStruct createDebitsStruct({
  String? ticketTime,
  String? ticketCounty,
  String? ticketDescription,
  int? value,
  String? ticketDate,
  String? aiip,
  String? guide,
  String? dueDate,
  String? type,
  String? debitId,
  String? ticketAgency,
}) =>
    DebitsStruct(
      ticketTime: ticketTime,
      ticketCounty: ticketCounty,
      ticketDescription: ticketDescription,
      value: value,
      ticketDate: ticketDate,
      aiip: aiip,
      guide: guide,
      dueDate: dueDate,
      type: type,
      debitId: debitId,
      ticketAgency: ticketAgency,
    );
