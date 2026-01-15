//General remote failures
import 'package:ecommerce_app/core/failures/failure.dart';
import 'dart:convert';
// //////////////////////////////////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////////////////////////////////
class ServerFailure extends Failure {
  String? error,errorCode;
  String? message;
  ServerFailure({
    required super.statusCode,
    super.messageAr,
    super.messageEn,
    this.error,
    this.errorCode,
    this.message
  });

  ServerFailure copyWith({
    String? statusCode,
    String? error,
    String? messageAr,
    String? messageEn,
    String? errorCode,
    String? message,

}){
    return ServerFailure(
        statusCode: statusCode ?? this.statusCode,
        error: error ?? this.error,
        messageAr: messageAr ?? this.messageAr,
        messageEn: messageEn ?? this.messageEn,
        errorCode: errorCode ?? this.errorCode,
        message: message ?? this.message,
    );
  }

}