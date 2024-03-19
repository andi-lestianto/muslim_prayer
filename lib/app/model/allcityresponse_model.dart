class AllCityResponse {
  bool? status;
  Request? request;
  List<CityData>? cityData;

  AllCityResponse({this.status, this.request, this.cityData});

  AllCityResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    request =
        json['request'] != null ? Request.fromJson(json['request']) : null;
    if (json['data'] != null) {
      cityData = <CityData>[];
      json['data'].forEach((v) {
        cityData!.add(CityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (request != null) {
      data['request'] = request!.toJson();
    }
    if (cityData != null) {
      data['data'] = cityData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Request {
  String? path;

  Request({this.path});

  Request.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    return data;
  }
}

class CityData {
  String? id;
  String? lokasi;

  CityData({this.id, this.lokasi});

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lokasi = json['lokasi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lokasi'] = lokasi;
    return data;
  }
}
