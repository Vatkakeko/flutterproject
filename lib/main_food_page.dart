import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/home/foot_page_body.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPage();
}

class _MainFoodPage extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 45,bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Phnom Penh", color: AppColors.mainColor,),
                    Row(
                      children: [
                        SmallText(text: "Nasingdi", color: Colors.black54,),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
                Center(
                  child:Container(
                  width: 45,
                  height: 45,
                  child: Icon(Icons.search, color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.mainColor,
                  ),
                ),
                )
                
              ],
            ),
          ),
        ),
        FoodPageBody(),
      ],
    ));

  }
}
