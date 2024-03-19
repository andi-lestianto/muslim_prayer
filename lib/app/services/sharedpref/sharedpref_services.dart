import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  saveCurrentLatLong({required String lat, required String long}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isSuccess = await prefs.setString('latLong', '$lat~$long');
    if (isSuccess == true) {
      log('$lat~$long', name: 'LatLong saved successfully');
    } else {
      log('$lat~$long', name: 'LatLong saving failed');
    }
  }

  Future<String?> getCurrentLatLong() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? latLong = prefs.getString('latLong');
    if (latLong != null) {
      log(latLong, name: 'LatLong fetched successfully');
    } else {
      log('$latLong', name: 'LatLong fetching failed');
    }
    return latLong;
  }
}
