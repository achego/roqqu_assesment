
  import 'package:flutter/foundation.dart';
  import 'package:freezed_annotation/freezed_annotation.dart';
  
  part 'candle_stick_model.freezed.dart';
  part 'candle_stick_model.g.dart';
  
  
  @freezed
  class CandleStickModel with _$CandleStickModel {
  
    const factory CandleStickModel({@JsonKey(name: 'e') String? e, 
@JsonKey(name: 'E') int? E, 
@JsonKey(name: 's') String? s, 
@JsonKey(name: 'k') KModel? k, 
}) = _CandleStickModel;
  
    factory CandleStickModel.fromJson(Map<String, Object?> json)
        => _$CandleStickModelFromJson(json);
  }
  
  
  
  @freezed
  class KModel with _$KModel {
  
    const factory KModel({@JsonKey(name: 't') int? t, 
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
@JsonKey(name: 'B') String? B, 
}) = _KModel;
  
    factory KModel.fromJson(Map<String, Object?> json)
        => _$KModelFromJson(json);
  }
  
  
  
  