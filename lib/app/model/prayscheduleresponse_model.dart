class PrayScheduleResponse {
  bool? status;
  Request? request;
  LocationData? locationData;

  PrayScheduleResponse({this.status, this.request, this.locationData});

  PrayScheduleResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    request =
        json['request'] != null ? Request.fromJson(json['request']) : null;
    locationData =
        json['data'] != null ? LocationData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (request != null) {
      data['request'] = request!.toJson();
    }
    if (locationData != null) {
      data['data'] = locationData!.toJson();
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

class LocationData {
  int? id;
  String? lokasi;
  String? daerah;
  List<Jadwal>? jadwal;

  LocationData({this.id, this.lokasi, this.daerah, this.jadwal});

  LocationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lokasi = json['lokasi'];
    daerah = json['daerah'];
    if (json['jadwal'] != null) {
      jadwal = <Jadwal>[];
      json['jadwal'].forEach((v) {
        jadwal!.add(Jadwal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lokasi'] = lokasi;
    data['daerah'] = daerah;
    if (jadwal != null) {
      data['jadwal'] = jadwal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jadwal {
  String? tanggal;
  String? imsak;
  String? subuh;
  String? terbit;
  String? dhuha;
  String? dzuhur;
  String? ashar;
  String? maghrib;
  String? isya;
  String? date;

  Jadwal(
      {this.tanggal,
      this.imsak,
      this.subuh,
      this.terbit,
      this.dhuha,
      this.dzuhur,
      this.ashar,
      this.maghrib,
      this.isya,
      this.date});

  Jadwal.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    imsak = json['imsak'];
    subuh = json['subuh'];
    terbit = json['terbit'];
    dhuha = json['dhuha'];
    dzuhur = json['dzuhur'];
    ashar = json['ashar'];
    maghrib = json['maghrib'];
    isya = json['isya'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tanggal'] = tanggal;
    data['imsak'] = imsak;
    data['subuh'] = subuh;
    data['terbit'] = terbit;
    data['dhuha'] = dhuha;
    data['dzuhur'] = dzuhur;
    data['ashar'] = ashar;
    data['maghrib'] = maghrib;
    data['isya'] = isya;
    data['date'] = date;
    return data;
  }
}
