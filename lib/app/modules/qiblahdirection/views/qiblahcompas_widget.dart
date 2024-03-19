import 'dart:async';
import 'dart:developer';
import 'dart:math' show pi;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_prayer/app/const/qiblahpageicon/qiblahpage_icon.dart';
import 'package:muslim_prayer/app/theme/color_theme.dart';
import 'package:muslim_prayer/app/theme/font_theme.dart';

class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  Stream<LocationStatus> get stream => _locationStreamController.stream;

  @override
  void initState() {
    super.initState();
    _checkLocationStatus();
  }

  @override
  void dispose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();

              case LocationPermission.denied:
                return LocationErrorWidget(
                  error: "Location service permission denied",
                  callback: _checkLocationStatus,
                );
              case LocationPermission.deniedForever:
                return LocationErrorWidget(
                  error: "Location service Denied Forever !",
                  callback: _checkLocationStatus,
                );
              // case GeolocationStatus.unknown:
              //   return LocationErrorWidget(
              //     error: "Unknown Location service error",
              //     callback: _checkLocationStatus,
              //   );
              default:
                return const SizedBox();
            }
          } else {
            return LocationErrorWidget(
              error: "Please enable Location service",
              callback: _checkLocationStatus,
            );
          }
        },
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset('assets/compass.svg');
  final _needleSvg = SvgPicture.asset(
    QiblahPageIcon.icArrowqiblahSvg,
    fit: BoxFit.contain,
    height: 200.w,
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 12.w,
              ),
              Text('Getting your location...'),
            ],
          );

        final qiblahDirection = snapshot.data!;
        log(qiblahDirection.qiblah.toString());

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: (qiblahDirection.direction * (pi / 180) * -1),
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: ColorTheme.primaryGreen,
                  ),
                  child: ClipOval(
                    child: Container(
                      // padding: EdgeInsets.all(56.w),
                      decoration: BoxDecoration(color: ColorTheme.lightGreen),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 52.w,
                            width: 52.w,
                            child: Center(
                              child: Text(
                                'N',
                                style: FontTheme.bold.copyWith(
                                    fontSize: 32.sp,
                                    color: ColorTheme.pureWhite),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 52.w,
                                width: 52.w,
                                child: Center(
                                  child: Text(
                                    'W',
                                    style: FontTheme.bold.copyWith(
                                        fontSize: 32.sp,
                                        color: ColorTheme.pureWhite),
                                  ),
                                ),
                              ),
                              ClipOval(
                                child: Container(
                                  width: 125.w,
                                  height: 125.w,
                                  decoration: BoxDecoration(
                                      color: ColorTheme.pureWhite),
                                ),
                              ),
                              SizedBox(
                                height: 52.w,
                                width: 52.w,
                                child: Center(
                                  child: Text(
                                    'E',
                                    style: FontTheme.bold.copyWith(
                                        fontSize: 32.sp,
                                        color: ColorTheme.pureWhite),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 52.w,
                            width: 52.w,
                            child: Center(
                              child: Text(
                                'S',
                                style: FontTheme.bold.copyWith(
                                    fontSize: 32.sp,
                                    color: ColorTheme.pureWhite),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Transform.rotate(
              angle: (qiblahDirection.qiblah * (pi / 180) * -1),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  _needleSvg,
                  Positioned.fill(
                      child: Center(
                    child: Image.asset(
                      QiblahPageIcon.icKabahwhitePng,
                      height: 26.w,
                      width: 26.w,
                      fit: BoxFit.cover,
                    ),
                  ))
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
            )
          ],
        );
      },
    );
  }
}

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = SizedBox(height: 32);
    final errorColor = Color(0xffb00020);

    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.location_off,
              size: 150,
              color: errorColor,
            ),
            box,
            Text(
              error!,
              style: TextStyle(color: errorColor, fontWeight: FontWeight.bold),
            ),
            box,
            ElevatedButton(
              child: Text("Retry"),
              onPressed: () {
                if (callback != null) callback!();
              },
            )
          ],
        ),
      ),
    );
  }
}
