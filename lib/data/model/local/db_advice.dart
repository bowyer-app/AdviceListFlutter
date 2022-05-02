import 'package:freezed_annotation/freezed_annotation.dart';

part 'db_advice.freezed.dart';
part 'db_advice.g.dart';

@freezed
class DBAdvice with _$DBAdvice {
  static const String tableName = "advice";
  static const String keyId = "id";
  static const String keyAdviceText = "adviceText";
  static const String keyCreated = "created";
  static const String keyUpdated = "updated";
  static const String keyDone = "done";
  static const String createTable = '''
    CREATE TABLE $tableName(
      $keyId INTEGER PRIMARY KEY AUTOINCREMENT,
      $keyAdviceText TEXT,
      $keyCreated TEXT,
      $keyUpdated TEXT,
      $keyDone INTEGER
    ) ''';

  @JsonSerializable(explicitToJson: true)
  factory DBAdvice({
    @JsonKey(name: DBAdvice.keyId) int? id,
    @JsonKey(name: DBAdvice.keyAdviceText) @Default("") String adviceText,
    @JsonKey(name: DBAdvice.keyCreated) @Default("") String created,
    @JsonKey(name: DBAdvice.keyUpdated) @Default("") String updated,
    @JsonKey(name: DBAdvice.keyDone) @Default(0) int done,
  }) = _DBAdvice;

  factory DBAdvice.fromJson(Map<String, dynamic> json) =>
      _$DBAdviceFromJson(json);
}
