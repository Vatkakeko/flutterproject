import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/Icons_and_test_widget.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

import '../utils/dimensions.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      BigText(text: text,size: Dimension.font26,),
     SizedBox(
      height: Dimension.height10,
      ),
      Row(
      children: [
      Wrap(
      children: List.generate(5,
      (index) => Icon(
        Icons.star,
          color: AppColors.mainColor,
          size: 15,
    )),
 ),
      SizedBox(
      width: 10,
      ),
      SmallText(text: "4.5"),
    SizedBox(
    width: 10,
    ),
   SmallText(text: "1287"),
   SizedBox(
    width: 10,
    ),
    SmallText(text: "comment")
    ],
    ),
      SizedBox(
    height: Dimension.height20,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
     IconAndTextWidget(
      icon: Icons.circle,
      text: "Normal",
      iconColor: AppColors.iconColor1),
      IconAndTextWidget(
     icon: Icons.location_on,
      text: "1.7km",
      iconColor: AppColors.mainColor),
      IconAndTextWidget(
      icon: Icons.access_time_rounded,
      text: "32min",
     iconColor: AppColors.iconColor2)
    ],
    ),
   ],
   );
  }
}