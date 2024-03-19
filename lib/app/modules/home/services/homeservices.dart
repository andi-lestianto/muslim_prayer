import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:muslim_prayer/app/model/allcityresponse_model.dart';
import 'package:muslim_prayer/app/model/api_response.dart';
import 'package:muslim_prayer/app/services/network/api_services.dart';
import 'package:muslim_prayer/app/utils/endpoint_utils.dart';

class HomeServices {
  final ApiServices apiServices = ApiServices();

  Future<String> getCityCode({required String cityName}) async {
    String data = await rootBundle.loadString('assets/jsoncity/allcity.json');
    final jsonRes = json.decode(data);

    ApiResponse<AllCityResponse> allCityResponse =
        ApiResponse.completed(AllCityResponse.fromJson(jsonRes));

    CityData? cityData = allCityResponse.data!.cityData!
        .firstWhereOrNull((element) => element.lokasi!.contains(cityName));

    if (cityData != null) {
      return cityData.id!;
    } else {
      return '1301';
    }
  }

  Future<ApiResponse> getPrayScheduleMonthly(
      {required String cityCode,
      required String year,
      required String month}) async {
    try {
      return apiServices.getApi(
          url:
              '${EndpointUtils.getPrayScheduleMonthly}/$cityCode/$year/$month');
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
