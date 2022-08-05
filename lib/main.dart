import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/cart/cart_page.dart';
import 'package:food_delivery_app/Pages/food/popular.food.detail.dart';
import 'package:food_delivery_app/Pages/home/foot_page_body.dart';
import 'package:food_delivery_app/Pages/splash/splash_page.dart';
import 'package:food_delivery_app/helper/my_https_provider.dart';
import 'package:food_delivery_app/Pages/home/main_food_page.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:food_delivery_app/helper/dependecies.dart' as dep;

import 'controller/popular_product_controller.dart';
import 'controller/recommended_product_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = await new MyHttpOverrides();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
   return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
         return GetMaterialApp(
            title: 'Flutter Demo',

            debugShowCheckedModeBanner: false,
            //home: MainFoodPage(),
            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes,
            
          );
      });
   });
  }
}
