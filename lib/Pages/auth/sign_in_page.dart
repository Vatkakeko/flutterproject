import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/auth/signup_page.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimension.screenHeight * 0.05,
            ),
            Container(
              height: Dimension.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage("assets/image/logo1.png"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: Dimension.width20),
              child: Column(children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: Dimension.font20 * 3 + Dimension.font20 / 2,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
            ),

            AppTextField(
              textEditingController: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
            SizedBox(
              height: Dimension.height20,
            ),
            AppTextField(
              textEditingController: passwordController,
              hintText: "Email",
              icon: Icons.password_sharp,
            ),
            SizedBox(
              height: Dimension.height20,
            ),

            // Sign up option
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                      text: "Sign In to your Account",
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: Dimension.font16)),
                )
              ],
            ),
            SizedBox(
              height: Dimension.screenHeight * 0.05,
            ),
            Container(
              width: Dimension.screenWidth / 2,
              height: Dimension.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius30),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign In",
                  size: Dimension.font20 + Dimension.font20 / 2,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: Dimension.screenHeight * 0.05,
            ),
            RichText(
              text: TextSpan(
                text: "Don\'t have account?",
                style: TextStyle(
                    color: Colors.grey[500], fontSize: Dimension.font16),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => SignUpPage(),
                          transition: Transition.fade),
                    text: "Create",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                        fontSize: Dimension.font16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
