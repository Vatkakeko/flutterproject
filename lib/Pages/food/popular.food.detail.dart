import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/main_food_page.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';
import 'package:food_delivery_app/widgets/Icons_and_test_widget.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icons.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Device Width:" + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimension.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/food1.png"))),
              )),
          
          Positioned(
            top: Dimension.height45,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.to(()=>MainFoodPage());
                    },
                    child: 
                  AppIcon(icon: Icons.arrow_back_ios)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                
                ]),
          ),
          Positioned(
             left: 0,
              right: 0,
              bottom: 0,
              top: Dimension.popularFoodImgSize - 70,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimension.width20,
                      right: Dimension.width20,
                      top: Dimension.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.radius20),
                          topLeft: Radius.circular(Dimension.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: "Chinese Side",
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      BigText(text: "Introduce"),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text:
                                  "sdfdsjkfdshfkjhdskfkdsjdsufgsdfjdskhjdkjdsklfjhldsfkjdhfsdkljfhdskjhsdkfjdhsfjlkdhslksdskjfhdskjfhdskjfhdsjkfhsdkjfhdskjfhdskjlfhdskfjhsdfskjdskjfhdskjfhds sdfdsjkfdshfkjhdskfkdsjdsufgsdfjdskhjdkjdsklfjhldsfkjdhfsdkljfhdskjhsdkfjdhsfjlkdhslksdskjfhdskjfhdskjfhdsjkfhsdkjfhdskjfhdskjlfhdskfjhsdfskjdskjfhdskjfhdssdfdsjkfdshfkjhdskfkdsjdsufgsdfjdskhjdkjdsklfjhldsfkjdhfsdkljfhdskjhsdkfjdhsfjlkdhslksdskjfhdskjfhdskjfhdsjkfhsdkjfhdskjfhdskjlfhdskfjhsdfskjdskjfhdskjfhdssdfdsjkfdshfkjhdskfkdsjdsufgsdfjdskhjdkjdsklfjhldsfkjdhfsdkljfhdskjhsdkfjdhsfjlkdhslksdskjfhdskjfhdskjfhdsjkfhsdkjfhdskjfhdskjlfhdskfjhsdfskjdskjfhdskjfhdssdfdsjkfdshfkjhdskfkdsjdsufgsdfjdskhjdkjdsklfjhldsfkjdhfsdkljfhdskjhsdkfjdhsfjlkdhslksdskjfhdskjfhdskjfhdsjkfhsdkjfhdskjfhdskjlfhdskfjhsdfskjdskjfhdskjfhdssdfdsjkfdshfkjhdskfkdsjdsufgsdfjdskhjdkjdsklfjhldsfkjdhfsdkljfhdskjhsdkfjdhsfjlkdhslksdskjfhdskjfhdskjfhdsjkfhsdkjfhdskjfhdskjlfhdskfjhsdfskjdskjfhdskjfhdssdfdsjkfdshfkjhdskfkdsjdsufgsdfjdskhjdkjdsklfjhldsfkjdhfsdkljfhdskjhsdkfjdhsfjlkdhslksdskjfhdskjfhdskjfhdsjkfhsdkjfhdskjfhdskjlfhdskfjhsdfskjdskjfhdskjfhdssdfdsjkfdshfkjhdskfkdsjdsufgsdfjdskhjdkjdsklfjhldsfkjdhfsdkljfhdskjhsdkfjdhsfjlkdhslksdskjfhdskjfhdskjfhdsjkfhsdkjfhdskjfhdskjlfhdskfjhsdfskjdskjfhdskjfhdssdfdsjkfdshfkjhdskfkdsjdsufgsdfjdskhjdkjdsklfjhldsfkjdhfsdkljfhdskjhsdkfjdhsfjlkdhslksdskjfhdskjfhdskjfhdsjkfhsdkjfhdskjfhdskjlfhdskfjhsdfskjdskjfhdskjfhdssdfdsjkfdshfkjhdskfkdsjdsufgsdfjdskhjdkjdsklfjhldsfkjdhfsdkljfhdskjhsdkfjdhsfjlkdhslksdskjfhdskjfhdskjfhdsjkfhsdkjfhdskjfhdskjlfhdskfjhsdfskjdskjfhdskjfhds"),
                        ),
                      )
                    ],
                  )))
        ],

      ),
      bottomNavigationBar: Container(
        height: Dimension.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimension.height30,
            bottom: Dimension.height30,
            left: Dimension.width20,
            right: Dimension.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.radius20 * 2),
                topRight: Radius.circular(Dimension.radius20 * 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: EdgeInsets.only(
              top: Dimension.height20,bottom: Dimension.height20,left: Dimension.width20,right: Dimension.width20
            )),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 5,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimension.width10 / 5,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
              top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              child: BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: AppColors.mainColor,
              ) ,
              ),
          ],
        ),
      ),
    );
  }
}