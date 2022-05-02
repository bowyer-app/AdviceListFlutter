// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'advice_edit_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AdviceEditPageStateTearOff {
  const _$AdviceEditPageStateTearOff();

  _AdviceEditPageState call(
      {Advice? advice, String adviceText = "", String inputText = ""}) {
    return _AdviceEditPageState(
      advice: advice,
      adviceText: adviceText,
      inputText: inputText,
    );
  }
}

/// @nodoc
const $AdviceEditPageState = _$AdviceEditPageStateTearOff();

/// @nodoc
mixin _$AdviceEditPageState {
  Advice? get advice => throw _privateConstructorUsedError;
  String get adviceText => throw _privateConstructorUsedError;
  String get inputText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdviceEditPageStateCopyWith<AdviceEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdviceEditPageStateCopyWith<$Res> {
  factory $AdviceEditPageStateCopyWith(
          AdviceEditPageState value, $Res Function(AdviceEditPageState) then) =
      _$AdviceEditPageStateCopyWithImpl<$Res>;
  $Res call({Advice? advice, String adviceText, String inputText});

  $AdviceCopyWith<$Res>? get advice;
}

/// @nodoc
class _$AdviceEditPageStateCopyWithImpl<$Res>
    implements $AdviceEditPageStateCopyWith<$Res> {
  _$AdviceEditPageStateCopyWithImpl(this._value, this._then);

  final AdviceEditPageState _value;
  // ignore: unused_field
  final $Res Function(AdviceEditPageState) _then;

  @override
  $Res call({
    Object? advice = freezed,
    Object? adviceText = freezed,
    Object? inputText = freezed,
  }) {
    return _then(_value.copyWith(
      advice: advice == freezed
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as Advice?,
      adviceText: adviceText == freezed
          ? _value.adviceText
          : adviceText // ignore: cast_nullable_to_non_nullable
              as String,
      inputText: inputText == freezed
          ? _value.inputText
          : inputText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $AdviceCopyWith<$Res>? get advice {
    if (_value.advice == null) {
      return null;
    }

    return $AdviceCopyWith<$Res>(_value.advice!, (value) {
      return _then(_value.copyWith(advice: value));
    });
  }
}

/// @nodoc
abstract class _$AdviceEditPageStateCopyWith<$Res>
    implements $AdviceEditPageStateCopyWith<$Res> {
  factory _$AdviceEditPageStateCopyWith(_AdviceEditPageState value,
          $Res Function(_AdviceEditPageState) then) =
      __$AdviceEditPageStateCopyWithImpl<$Res>;
  @override
  $Res call({Advice? advice, String adviceText, String inputText});

  @override
  $AdviceCopyWith<$Res>? get advice;
}

/// @nodoc
class __$AdviceEditPageStateCopyWithImpl<$Res>
    extends _$AdviceEditPageStateCopyWithImpl<$Res>
    implements _$AdviceEditPageStateCopyWith<$Res> {
  __$AdviceEditPageStateCopyWithImpl(
      _AdviceEditPageState _value, $Res Function(_AdviceEditPageState) _then)
      : super(_value, (v) => _then(v as _AdviceEditPageState));

  @override
  _AdviceEditPageState get _value => super._value as _AdviceEditPageState;

  @override
  $Res call({
    Object? advice = freezed,
    Object? adviceText = freezed,
    Object? inputText = freezed,
  }) {
    return _then(_AdviceEditPageState(
      advice: advice == freezed
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as Advice?,
      adviceText: adviceText == freezed
          ? _value.adviceText
          : adviceText // ignore: cast_nullable_to_non_nullable
              as String,
      inputText: inputText == freezed
          ? _value.inputText
          : inputText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AdviceEditPageState implements _AdviceEditPageState {
  const _$_AdviceEditPageState(
      {this.advice, this.adviceText = "", this.inputText = ""});

  @override
  final Advice? advice;
  @JsonKey(defaultValue: "")
  @override
  final String adviceText;
  @JsonKey(defaultValue: "")
  @override
  final String inputText;

  @override
  String toString() {
    return 'AdviceEditPageState(advice: $advice, adviceText: $adviceText, inputText: $inputText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdviceEditPageState &&
            (identical(other.advice, advice) || other.advice == advice) &&
            (identical(other.adviceText, adviceText) ||
                other.adviceText == adviceText) &&
            (identical(other.inputText, inputText) ||
                other.inputText == inputText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, advice, adviceText, inputText);

  @JsonKey(ignore: true)
  @override
  _$AdviceEditPageStateCopyWith<_AdviceEditPageState> get copyWith =>
      __$AdviceEditPageStateCopyWithImpl<_AdviceEditPageState>(
          this, _$identity);
}

abstract class _AdviceEditPageState implements AdviceEditPageState {
  const factory _AdviceEditPageState(
      {Advice? advice,
      String adviceText,
      String inputText}) = _$_AdviceEditPageState;

  @override
  Advice? get advice;
  @override
  String get adviceText;
  @override
  String get inputText;
  @override
  @JsonKey(ignore: true)
  _$AdviceEditPageStateCopyWith<_AdviceEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
