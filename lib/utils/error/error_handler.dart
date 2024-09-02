import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class Serverfailure extends Failure {
  Serverfailure(super.errorMessage);

  factory Serverfailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return Serverfailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return Serverfailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return Serverfailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return Serverfailure('bad certificate with API server');
      case DioExceptionType.badResponse:
        return Serverfailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!);
      case DioExceptionType.cancel:
        return Serverfailure('Request to server was canceled');
      case DioExceptionType.connectionError:
        return Serverfailure('Connection error with API server');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return Serverfailure('No Internet Connection');
        } else {
          return Serverfailure('Unexpected Error, Please Try Later !');
        }
      default:
        return Serverfailure('Oops there was an error ,Please try again');
    }
  }

  factory Serverfailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return Serverfailure(response.toString());
    } else if (statusCode == 404) {
      String? msg = response.data['error'];
      /// this will check error message
      if(msg != null && msg.isNotEmpty){
        return Serverfailure(msg);
      }else{
        return Serverfailure('Your request not found , please try later !');
      }
    } else if (statusCode == 500) {
      return Serverfailure('Internal server error , please try later !');
    } else {
      return Serverfailure('Oops there was an error ,Please try again');
    }
  }
}