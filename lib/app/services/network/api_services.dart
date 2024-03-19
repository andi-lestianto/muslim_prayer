import 'package:dio/dio.dart';
import 'package:muslim_prayer/app/model/api_response.dart';
import 'package:muslim_prayer/app/services/network/apierror_services.dart';
import 'package:muslim_prayer/app/services/network/dio/dio_services.dart';

class ApiServices {
  final DioServices dioServices = DioServices();
  final ApiErrorServices apiErrorServices = ApiErrorServices();
  ApiResponse apiResponse = ApiResponse.initial();

  Future<ApiResponse> getApi(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      final response = await dioServices.dio.get(url, data: data);
      apiResponse = ApiResponse.completed(response.data);
    } on DioException catch (e) {
      apiResponse = apiErrorServices.apiResponseError(e);
    } catch (e) {
      apiResponse = ApiResponse.error(e.toString());
    }
    return apiResponse;
  }
}
