import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/food/popular.food.detail.dart';
import 'package:food_delivery_app/Pages/home/foot_page_body.dart';
<<<<<<< HEAD
=======
import 'package:food_delivery_app/controller/popular_product_controller.dart';
>>>>>>> 72038e6fda826c8b1d7348a7c463032566ed8159
import 'package:food_delivery_app/main_food_page.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:food_delivery_app/helper/dependecies.dart' as dep;

<<<<<<< HEAD
import 'controller/popular_product_controller.dart';
import 'controller/recommended_product_controller.dart';
=======
>>>>>>> 72038e6fda826c8b1d7348a7c463032566ed8159
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      //home: PopularFoodDetail(),
    );
  }
}
