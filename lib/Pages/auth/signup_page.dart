import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/base/show_custom_snackbar.dart';
import 'package:food_delivery_app/controller/auth_controller.dart';
import 'package:food_delivery_app/model/sign_up_body_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in Your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in Your Phone number", title: "Phone Number");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in Your Email address", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",
            title: "valid Email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in Your Password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password cannot be less than six characters",
            title: "Password");
      } else {
        SignUpBody signUpBody = new SignUpBody(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success registration");
          } else {
            showCustomSnackBar(status.message);
          }
        });
        print(signUpBody.toString());
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
              ? SingleChildScrollView(
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
                            backgroundImage:
                                AssetImage("assets/image/logo1.png"),
                          ),
                        ),
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
                        hintText: "Password",
                        icon: Icons.password_sharp,isObscure: true,
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      AppTextField(
                        textEditingController: nameController,
                        hintText: "Name",
                        icon: Icons.person,
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      AppTextField(
                        textEditingController: phoneController,
                        hintText: "Phone",
                        icon: Icons.phone,
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      RichText(
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text: "already have an account?",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimension.font16)),
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
                        },
                        child: Container(
                          width: Dimension.screenWidth / 2,
                          height: Dimension.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius30),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: "Sign Up",
                              size: Dimension.font20 + Dimension.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimension.height10,
                      ),
                      // Sign up option
                      RichText(
                        text: TextSpan(
                            text:
                                "Sign up using the one of the following methods",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimension.font16)),
                      ),
                      Wrap(
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: Dimension.radius30,
                                      backgroundImage: AssetImage(
                                          "assets/image/" +
                                              signUpImages[index]),
                                    ),
                                  ))),
                      SizedBox(
                        height: Dimension.screenHeight * 0.05,
                      ),
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
