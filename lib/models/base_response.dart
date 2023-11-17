import 'dart:core';

import 'package:bloc_example/common/utils/status.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  BaseResponse({
    this.data,
    this.statusCode = 404,
    this.message = '',
  });

  @JsonKey(name: 'data')
  T? data;
  String message;
  int statusCode;

  Status get type {
    if (statusCode == 200) {
      return Status.success;
    } else {
      return Status.error;
    }
  }

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(dynamic) create) {
    return BaseResponse(
      message: json['message'] ?? '',
      statusCode: json['status_code'] ?? 404,
      data: json['data'] == null ? null : create(json['data']),
    );
  }

  Map<String, dynamic> toJson() =>
      {"message": message, "status_code": statusCode, "data": data};
}
