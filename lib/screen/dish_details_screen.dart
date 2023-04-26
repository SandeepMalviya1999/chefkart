import 'package:chefkart/constants/assets.dart';
import 'package:chefkart/constants/colors.dart';
import 'package:chefkart/controller/api_controller.dart';
import 'package:chefkart/widget/widget_rating.dart';
import 'package:chefkart/widget/widget_screen_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DishDetailsScreen extends StatefulWidget {
  const DishDetailsScreen({super.key, required this.dishID});

  final int dishID;

  @override
  State<DishDetailsScreen> createState() => _DishDetailsScreenState();
}

class _DishDetailsScreenState extends State<DishDetailsScreen> {
  final _apiController = ApiController.to;

  @override
  void initState() {
    _apiController.fetchDishDetails(dishID: widget.dishID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
          statusBarIconBrightness: Brightness.dark,
          // For Android (dark icons)
          statusBarBrightness: Brightness.light, // F
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          iconSize: 14.sp,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        if (_apiController.isLoadingDishDetails()) {
          return const WidgetLoadingScreen();
        }

        final dishDetails = _apiController.dishDetailModel();

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Positioned(
                    right: -75,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 215.w,
                          height: 150.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFFF9F2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${dishDetails?.name}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                const WidgetRating(
                                  rating: '4.2',
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 130.w),
                              child: Text(
                                'Mughlai Masala is a style of cookery developed in the Indian Subcontinent by the imperial kitchens of the Mughal Empire.',
                                style: TextStyle(
                                  color: const Color(0xffA3A3A3),
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 26.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  icClockHour,
                                  height: 13.h,
                                  width: 13.w,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  '${dishDetails?.timeToPrepare}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Color(0xffF2F2F2),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'Ingredients',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              'for 2 people',
                              style: TextStyle(
                                color: const Color(0xff8A8A8A),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 20,
                    right: -200,
                    child: Image.asset(
                      imgIngredients,
                      width: 325.w,
                      height: 175.h,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    const Divider(
                      thickness: 1.5,
                      color: Color(0xffF2F2F2),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Vegetables (${dishDetails?.ingredients?.vegetables?.length})',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        SvgPicture.asset(
                          icArrowDown,
                          height: 4.h,
                          width: 4.w,
                        ),
                      ],
                    ),
                    for (var item in dishDetails!.ingredients!.vegetables!)
                      WidgetListIngredientItem(
                        title: '${item.name}',
                        content: '${item.quantity}',
                      ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Spices (${dishDetails?.ingredients?.spices?.length})',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        SvgPicture.asset(
                          icArrowDown,
                          height: 4.h,
                          width: 4.w,
                        ),
                      ],
                    ),
                    for (var item in dishDetails.ingredients!.spices!)
                      WidgetListIngredientItem(
                        title: '${item.name}',
                        content: '${item.quantity}',
                      ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Appliances',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        for (var item in dishDetails.ingredients!.appliances!)
                          WidgetBuildRefrigerator(
                            applianceName: item.name.toString(),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class WidgetBuildRefrigerator extends StatelessWidget {
  const WidgetBuildRefrigerator({
    super.key,
    required this.applianceName,
  });

  final String applianceName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 21.w),
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(7.sp),
      ),
      child: Column(
        children: [
          Image.asset(
            imgRefrigerator,
            height: 55.h,
            width: 30.w,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            applianceName,
            style: TextStyle(
              color: primaryColor,
              fontSize: 8.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetListIngredientItem extends StatelessWidget {
  const WidgetListIngredientItem({
    super.key,
    required this.content,
    required this.title,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.sp,
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            content,
            style: TextStyle(color: Colors.black, fontSize: 10.sp),
          )
        ],
      ),
    );
  }
}
