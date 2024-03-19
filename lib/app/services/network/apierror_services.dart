import 'package:dio/dio.dart';
import 'package:muslim_prayer/app/model/api_response.dart';

class ApiErrorServices {
  ApiResponse apiResponseError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.cancel:
        return ApiResponse.error('Permintaan Dibatalkan');
      case DioExceptionType.connectionTimeout:
        return ApiResponse.error('Waktu Koneksi Habis');
      case DioExceptionType.sendTimeout:
        return ApiResponse.error('Waktu Upload Habis');
      case DioExceptionType.receiveTimeout:
        return ApiResponse.error('Waktu Download Habis');
      case DioExceptionType.badResponse:
        return ApiResponse.error(exception.response != null
            ? exception.response!.data.runtimeType == String
                ? '${exception.response!.statusCode} ${exception.response!.statusMessage}'
                : (exception.response!.data as Map<String, dynamic>)
                        .entries
                        .first
                        .value is List
                    ? (exception.response!.data as Map<String, dynamic>)
                        .entries
                        .first
                        .value
                        .first
                    : exception.response!.data['message']
            : exception.message);
      case DioExceptionType.unknown:
        return ApiResponse.error('Tidak ada koneksi internet');

      default:
        return ApiResponse.error('Tidak ada koneksi internet');
    }
  }
}
