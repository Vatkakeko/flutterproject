// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/Pages/cart/cart_page.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/popular_product_controller.dart';
import 'package:food_delivery_app/controller/recommended_product_controller.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icons.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  RecommendedFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recommendedProduct =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
        Get.find<PopularProductController>().initProduct(recommendedProduct,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(icon: Icons.clear)),
                      //AppIcon(icon: Icons.shopping_cart_outlined)
                      GetBuilder<PopularProductController>(builder: (controller){
                          return Stack(
                            children: [
                              AppIcon(icon: Icons.shopping_cart_outlined),
                              Get.find<PopularProductController>().totalItems>=1?
                                Positioned(
                                  right: 0,top: 0,
                                  child: GestureDetector(
                                    onTap: (){
                                      Get.to(()=>CartPage());
                                    },
                                    child: AppIcon(icon: Icons.circle,size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,),
                                  )
                                  ):
                                  Container(),
                                Get.find<PopularProductController>().totalItems>=1?
                                Positioned(
                                  right: 3,top: 3,
                                  child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                                    size: 12,
                                    color: Colors.white,
                                    ),
                                  ):
                                  Container()
                            ],
                          );
                        })

                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                
                child: Center(
                  child: BigText(
                      size: Dimension.font26,
                      text: recommendedProduct.name.toString()),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimension.radius20),
                        topRight: Radius.circular(Dimension.radius20))),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL +
                    AppConstants.UPLOAD_URL +
                    recommendedProduct.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Container(
                  child: ExpandableTextWidget(
                      text: recommendedProduct.description.toString()),
                  margin: EdgeInsets.only(
                      left: Dimension.width20, right: Dimension.width20)),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
              left: Dimension.width20 * 2.5,
              right: Dimension.width20 * 2.5,
              top: Dimension.height10,
              bottom: Dimension.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  controller.setQuantity(false);
                },
                child: AppIcon(
                  iconSize: Dimension.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove),
              ),
            BigText(
                text: "\$ ${recommendedProduct.price}  X  ${controller.inCartItems}",
                color: AppColors.mainBlackColor,
                size: Dimension.font26,
              ),
            GestureDetector(
                onTap: (){
                  controller.setQuantity(true);
                },
                child: AppIcon(
                  iconSize: Dimension.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add),
              )
            ],
          ),
        ),
        Container(
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.favorite,
                  color: AppColors.mainColor,
                ),
              ),
              GestureDetector(
                onTap: (){
                  controller.addItem(recommendedProduct);
                },
                child: Container(
                padding: EdgeInsets.only(
                    top: Dimension.height20,
                    bottom: Dimension.height20,
                    left: Dimension.width20,
                    right: Dimension.width20),
                child: BigText(
                  text: "\$ ${recommendedProduct.price} | Add to cart",
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: AppColors.mainColor,
                ),
              ),
              )
            ],
          ),
        ),
      ]);
    
      })
      );
  }
}
