import 'package:dio/dio.dart';
import '../error/error_handler.dart';

class ApiService {
  final _baseUrl = 'http://10.0.2.2:8000/basic/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    String? token,
  }) async {
    try {

      final response = await _dio.get(
        '$_baseUrl$endPoint',
        queryParameters: queryParams,
         options: Options(
        headers: {
          'Authorization': 'Bearer $token', 
        },
      ),
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Serverfailure.fromResponse(response.statusCode!, response);
      }
    } on DioException catch (e) {
      throw Serverfailure.fromDioError(e);
    } catch (e) {
      throw Serverfailure("An unknown error occurred: ${e.toString()}");
    }
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
     String? token,
  }) async {
    try {
            
      
      final response = await _dio.post(
        '$_baseUrl$endPoint',
        data: data,
        options: Options(
        headers: {
          'Authorization': 'Bearer $token', 
        },
      ),
      );
      

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Serverfailure.fromResponse(response.statusCode!, response);
      }
    } on DioException catch (e) {
      throw Serverfailure.fromDioError(e);
    } catch (e) {
      throw Serverfailure("An unknown error occurred: ${e.toString()}");
    }
  }
}
