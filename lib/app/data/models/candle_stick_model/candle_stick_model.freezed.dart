// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candle_stick_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CandleStickModel _$CandleStickModelFromJson(Map<String, dynamic> json) {
  return _CandleStickModel.fromJson(json);
}

/// @nodoc
mixin _$CandleStickModel {
  @JsonKey(name: 'e')
  String? get e => throw _privateConstructorUsedError;
  @JsonKey(name: 'E')
  int? get E => throw _privateConstructorUsedError;
  @JsonKey(name: 's')
  String? get s => throw _privateConstructorUsedError;
  @JsonKey(name: 'k')
  KModel? get k => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CandleStickModelCopyWith<CandleStickModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandleStickModelCopyWith<$Res> {
  factory $CandleStickModelCopyWith(
          CandleStickModel value, $Res Function(CandleStickModel) then) =
      _$CandleStickModelCopyWithImpl<$Res, CandleStickModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'e') String? e,
      @JsonKey(name: 'E') int? E,
      @JsonKey(name: 's') String? s,
      @JsonKey(name: 'k') KModel? k});

  $KModelCopyWith<$Res>? get k;
}

/// @nodoc
class _$CandleStickModelCopyWithImpl<$Res, $Val extends CandleStickModel>
    implements $CandleStickModelCopyWith<$Res> {
  _$CandleStickModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
    Object? E = freezed,
    Object? s = freezed,
    Object? k = freezed,
  }) {
    return _then(_value.copyWith(
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String?,
      E: freezed == E
          ? _value.E
          : E // ignore: cast_nullable_to_non_nullable
              as int?,
      s: freezed == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String?,
      k: freezed == k
          ? _value.k
          : k // ignore: cast_nullable_to_non_nullable
              as KModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KModelCopyWith<$Res>? get k {
    if (_value.k == null) {
      return null;
    }

    return $KModelCopyWith<$Res>(_value.k!, (value) {
      return _then(_value.copyWith(k: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CandleStickModelImplCopyWith<$Res>
    implements $CandleStickModelCopyWith<$Res> {
  factory _$$CandleStickModelImplCopyWith(_$CandleStickModelImpl value,
          $Res Function(_$CandleStickModelImpl) then) =
      __$$CandleStickModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'e') String? e,
      @JsonKey(name: 'E') int? E,
      @JsonKey(name: 's') String? s,
      @JsonKey(name: 'k') KModel? k});

  @override
  $KModelCopyWith<$Res>? get k;
}

/// @nodoc
class __$$CandleStickModelImplCopyWithImpl<$Res>
    extends _$CandleStickModelCopyWithImpl<$Res, _$CandleStickModelImpl>
    implements _$$CandleStickModelImplCopyWith<$Res> {
  __$$CandleStickModelImplCopyWithImpl(_$CandleStickModelImpl _value,
      $Res Function(_$CandleStickModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
    Object? E = freezed,
    Object? s = freezed,
    Object? k = freezed,
  }) {
    return _then(_$CandleStickModelImpl(
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String?,
      E: freezed == E
          ? _value.E
          : E // ignore: cast_nullable_to_non_nullable
              as int?,
      s: freezed == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String?,
      k: freezed == k
          ? _value.k
          : k // ignore: cast_nullable_to_non_nullable
              as KModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CandleStickModelImpl
    with DiagnosticableTreeMixin
    implements _CandleStickModel {
  const _$CandleStickModelImpl(
      {@JsonKey(name: 'e') this.e,
      @JsonKey(name: 'E') this.E,
      @JsonKey(name: 's') this.s,
      @JsonKey(name: 'k') this.k});

  factory _$CandleStickModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandleStickModelImplFromJson(json);

  @override
  @JsonKey(name: 'e')
  final String? e;
  @override
  @JsonKey(name: 'E')
  final int? E;
  @override
  @JsonKey(name: 's')
  final String? s;
  @override
  @JsonKey(name: 'k')
  final KModel? k;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CandleStickModel(e: $e, E: $E, s: $s, k: $k)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CandleStickModel'))
      ..add(DiagnosticsProperty('e', e))
      ..add(DiagnosticsProperty('E', E))
      ..add(DiagnosticsProperty('s', s))
      ..add(DiagnosticsProperty('k', k));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandleStickModelImpl &&
            (identical(other.e, e) || other.e == e) &&
            (identical(other.E, E) || other.E == E) &&
            (identical(other.s, s) || other.s == s) &&
            (identical(other.k, k) || other.k == k));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, e, E, s, k);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CandleStickModelImplCopyWith<_$CandleStickModelImpl> get copyWith =>
      __$$CandleStickModelImplCopyWithImpl<_$CandleStickModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CandleStickModelImplToJson(
      this,
    );
  }
}

abstract class _CandleStickModel implements CandleStickModel {
  const factory _CandleStickModel(
      {@JsonKey(name: 'e') final String? e,
      @JsonKey(name: 'E') final int? E,
      @JsonKey(name: 's') final String? s,
      @JsonKey(name: 'k') final KModel? k}) = _$CandleStickModelImpl;

  factory _CandleStickModel.fromJson(Map<String, dynamic> json) =
      _$CandleStickModelImpl.fromJson;

  @override
  @JsonKey(name: 'e')
  String? get e;
  @override
  @JsonKey(name: 'E')
  int? get E;
  @override
  @JsonKey(name: 's')
  String? get s;
  @override
  @JsonKey(name: 'k')
  KModel? get k;
  @override
  @JsonKey(ignore: true)
  _$$CandleStickModelImplCopyWith<_$CandleStickModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KModel _$KModelFromJson(Map<String, dynamic> json) {
  return _KModel.fromJson(json);
}

/// @nodoc
mixin _$KModel {
  @JsonKey(name: 't')
  int? get t => throw _privateConstructorUsedError;
  @JsonKey(name: 'T')
  int? get T => throw _privateConstructorUsedError;
  @JsonKey(name: 's')
  String? get s => throw _privateConstructorUsedError;
  @JsonKey(name: 'i')
  String? get i => throw _privateConstructorUsedError;
  @JsonKey(name: 'f')
  int? get f => throw _privateConstructorUsedError;
  @JsonKey(name: 'L')
  int? get L => throw _privateConstructorUsedError;
  @JsonKey(name: 'o')
  String? get o => throw _privateConstructorUsedError;
  @JsonKey(name: 'c')
  String? get c => throw _privateConstructorUsedError;
  @JsonKey(name: 'h')
  String? get h => throw _privateConstructorUsedError;
  @JsonKey(name: 'l')
  String? get l => throw _privateConstructorUsedError;
  @JsonKey(name: 'v')
  String? get v => throw _privateConstructorUsedError;
  @JsonKey(name: 'n')
  int? get n => throw _privateConstructorUsedError;
  @JsonKey(name: 'x')
  bool? get x => throw _privateConstructorUsedError;
  @JsonKey(name: 'q')
  String? get q => throw _privateConstructorUsedError;
  @JsonKey(name: 'V')
  String? get V => throw _privateConstructorUsedError;
  @JsonKey(name: 'Q')
  String? get Q => throw _privateConstructorUsedError;
  @JsonKey(name: 'B')
  String? get B => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KModelCopyWith<KModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KModelCopyWith<$Res> {
  factory $KModelCopyWith(KModel value, $Res Function(KModel) then) =
      _$KModelCopyWithImpl<$Res, KModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 't') int? t,
      @JsonKey(name: 'T') int? T,
      @JsonKey(name: 's') String? s,
      @JsonKey(name: 'i') String? i,
      @JsonKey(name: 'f') int? f,
      @JsonKey(name: 'L') int? L,
      @JsonKey(name: 'o') String? o,
      @JsonKey(name: 'c') String? c,
      @JsonKey(name: 'h') String? h,
      @JsonKey(name: 'l') String? l,
      @JsonKey(name: 'v') String? v,
      @JsonKey(name: 'n') int? n,
      @JsonKey(name: 'x') bool? x,
      @JsonKey(name: 'q') String? q,
      @JsonKey(name: 'V') String? V,
      @JsonKey(name: 'Q') String? Q,
      @JsonKey(name: 'B') String? B});
}

/// @nodoc
class _$KModelCopyWithImpl<$Res, $Val extends KModel>
    implements $KModelCopyWith<$Res> {
  _$KModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? t = freezed,
    Object? T = freezed,
    Object? s = freezed,
    Object? i = freezed,
    Object? f = freezed,
    Object? L = freezed,
    Object? o = freezed,
    Object? c = freezed,
    Object? h = freezed,
    Object? l = freezed,
    Object? v = freezed,
    Object? n = freezed,
    Object? x = freezed,
    Object? q = freezed,
    Object? V = freezed,
    Object? Q = freezed,
    Object? B = freezed,
  }) {
    return _then(_value.copyWith(
      t: freezed == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as int?,
      T: freezed == T
          ? _value.T
          : T // ignore: cast_nullable_to_non_nullable
              as int?,
      s: freezed == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String?,
      i: freezed == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as String?,
      f: freezed == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as int?,
      L: freezed == L
          ? _value.L
          : L // ignore: cast_nullable_to_non_nullable
              as int?,
      o: freezed == o
          ? _value.o
          : o // ignore: cast_nullable_to_non_nullable
              as String?,
      c: freezed == c
          ? _value.c
          : c // ignore: cast_nullable_to_non_nullable
              as String?,
      h: freezed == h
          ? _value.h
          : h // ignore: cast_nullable_to_non_nullable
              as String?,
      l: freezed == l
          ? _value.l
          : l // ignore: cast_nullable_to_non_nullable
              as String?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String?,
      n: freezed == n
          ? _value.n
          : n // ignore: cast_nullable_to_non_nullable
              as int?,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as bool?,
      q: freezed == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String?,
      V: freezed == V
          ? _value.V
          : V // ignore: cast_nullable_to_non_nullable
              as String?,
      Q: freezed == Q
          ? _value.Q
          : Q // ignore: cast_nullable_to_non_nullable
              as String?,
      B: freezed == B
          ? _value.B
          : B // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KModelImplCopyWith<$Res> implements $KModelCopyWith<$Res> {
  factory _$$KModelImplCopyWith(
          _$KModelImpl value, $Res Function(_$KModelImpl) then) =
      __$$KModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 't') int? t,
      @JsonKey(name: 'T') int? T,
      @JsonKey(name: 's') String? s,
      @JsonKey(name: 'i') String? i,
      @JsonKey(name: 'f') int? f,
      @JsonKey(name: 'L') int? L,
      @JsonKey(name: 'o') String? o,
      @JsonKey(name: 'c') String? c,
      @JsonKey(name: 'h') String? h,
      @JsonKey(name: 'l') String? l,
      @JsonKey(name: 'v') String? v,
      @JsonKey(name: 'n') int? n,
      @JsonKey(name: 'x') bool? x,
      @JsonKey(name: 'q') String? q,
      @JsonKey(name: 'V') String? V,
      @JsonKey(name: 'Q') String? Q,
      @JsonKey(name: 'B') String? B});
}

/// @nodoc
class __$$KModelImplCopyWithImpl<$Res>
    extends _$KModelCopyWithImpl<$Res, _$KModelImpl>
    implements _$$KModelImplCopyWith<$Res> {
  __$$KModelImplCopyWithImpl(
      _$KModelImpl _value, $Res Function(_$KModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? t = freezed,
    Object? T = freezed,
    Object? s = freezed,
    Object? i = freezed,
    Object? f = freezed,
    Object? L = freezed,
    Object? o = freezed,
    Object? c = freezed,
    Object? h = freezed,
    Object? l = freezed,
    Object? v = freezed,
    Object? n = freezed,
    Object? x = freezed,
    Object? q = freezed,
    Object? V = freezed,
    Object? Q = freezed,
    Object? B = freezed,
  }) {
    return _then(_$KModelImpl(
      t: freezed == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as int?,
      T: freezed == T
          ? _value.T
          : T // ignore: cast_nullable_to_non_nullable
              as int?,
      s: freezed == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String?,
      i: freezed == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as String?,
      f: freezed == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as int?,
      L: freezed == L
          ? _value.L
          : L // ignore: cast_nullable_to_non_nullable
              as int?,
      o: freezed == o
          ? _value.o
          : o // ignore: cast_nullable_to_non_nullable
              as String?,
      c: freezed == c
          ? _value.c
          : c // ignore: cast_nullable_to_non_nullable
              as String?,
      h: freezed == h
          ? _value.h
          : h // ignore: cast_nullable_to_non_nullable
              as String?,
      l: freezed == l
          ? _value.l
          : l // ignore: cast_nullable_to_non_nullable
              as String?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String?,
      n: freezed == n
          ? _value.n
          : n // ignore: cast_nullable_to_non_nullable
              as int?,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as bool?,
      q: freezed == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String?,
      V: freezed == V
          ? _value.V
          : V // ignore: cast_nullable_to_non_nullable
              as String?,
      Q: freezed == Q
          ? _value.Q
          : Q // ignore: cast_nullable_to_non_nullable
              as String?,
      B: freezed == B
          ? _value.B
          : B // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KModelImpl with DiagnosticableTreeMixin implements _KModel {
  const _$KModelImpl(
      {@JsonKey(name: 't') this.t,
      @JsonKey(name: 'T') this.T,
      @JsonKey(name: 's') this.s,
      @JsonKey(name: 'i') this.i,
      @JsonKey(name: 'f') this.f,
      @JsonKey(name: 'L') this.L,
      @JsonKey(name: 'o') this.o,
      @JsonKey(name: 'c') this.c,
      @JsonKey(name: 'h') this.h,
      @JsonKey(name: 'l') this.l,
      @JsonKey(name: 'v') this.v,
      @JsonKey(name: 'n') this.n,
      @JsonKey(name: 'x') this.x,
      @JsonKey(name: 'q') this.q,
      @JsonKey(name: 'V') this.V,
      @JsonKey(name: 'Q') this.Q,
      @JsonKey(name: 'B') this.B});

  factory _$KModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KModelImplFromJson(json);

  @override
  @JsonKey(name: 't')
  final int? t;
  @override
  @JsonKey(name: 'T')
  final int? T;
  @override
  @JsonKey(name: 's')
  final String? s;
  @override
  @JsonKey(name: 'i')
  final String? i;
  @override
  @JsonKey(name: 'f')
  final int? f;
  @override
  @JsonKey(name: 'L')
  final int? L;
  @override
  @JsonKey(name: 'o')
  final String? o;
  @override
  @JsonKey(name: 'c')
  final String? c;
  @override
  @JsonKey(name: 'h')
  final String? h;
  @override
  @JsonKey(name: 'l')
  final String? l;
  @override
  @JsonKey(name: 'v')
  final String? v;
  @override
  @JsonKey(name: 'n')
  final int? n;
  @override
  @JsonKey(name: 'x')
  final bool? x;
  @override
  @JsonKey(name: 'q')
  final String? q;
  @override
  @JsonKey(name: 'V')
  final String? V;
  @override
  @JsonKey(name: 'Q')
  final String? Q;
  @override
  @JsonKey(name: 'B')
  final String? B;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KModel(t: $t, T: $T, s: $s, i: $i, f: $f, L: $L, o: $o, c: $c, h: $h, l: $l, v: $v, n: $n, x: $x, q: $q, V: $V, Q: $Q, B: $B)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KModel'))
      ..add(DiagnosticsProperty('t', t))
      ..add(DiagnosticsProperty('T', T))
      ..add(DiagnosticsProperty('s', s))
      ..add(DiagnosticsProperty('i', i))
      ..add(DiagnosticsProperty('f', f))
      ..add(DiagnosticsProperty('L', L))
      ..add(DiagnosticsProperty('o', o))
      ..add(DiagnosticsProperty('c', c))
      ..add(DiagnosticsProperty('h', h))
      ..add(DiagnosticsProperty('l', l))
      ..add(DiagnosticsProperty('v', v))
      ..add(DiagnosticsProperty('n', n))
      ..add(DiagnosticsProperty('x', x))
      ..add(DiagnosticsProperty('q', q))
      ..add(DiagnosticsProperty('V', V))
      ..add(DiagnosticsProperty('Q', Q))
      ..add(DiagnosticsProperty('B', B));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KModelImpl &&
            (identical(other.t, t) || other.t == t) &&
            (identical(other.T, T) || other.T == T) &&
            (identical(other.s, s) || other.s == s) &&
            (identical(other.i, i) || other.i == i) &&
            (identical(other.f, f) || other.f == f) &&
            (identical(other.L, L) || other.L == L) &&
            (identical(other.o, o) || other.o == o) &&
            (identical(other.c, c) || other.c == c) &&
            (identical(other.h, h) || other.h == h) &&
            (identical(other.l, l) || other.l == l) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.n, n) || other.n == n) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.V, V) || other.V == V) &&
            (identical(other.Q, Q) || other.Q == Q) &&
            (identical(other.B, B) || other.B == B));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, t, T, s, i, f, L, o, c, h, l, v, n, x, q, V, Q, B);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KModelImplCopyWith<_$KModelImpl> get copyWith =>
      __$$KModelImplCopyWithImpl<_$KModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KModelImplToJson(
      this,
    );
  }
}

abstract class _KModel implements KModel {
  const factory _KModel(
      {@JsonKey(name: 't') final int? t,
      @JsonKey(name: 'T') final int? T,
      @JsonKey(name: 's') final String? s,
      @JsonKey(name: 'i') final String? i,
      @JsonKey(name: 'f') final int? f,
      @JsonKey(name: 'L') final int? L,
      @JsonKey(name: 'o') final String? o,
      @JsonKey(name: 'c') final String? c,
      @JsonKey(name: 'h') final String? h,
      @JsonKey(name: 'l') final String? l,
      @JsonKey(name: 'v') final String? v,
      @JsonKey(name: 'n') final int? n,
      @JsonKey(name: 'x') final bool? x,
      @JsonKey(name: 'q') final String? q,
      @JsonKey(name: 'V') final String? V,
      @JsonKey(name: 'Q') final String? Q,
      @JsonKey(name: 'B') final String? B}) = _$KModelImpl;

  factory _KModel.fromJson(Map<String, dynamic> json) = _$KModelImpl.fromJson;

  @override
  @JsonKey(name: 't')
  int? get t;
  @override
  @JsonKey(name: 'T')
  int? get T;
  @override
  @JsonKey(name: 's')
  String? get s;
  @override
  @JsonKey(name: 'i')
  String? get i;
  @override
  @JsonKey(name: 'f')
  int? get f;
  @override
  @JsonKey(name: 'L')
  int? get L;
  @override
  @JsonKey(name: 'o')
  String? get o;
  @override
  @JsonKey(name: 'c')
  String? get c;
  @override
  @JsonKey(name: 'h')
  String? get h;
  @override
  @JsonKey(name: 'l')
  String? get l;
  @override
  @JsonKey(name: 'v')
  String? get v;
  @override
  @JsonKey(name: 'n')
  int? get n;
  @override
  @JsonKey(name: 'x')
  bool? get x;
  @override
  @JsonKey(name: 'q')
  String? get q;
  @override
  @JsonKey(name: 'V')
  String? get V;
  @override
  @JsonKey(name: 'Q')
  String? get Q;
  @override
  @JsonKey(name: 'B')
  String? get B;
  @override
  @JsonKey(ignore: true)
  _$$KModelImplCopyWith<_$KModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
