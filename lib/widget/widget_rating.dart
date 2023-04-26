import 'package:chefkart/constants/assets.dart';
import 'package:chefkart/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetRating extends StatelessWidget {
  const WidgetRating({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rating,
            style: TextStyle(color: whiteColor, fontSize: 7.sp),
          ),
          SizedBox(
            width: 3.w,
          ),
          SvgPicture.asset(
            icStar,
            height: 4.h,
            width: 4.w,
          ),
        ],
      ),
    );
  }
}
