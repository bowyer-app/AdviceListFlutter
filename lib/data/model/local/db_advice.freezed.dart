// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'db_advice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DBAdvice _$DBAdviceFromJson(Map<String, dynamic> json) {
  return _DBAdvice.fromJson(json);
}

/// @nodoc
class _$DBAdviceTearOff {
  const _$DBAdviceTearOff();

  _DBAdvice call(
      {@JsonKey(name: DBAdvice.keyId) int? id,
      @JsonKey(name: DBAdvice.keyAdviceText) String adviceText = "",
      @JsonKey(name: DBAdvice.keyCreated) String created = "",
      @JsonKey(name: DBAdvice.keyUpdated) String updated = "",
      @JsonKey(name: DBAdvice.keyDone) int done = 0}) {
    return _DBAdvice(
      id: id,
      adviceText: adviceText,
      created: created,
      updated: updated,
      done: done,
    );
  }

  DBAdvice fromJson(Map<String, Object?> json) {
    return DBAdvice.fromJson(json);
  }
}

/// @nodoc
const $DBAdvice = _$DBAdviceTearOff();

/// @nodoc
mixin _$DBAdvice {
  @JsonKey(name: DBAdvice.keyId)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: DBAdvice.keyAdviceText)
  String get adviceText => throw _privateConstructorUsedError;
  @JsonKey(name: DBAdvice.keyCreated)
  String get created => throw _privateConstructorUsedError;
  @JsonKey(name: DBAdvice.keyUpdated)
  String get updated => throw _privateConstructorUsedError;
  @JsonKey(name: DBAdvice.keyDone)
  int get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DBAdviceCopyWith<DBAdvice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DBAdviceCopyWith<$Res> {
  factory $DBAdviceCopyWith(DBAdvice value, $Res Function(DBAdvice) then) =
      _$DBAdviceCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: DBAdvice.keyId) int? id,
      @JsonKey(name: DBAdvice.keyAdviceText) String adviceText,
      @JsonKey(name: DBAdvice.keyCreated) String created,
      @JsonKey(name: DBAdvice.keyUpdated) String updated,
      @JsonKey(name: DBAdvice.keyDone) int done});
}

/// @nodoc
class _$DBAdviceCopyWithImpl<$Res> implements $DBAdviceCopyWith<$Res> {
  _$DBAdviceCopyWithImpl(this._value, this._then);

  final DBAdvice _value;
  // ignore: unused_field
  final $Res Function(DBAdvice) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? adviceText = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? done = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      adviceText: adviceText == freezed
          ? _value.adviceText
          : adviceText // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DBAdviceCopyWith<$Res> implements $DBAdviceCopyWith<$Res> {
  factory _$DBAdviceCopyWith(_DBAdvice value, $Res Function(_DBAdvice) then) =
      __$DBAdviceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: DBAdvice.keyId) int? id,
      @JsonKey(name: DBAdvice.keyAdviceText) String adviceText,
      @JsonKey(name: DBAdvice.keyCreated) String created,
      @JsonKey(name: DBAdvice.keyUpdated) String updated,
      @JsonKey(name: DBAdvice.keyDone) int done});
}

/// @nodoc
class __$DBAdviceCopyWithImpl<$Res> extends _$DBAdviceCopyWithImpl<$Res>
    implements _$DBAdviceCopyWith<$Res> {
  __$DBAdviceCopyWithImpl(_DBAdvice _value, $Res Function(_DBAdvice) _then)
      : super(_value, (v) => _then(v as _DBAdvice));

  @override
  _DBAdvice get _value => super._value as _DBAdvice;

  @override
  $Res call({
    Object? id = freezed,
    Object? adviceText = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? done = freezed,
  }) {
    return _then(_DBAdvice(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      adviceText: adviceText == freezed
          ? _value.adviceText
          : adviceText // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DBAdvice implements _DBAdvice {
  _$_DBAdvice(
      {@JsonKey(name: DBAdvice.keyId) this.id,
      @JsonKey(name: DBAdvice.keyAdviceText) this.adviceText = "",
      @JsonKey(name: DBAdvice.keyCreated) this.created = "",
      @JsonKey(name: DBAdvice.keyUpdated) this.updated = "",
      @JsonKey(name: DBAdvice.keyDone) this.done = 0});

  factory _$_DBAdvice.fromJson(Map<String, dynamic> json) =>
      _$$_DBAdviceFromJson(json);

  @override
  @JsonKey(name: DBAdvice.keyId)
  final int? id;
  @override
  @JsonKey(name: DBAdvice.keyAdviceText)
  final String adviceText;
  @override
  @JsonKey(name: DBAdvice.keyCreated)
  final String created;
  @override
  @JsonKey(name: DBAdvice.keyUpdated)
  final String updated;
  @override
  @JsonKey(name: DBAdvice.keyDone)
  final int done;

  @override
  String toString() {
    return 'DBAdvice(id: $id, adviceText: $adviceText, created: $created, updated: $updated, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DBAdvice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.adviceText, adviceText) ||
                other.adviceText == adviceText) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.done, done) || other.done == done));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, adviceText, created, updated, done);

  @JsonKey(ignore: true)
  @override
  _$DBAdviceCopyWith<_DBAdvice> get copyWith =>
      __$DBAdviceCopyWithImpl<_DBAdvice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DBAdviceToJson(this);
  }
}

abstract class _DBAdvice implements DBAdvice {
  factory _DBAdvice(
      {@JsonKey(name: DBAdvice.keyId) int? id,
      @JsonKey(name: DBAdvice.keyAdviceText) String adviceText,
      @JsonKey(name: DBAdvice.keyCreated) String created,
      @JsonKey(name: DBAdvice.keyUpdated) String updated,
      @JsonKey(name: DBAdvice.keyDone) int done}) = _$_DBAdvice;

  factory _DBAdvice.fromJson(Map<String, dynamic> json) = _$_DBAdvice.fromJson;

  @override
  @JsonKey(name: DBAdvice.keyId)
  int? get id;
  @override
  @JsonKey(name: DBAdvice.keyAdviceText)
  String get adviceText;
  @override
  @JsonKey(name: DBAdvice.keyCreated)
  String get created;
  @override
  @JsonKey(name: DBAdvice.keyUpdated)
  String get updated;
  @override
  @JsonKey(name: DBAdvice.keyDone)
  int get done;
  @override
  @JsonKey(ignore: true)
  _$DBAdviceCopyWith<_DBAdvice> get copyWith =>
      throw _privateConstructorUsedError;
}
