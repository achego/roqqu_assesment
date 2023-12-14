// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candle_stick_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandleStickModelImpl _$$CandleStickModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CandleStickModelImpl(
      e: json['e'] as String?,
      E: json['E'] as int?,
      s: json['s'] as String?,
      k: json['k'] == null
          ? null
          : KModel.fromJson(json['k'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CandleStickModelImplToJson(
        _$CandleStickModelImpl instance) =>
    <String, dynamic>{
      'e': instance.e,
      'E': instance.E,
      's': instance.s,
      'k': instance.k,
    };

_$KModelImpl _$$KModelImplFromJson(Map<String, dynamic> json) => _$KModelImpl(
      t: json['t'] as int?,
      T: json['T'] as int?,
      s: json['s'] as String?,
      i: json['i'] as String?,
      f: json['f'] as int?,
      L: json['L'] as int?,
      o: json['o'] as String?,
      c: json['c'] as String?,
      h: json['h'] as String?,
      l: json['l'] as String?,
      v: json['v'] as String?,
      n: json['n'] as int?,
      x: json['x'] as bool?,
      q: json['q'] as String?,
      V: json['V'] as String?,
      Q: json['Q'] as String?,
      B: json['B'] as String?,
    );

Map<String, dynamic> _$$KModelImplToJson(_$KModelImpl instance) =>
    <String, dynamic>{
      't': instance.t,
      'T': instance.T,
      's': instance.s,
      'i': instance.i,
      'f': instance.f,
      'L': instance.L,
      'o': instance.o,
      'c': instance.c,
      'h': instance.h,
      'l': instance.l,
      'v': instance.v,
      'n': instance.n,
      'x': instance.x,
      'q': instance.q,
      'V': instance.V,
      'Q': instance.Q,
      'B': instance.B,
    };
