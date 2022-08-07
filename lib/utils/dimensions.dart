import 'dart:ui';
import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.14;
  static double pageViewContainer = screenHeight / 3.106;
  static double pageTextContainer = screenHeight / 5.7;

  static double height10 = screenHeight / 68.4;
  static double height15 = screenHeight / 45.6;
  static double height20 = screenHeight / 34.2;
  static double height30 = screenHeight / 22.8;
  static double height45 = screenHeight / 15.2;

  static double width10 = screenHeight / 68.4;
  static double width15 = screenHeight / 45.6;
  static double width20 = screenHeight / 34.2;
  static double width30 = screenHeight / 22.8;

  static double font20 = screenHeight / 34.2;
  static double font26 = screenHeight / 28.2;
  static double font16 = screenHeight / 42.75;

  static double radius15 = screenHeight / 45.6;
  static double radius20 = screenHeight / 34.2;
  static double radius30 = screenHeight / 22.8;

  static double iconSize24 = screenHeight / 28.5;
  static double iconSize16 = screenHeight / 45.75;

  static double listViewImgSize = screenWidth / 3.43;
  static double listViewTextContSize = screenWidth / 4.12;

  static double popularFoodImgSize = screenHeight / 1.95;
//bottom height
  static double bottomHeightBar = screenHeight / 5.7;
//splashscreen dimension
static double splashImg = screenHeight/3.83;
}
