import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:muslim_prayer/app/const/praypageicon/praypage_icon.dart';
import 'package:muslim_prayer/app/routes/app_pages.dart';
import 'package:muslim_prayer/app/theme/color_theme.dart';
import 'package:muslim_prayer/app/theme/font_theme.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

import '../controllers/home_controller.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          PrayPageIcon.icSubuhPng,
                          height: 35.w,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Subuh',
                                style: FontTheme.semibold.copyWith(
                                    fontSize: 10.sp,
                                    color: ColorTheme.pureWhite)),
                            Text('04:35',
                                style: FontTheme.regular.copyWith(
                                    fontSize: 8.sp,
                                    color: ColorTheme.pureWhite)),
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                                color: ColorTheme.pureWhite,
                                borderRadius: BorderRadius.circular(4.r)),
                            child: SvgPicture.asset(
                              PrayPageIcon.icLocationSvg,
                              height: 19.w,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.QIBLAHDIRECTION);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                  color: ColorTheme.pureWhite,
                                  borderRadius: BorderRadius.circular(4.r)),
                              child: Image.asset(
                                PrayPageIcon.icKabahPng,
                                height: 19.w,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          PrayPageIcon.icDhuhurPng,
                          height: 35.w,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dzuhur',
                                style: FontTheme.semibold.copyWith(
                                    fontSize: 10.sp,
                                    color: ColorTheme.pureWhite)),
                            Text('11:45',
                                style: FontTheme.regular.copyWith(
                                    fontSize: 8.sp,
                                    color: ColorTheme.pureWhite)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.w,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                      color: ColorTheme.whiteGray,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.w),
                      child: Column(
                        children: [
                          ...List.generate(
                              5,
                              (index) => IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Expanded(
                                                child: index == 0 || index == 5
                                                    ? const SizedBox()
                                                    : VerticalDivider(
                                                        color: ColorTheme
                                                            .lightGray
                                                            .withOpacity(0.1),
                                                        width: 2.w,
                                                        thickness: 2.w,
                                                      )),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 4.w),
                                              child: index == 0
                                                  ? ClipOval(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(6.w),
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: ColorTheme
                                                              .pureYellow,
                                                        ),
                                                        child: ClipOval(
                                                          child: Container(
                                                            height: 6.w,
                                                            width: 6.w,
                                                            decoration: const BoxDecoration(
                                                                color: ColorTheme
                                                                    .pureWhite),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Padding(
                                                      padding:
                                                          EdgeInsets.all(2.w),
                                                      child: ClipOval(
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.w),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorTheme
                                                                .pureYellow
                                                                .withOpacity(
                                                                    0.25),
                                                          ),
                                                          child: ClipOval(
                                                            child: Container(
                                                              height: 6.w,
                                                              width: 6.w,
                                                              decoration: const BoxDecoration(
                                                                  color: ColorTheme
                                                                      .pureYellow),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                            Expanded(
                                              child: VerticalDivider(
                                                color: ColorTheme.lightGray
                                                    .withOpacity(0.1),
                                                width: 2.w,
                                                thickness: 2.w,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 24.w,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 8.w),
                                            padding: EdgeInsets.all(12.w),
                                            decoration: BoxDecoration(
                                                color: ColorTheme.pureWhite,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.r)),
                                            child: Row(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        color: ColorTheme
                                                            .whiteGray,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r)),
                                                    padding:
                                                        EdgeInsets.all(4.w),
                                                    child: Image.asset(
                                                      PrayPageIcon.icSubuhPng,
                                                      height: 35.w,
                                                      width: 35.w,
                                                    )),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Subuh',
                                                        style: FontTheme
                                                            .semibold
                                                            .copyWith(
                                                                fontSize: 14.sp,
                                                                color: ColorTheme
                                                                    .pureBlack),
                                                      ),
                                                      Text(
                                                        '04:35',
                                                        style: FontTheme.regular
                                                            .copyWith(
                                                                fontSize: 10.sp,
                                                                color: ColorTheme
                                                                    .pureBlack),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  PrayPageIcon
                                                      .icNotificationSvg,
                                                  height: 24.w,
                                                  colorFilter: index == 0
                                                      ? const ColorFilter.mode(
                                                          ColorTheme.pureYellow,
                                                          BlendMode.srcIn)
                                                      : null,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
        radius: const Radius.circular(12),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(0, size.height - 12),
        radius: const Radius.circular(12),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(12, size.height),
        radius: const Radius.circular(12),
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
