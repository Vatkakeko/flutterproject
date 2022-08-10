import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/auth_controller.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/account_widget.dart';
import 'package:food_delivery_app/widgets/app_icons.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimension.height20),
        child: Column(children: [
          AppIcon(
            icon: Icons.person,
            backgroundColor: AppColors.mainColor,
            iconSize: Dimension.height30 + Dimension.height45,
            size: Dimension.height15 * 10,
            iconColor: Colors.white,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5),
                    bigText: BigText(
                      text: "Lucifer",
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5),
                    bigText: BigText(
                      text: "Contact",
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5),
                    bigText: BigText(
                      text: "Email",
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5),
                    bigText: BigText(
                      text: "Address",
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5),
                    bigText: BigText(
                      text: "Message",
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  GestureDetector(
                    onTap: (){
                      if(Get.find<AuthController>().userLoggedIn()){
                        Get.find<AuthController>().clearShareData();
                        Get.find<CartController>().clear();
                        Get.find<CartController>().clearCartHistory();
                        Get.offNamed(RouteHelper.getSignInPage());
                      }else{
                        print("You logged out");
                      }
                    },
                    child: AccountWidget(
                    appIcon: AppIcon(
                        icon: Icons.logout,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimension.height10 * 5 / 2,
                        size: Dimension.height10 * 5),
                    bigText: BigText(
                      text: "Logout",
                    ),
                  ),

                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
