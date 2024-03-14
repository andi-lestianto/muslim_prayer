import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:muslim_prayer/app/const/prayicon/praypage_icon.dart';
import 'package:muslim_prayer/app/theme/color_theme.dart';
import 'package:muslim_prayer/app/theme/font_theme.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

import '../controllers/home_controller.dart';
import 'dart:math' as math;

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const SizedBox(),
                    Text(
                      'Prayer Time',
                      style: FontTheme.semibold.copyWith(
                          fontSize: 16.w, color: ColorTheme.pureWhite),
                    ),
                    SvgPicture.asset(PrayPageIcon.icInfoSvg)
                  ],
                ),
              ),
              SizedBox(
                height: 24.w,
              ),
              SemicircularIndicator(
                progress: 0.2,
                color: ColorTheme.pureYellow,
                bottomPadding: 0,
                backgroundColor: ColorTheme.secondaryGreen,
                child: Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        painter: MyPainter(),
                        size: Size(200, 100),
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
                height: 8.w,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(PrayPageIcon.icSubuhSvg),
                      Column(
                        children: [Text('Subuh')],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = ColorTheme.lightGreen;

    Path path = Path()
      ..moveTo(size.width / 2, size.height)
      ..lineTo(size.width - 12, size.height)
      ..arcToPoint(
        Offset(size.width, size.height - 12),
        radius: Radius.circular(12),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(0, size.height - 12),
        radius: Radius.circular(12),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(12, size.height),
        radius: Radius.circular(12),
        clockwise: false,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
