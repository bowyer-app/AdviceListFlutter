// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'advice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AdviceTearOff {
  const _$AdviceTearOff();

  _Advice call(
      {AdviceId? id,
      required String adviceText,
      DateVO? created,
      DateVO? updated,
      required bool done}) {
    return _Advice(
      id: id,
      adviceText: adviceText,
      created: created,
      updated: updated,
      done: done,
    );
  }
}

/// @nodoc
const $Advice = _$AdviceTearOff();

/// @nodoc
mixin _$Advice {
  AdviceId? get id => throw _privateConstructorUsedError;
  String get adviceText => throw _privateConstructorUsedError;
  DateVO? get created => throw _privateConstructorUsedError;
  DateVO? get updated => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdviceCopyWith<Advice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdviceCopyWith<$Res> {
  factory $AdviceCopyWith(Advice value, $Res Function(Advice) then) =
      _$AdviceCopyWithImpl<$Res>;
  $Res call(
      {AdviceId? id,
      String adviceText,
      DateVO? created,
      DateVO? updated,
      bool done});
}

/// @nodoc
class _$AdviceCopyWithImpl<$Res> implements $AdviceCopyWith<$Res> {
  _$AdviceCopyWithImpl(this._value, this._then);

  final Advice _value;
  // ignore: unused_field
  final $Res Function(Advice) _then;

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
              as AdviceId?,
      adviceText: adviceText == freezed
          ? _value.adviceText
          : adviceText // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateVO?,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateVO?,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AdviceCopyWith<$Res> implements $AdviceCopyWith<$Res> {
  factory _$AdviceCopyWith(_Advice value, $Res Function(_Advice) then) =
      __$AdviceCopyWithImpl<$Res>;
  @override
  $Res call(
      {AdviceId? id,
      String adviceText,
      DateVO? created,
      DateVO? updated,
      bool done});
}

/// @nodoc
class __$AdviceCopyWithImpl<$Res> extends _$AdviceCopyWithImpl<$Res>
    implements _$AdviceCopyWith<$Res> {
  __$AdviceCopyWithImpl(_Advice _value, $Res Function(_Advice) _then)
      : super(_value, (v) => _then(v as _Advice));

  @override
  _Advice get _value => super._value as _Advice;

  @override
  $Res call({
    Object? id = freezed,
    Object? adviceText = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? done = freezed,
  }) {
    return _then(_Advice(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as AdviceId?,
      adviceText: adviceText == freezed
          ? _value.adviceText
          : adviceText // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateVO?,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateVO?,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Advice implements _Advice {
  _$_Advice(
      {this.id,
      required this.adviceText,
      this.created,
      this.updated,
      required this.done});

  @override
  final AdviceId? id;
  @override
  final String adviceText;
  @override
  final DateVO? created;
  @override
  final DateVO? updated;
  @override
  final bool done;

  @override
  String toString() {
    return 'Advice(id: $id, adviceText: $adviceText, created: $created, updated: $updated, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Advice &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.adviceText, adviceText) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.updated, updated) &&
            const DeepCollectionEquality().equals(other.done, done));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(adviceText),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(updated),
      const DeepCollectionEquality().hash(done));

  @JsonKey(ignore: true)
  @override
  _$AdviceCopyWith<_Advice> get copyWith =>
      __$AdviceCopyWithImpl<_Advice>(this, _$identity);
}

abstract class _Advice implements Advice {
  factory _Advice(
      {AdviceId? id,
      required String adviceText,
      DateVO? created,
      DateVO? updated,
      required bool done}) = _$_Advice;

  @override
  AdviceId? get id;
  @override
  String get adviceText;
  @override
  DateVO? get created;
  @override
  DateVO? get updated;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$AdviceCopyWith<_Advice> get copyWith => throw _privateConstructorUsedError;
}
