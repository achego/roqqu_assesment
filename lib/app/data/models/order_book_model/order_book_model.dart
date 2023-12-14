import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_book_model.freezed.dart';
part 'order_book_model.g.dart';

@freezed
class OrderBookModel with _$OrderBookModel {
  const factory OrderBookModel({
    @JsonKey(name: 'e') String? e,
    @JsonKey(name: 'E') int? E,
    @JsonKey(name: 's') String? s,
    @JsonKey(name: 't') int? t,
    @JsonKey(name: 'p') String? p,
    @JsonKey(name: 'q') String? q,
    @JsonKey(name: 'b') int? b,
    @JsonKey(name: 'a') int? a,
    @JsonKey(name: 'T') int? T,
    @JsonKey(name: 'm') @Default(false) bool m,
    @JsonKey(name: 'M') @Default(false) bool M,
  }) = _OrderBookModel;

  factory OrderBookModel.fromJson(Map<String, Object?> json) =>
      _$OrderBookModelFromJson(json);
}
