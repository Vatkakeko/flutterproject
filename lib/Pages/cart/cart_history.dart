import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icons.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String,int> CardItemPerOrder = Map();
    for(int i=0;i<getCartHistoryList.length;i++){
      if(CardItemPerOrder.containsKey(getCartHistoryList[i].time)){
        CardItemPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      }else{
        CardItemPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cardOrderTimeToList(){
      return CardItemPerOrder.entries.map((e) => e.value).toList();
    }
    List<int> itemsPerOder = cardOrderTimeToList();

    /* for(int x=0;x<CardItemPerOrder.length;x++){
      for(int y=0;y<orderTimes[x];y++){
        print("My order is "+getCartHistoryList[saveCounter++].toString());
      }
    } */
    var listCounter=0;
    return Scaffold(
    
      body: Column(
        children: [
          Container(
            height: 100,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              BigText(text: "Cart History",color: Colors.white,),
              AppIcon(icon: Icons.shopping_cart_outlined,
                      iconColor: AppColors.mainColor,
                      backgroundColor: AppColors.yellowColor,
                      ),
              
            ]),
          ),
      
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimension.height20,
                left: Dimension.width20,
                right: Dimension.width20
              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context, child: ListView(
                children: [
                  for(int i=0;i<CardItemPerOrder.length; i++)
        
                  Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: Dimension.height20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ((){
                          DateTime parseDate = DateFormat( "yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
                          var inputDate = DateTime.parse(parseDate.toString());
                          var outputFormat = DateFormat( "MM/dd/yyyy hh:mm a");
                          var outputDate = outputFormat.format(inputDate);
                          return BigText(text: outputDate);
                        }()),
                        SizedBox(height: Dimension.height10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              direction: Axis.horizontal,
                              children: List.generate(itemsPerOder[i], (index){
                                if(listCounter<getCartHistoryList.length){
                                  listCounter++;
                                }
                                return index<=2?Container(
                                  height: 80,
                                  width: 80,
                                  margin: EdgeInsets.only(right: Dimension.width10/2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimension.radius15/2),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter].img!
                                      )
                                   )),
                                ):Container();
                              
                                
                                }),
                            ),
                          
                            Container(
                              
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmallText(text: "Total"),
                                  BigText(text: itemsPerOder[i].toString()+" Items",color: AppColors.titleColor),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: Dimension.width10,
                                    vertical: Dimension.height10/2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimension.radius15/3),
                                      border: Border.all(width: 1,color: AppColors.mainColor),
                                    ),
                                    child: SmallText(text: "one more",color: AppColors.mainColor,),
                                  )
                                ]),

                            ),
                          ],
                        )
                      ]
                      ),
                      
                  )
                ],
              ),)
            ),
          )
      ]),
    );
  }
}