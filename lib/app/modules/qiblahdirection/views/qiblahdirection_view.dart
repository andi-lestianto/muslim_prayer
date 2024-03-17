import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:muslim_prayer/app/const/praypageicon/praypage_icon.dart';
import 'package:muslim_prayer/app/const/qiblahpageicon/qiblahpage_icon.dart';
import 'package:muslim_prayer/app/modules/home/views/home_view.dart';
import 'package:muslim_prayer/app/modules/qiblahdirection/views/qiblahcompas_widget.dart';
import 'package:muslim_prayer/app/theme/color_theme.dart';
import 'package:muslim_prayer/app/theme/font_theme.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

import '../controllers/qiblahdirection_controller.dart';

class QiblahdirectionView extends GetView<QiblahdirectionController> {
  const QiblahdirectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QiblahdirectionController>(
      builder: (_) => Scaffold(
        backgroundColor: ColorTheme.primaryGreen,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 12.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        QiblahPageIcon.icArrowCircleSvg,
                        width: 24.w,
                        height: 24.w,
                      ),
                      Text(
                        'Qiblah Direction',
                        style: FontTheme.semibold.copyWith(
                            fontSize: 16.w, color: ColorTheme.pureWhite),
                      ),
                      SizedBox(
                        width: 24.w,
                        height: 24.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.w,
                ),
                SemicircularIndicator(
                  radius: 120.w,
                  strokeWidth: 20,
                  progress: 0.7,
                  color: ColorTheme.pureYellow,
                  bottomPadding: 0,
                  backgroundColor: ColorTheme.secondaryGreen,
                  child: Padding(
                    padding: EdgeInsets.only(top: 28.w),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          painter: MyPainter(),
                          size: Size(200.w, 100.w),
                        ),
                        Column(
                          children: [
                            Text(
                              'Karanganyar',
                              style: FontTheme.semibold.copyWith(
                                fontSize: 10.sp,
                                color: ColorTheme.pureWhite,
                              ),
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Text(
                              '10:24',
                              style: FontTheme.extrabold.copyWith(
                                  fontSize: 32.sp,
                                  color: ColorTheme.pureWhite,
                                  height: 1),
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Text(
                              '11 Maret 2024',
                              style: FontTheme.semibold.copyWith(
                                fontSize: 10.sp,
                                color: ColorTheme.pureWhite,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                              color: ColorTheme.pureWhite,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorTheme.whiteGray,
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Image.asset(
                                  QiblahPageIcon.icLightBulbPng,
                                  height: 35.w,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                child: Text(
                                  'Please enable your location services and place your device on a flat surface',
                                  style: FontTheme.regular.copyWith(
                                      color: ColorTheme.primaryGreen,
                                      fontSize: 10.sp),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                            color: ColorTheme.pureWhite,
                            borderRadius: BorderRadius.circular(4.r)),
                        child: SvgPicture.asset(
                          QiblahPageIcon.icLocationSvg,
                          height: 19.w,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.w,
                ),
                Expanded(
                  child: Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      decoration: BoxDecoration(
                          color: ColorTheme.whiteGray,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.r),
                              topRight: Radius.circular(24.r))),
                      child: Center(
                        child: FutureBuilder(
                          future: _.deviceSupport,
                          builder: (_, AsyncSnapshot<bool?> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting)
                              return CircularProgressIndicator();
                            if (snapshot.hasError)
                              return Center(
                                child:
                                    Text("Error: ${snapshot.error.toString()}"),
                              );

                            if (snapshot.data!)
                              return QiblahCompass();
                            else
                              return Text('Maps');
                          },
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
