// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_advice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DBAdvice _$$_DBAdviceFromJson(Map<String, dynamic> json) => _$_DBAdvice(
      id: json['id'] as int?,
      adviceText: json['adviceText'] as String? ?? "",
      created: json['created'] as String? ?? "",
      updated: json['updated'] as String? ?? "",
      done: json['done'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DBAdviceToJson(_$_DBAdvice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adviceText': instance.adviceText,
      'created': instance.created,
      'updated': instance.updated,
      'done': instance.done,
    };
