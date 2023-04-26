import 'package:chefkart/constants/assets.dart';
import 'package:chefkart/constants/colors.dart';
import 'package:chefkart/screen/dish_details_screen.dart';
import 'package:chefkart/widget/widget_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SelectDishScreen extends StatefulWidget {
  const SelectDishScreen({super.key});

  @override
  State<SelectDishScreen> createState() => _SelectDishScreemState();
}

class _SelectDishScreemState extends State<SelectDishScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              // Get.back();
            },
          ),
          title: Text(
            'Select Dishes',
            style: TextStyle(
              color: primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WidgetHeader(),
                  SizedBox(
                    height: 20.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: Row(
                        children: const [
                          WidgetSubCategory(
                            title: 'Italian',
                            isSelected: true,
                          ),
                          WidgetSubCategory(
                            title: 'Indian',
                            isSelected: false,
                          ),
                          WidgetSubCategory(
                            title: 'Indian',
                            isSelected: false,
                          ),
                          WidgetSubCategory(
                            title: 'Indian',
                            isSelected: false,
                          ),
                          WidgetSubCategory(
                            title: 'Indian',
                            isSelected: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Text(
                      'Popular Dishes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: Row(
                        children: const [
                          WidgetStatusView(
                            title: 'Biryani',
                            imagePath: dummy,
                            isSelected: false,
                          ),
                          WidgetStatusView(
                            title: 'Biryani',
                            imagePath: dummy,
                            isSelected: true,
                          ),
                          WidgetStatusView(
                            title: 'Biryani',
                            imagePath: dummy,
                            isSelected: true,
                          ),
                          WidgetStatusView(
                            title: 'Biryani',
                            imagePath: dummy,
                            isSelected: true,
                          ),
                          WidgetStatusView(
                            title: 'Biryani',
                            imagePath: dummy,
                            isSelected: true,
                          ),
                          WidgetStatusView(
                            title: 'Biryani',
                            imagePath: dummy,
                            isSelected: true,
                          ),
                          WidgetStatusView(
                            title: 'Biryani',
                            imagePath: dummy,
                            isSelected: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Divider(
                    thickness: 3,
                    color: Color(0xffF2F2F2),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Recommended',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            SvgPicture.asset(
                              icArrowDown,
                              height: 6.h,
                              width: 6.w,
                            ),
                          ],
                        ),
                        Container(
                          width: 56.w,
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(9.w),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: const Offset(0, 3),
                                blurRadius: 4,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Menu',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const WidgetIItemList(),
                  const WidgetIItemList(),
                  const WidgetIItemList(),
                  const WidgetIItemList(),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
            Container(
              height: 40.h,
              margin: EdgeInsets.only(bottom: 10.h, left: 40.w, right: 40.w),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(
                  7.sp,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.09),
                    offset: const Offset(0, 3),
                    blurRadius: 9,
                  )
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(icFood),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      '3 food items selected',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: whiteColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetIItemList extends StatelessWidget {
  const WidgetIItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Masala Muglai',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    SvgPicture.asset(
                      icVeg,
                      height: 9.h,
                      width: 9.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const WidgetRating()
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            icRefrigerator,
                            height: 14.h,
                            width: 8.w,
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            'Refrigerator',
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 6.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            icRefrigerator,
                            height: 14.h,
                            width: 8.w,
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            'Refrigerator',
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 6.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      const VerticalDivider(),
                      SizedBox(
                        width: 15.w,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const DishDetailsScreen(), transition: Transition.fadeIn);
                        },
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ingredients',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'View list',
                                  style: TextStyle(
                                    color: orangeColor,
                                    fontSize: 7.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 1.5.w,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 7.sp,
                                  color: orangeColor,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Chicken fried in deep tomato sauce with delicious spices ',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.h,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Image.asset(
                  dummy,
                  height: 68.h,
                  width: 92.w,
                ),
              ),
              Positioned(
                bottom: 2,
                left: 0,
                right: 0,
                child: Container(
                  width: 58.w,
                  margin: EdgeInsets.fromLTRB(19.w, 50.h, 19.w, 0),
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.w),
                    border: Border.all(color: orangeColor, width: 0.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        offset: const Offset(0, 3),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(
                        Icons.add,
                        size: 9.sp,
                        color: orangeColor,
                      ),
                      Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: orangeColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class WidgetHeader extends StatelessWidget {
  const WidgetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 42.h,
          color: primaryColor,
        ),
        Container(
          height: 63.h,
          margin: EdgeInsets.fromLTRB(23.w, 20.w, 23.h, 0),
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(9.w),
            boxShadow: const [
              BoxShadow(
                color: Color(0xffD6D6D6),
                offset: Offset(0, 1),
                blurRadius: 4,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icDate,
                    height: 16.23,
                    width: 16.23,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '21 May 2021',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              const VerticalDivider(
                color: greyColor,
              ),
              SizedBox(
                width: 10.w,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    icTime,
                    height: 16.23,
                    width: 16.23,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '10:30 Pm-122:30 Pm',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetSubCategory extends StatelessWidget {
  const WidgetSubCategory({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76.w,
      height: 24.h,
      margin: EdgeInsets.fromLTRB(0, 0, 16.w, 0),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isSelected ? lightOrangeColor : whiteColor,
        border: Border.all(color: isSelected ? orangeColor : greyColor),
        borderRadius: BorderRadius.circular(100.w),
        boxShadow: isSelected
            ? const [
          BoxShadow(
            color: Color(0xffFFF9F2),
            offset: Offset(0, 3),
            blurRadius: 6,
          )
        ]
            : [],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? orangeColor : greyColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class WidgetStatusView extends StatelessWidget {
  const WidgetStatusView({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
  });

  final String title;
  final String imagePath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
      padding: isSelected ? EdgeInsets.all(2.sp) : EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? lightOrangeColor : whiteColor,
        border: Border.all(color: isSelected ? orangeColor : greyColor),
      ),
      child: Container(
        width: 57.w,
        height: 57.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? lightOrangeColor : whiteColor,
          border: Border.all(color: isSelected ? orangeColor : greyColor),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color(0xff1C1C1C).withOpacity(0.6),
              BlendMode.multiply,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: whiteColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
