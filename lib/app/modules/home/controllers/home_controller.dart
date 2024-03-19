// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:muslim_prayer/app/model/api_response.dart';
import 'package:muslim_prayer/app/model/prayscheduleresponse_model.dart';
import 'package:muslim_prayer/app/modules/home/services/homeservices.dart';
import 'package:muslim_prayer/app/services/network/api_services.dart';
import 'package:muslim_prayer/app/services/sharedpref/sharedpref_services.dart';
import 'package:muslim_prayer/app/utils/datetime_utils.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final HomeServices homeServices = HomeServices();
  final SharedPrefServices sharedPrefServices = SharedPrefServices();

  Position? position;
  String? city;
  String? currentTime;
  String? currentDate;

  getCurrentLocation() async {
    log('checking location');
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    if (position != null) {
      log(position!.latitude.toString());
      log(position!.longitude.toString());
      sharedPrefServices.saveCurrentLatLong(
          lat: position!.latitude.toString(),
          long: position!.longitude.toString());
      getCityName(lat: position!.latitude, long: position!.longitude);
    } else {
      log(position.toString());
    }
  }

  getCityName({required double lat, required double long}) async {
    print('getCityByName');
    List<Placemark> placemarks = await placemarkFromCoordinates(
      lat,
      long,
    );
    log(placemarks.first.toString());
    city = placemarks.first.subAdministrativeArea?.split(' ').last;
    getCityCode(cityName: city.toString());
    update();
  }

  getCityCode({required String cityName}) async {
    String data =
        await homeServices.getCityCode(cityName: cityName.toUpperCase());
    log('$cityName $data', name: 'your city code');
    getPrayScheduleMonthly(cityCode: data);
  }

  ApiResponse<PrayScheduleResponse> psResponse = ApiResponse.initial();

  getPrayScheduleMonthly({required String cityCode}) async {
    psResponse = ApiResponse.initial();
    update();

    final ApiResponse apiResponse = await homeServices.getPrayScheduleMonthly(
        cityCode: cityCode,
        year: DateTimeUtils().getYearNow(),
        month: DateTimeUtils().getMonthNow());

    if (apiResponse.status == Status.completed) {
      psResponse = ApiResponse.completed(
          PrayScheduleResponse.fromJson(apiResponse.data));
    } else {
      psResponse = ApiResponse.error(apiResponse.message);
    }

    update();
  }

  getCurrentTime() {
    currentDate = DateTimeUtils().getTimeNow().split('~').first;
    currentTime = DateTimeUtils().getTimeNow().split('~').last;
    log(currentTime.toString());
    update();
  }

  getSavedLatLong() async {
    final String? savedLatLong = await sharedPrefServices.getCurrentLatLong();
    if (savedLatLong != null) {
      final List<String> latLong = savedLatLong.split('~');
      getCityName(
          lat: double.parse(latLong.first), long: double.parse(latLong.last));
    } else {
      getCurrentLocation();
    }
  }

  getMonthlyPray() async {}

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getSavedLatLong();
    Timer.periodic(Duration(seconds: 1), (timer) {
      getCurrentTime();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
