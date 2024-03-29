import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/cart_model.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  
  List<String> cart=[];
  List<String> cartHistory=[];
  
  void addToCartList(List<CartModel> cartList){
     /*sharedPreferences.remove(AppConstants.CART_LIST);
     sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
     return;*/
    var time=DateTime.now().toString();
    cart=[];
    
    cartList.forEach((element){
      element.time = time;
      return cart.add(jsonEncode(element));
    });
    
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    getCartList();
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));  
    }
    List<CartModel> getCartList(){
      List<String> carts=[];
      if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
        carts= sharedPreferences.getStringList(AppConstants.CART_LIST)!;
        print("inside getCartList"+carts.toString());
      }
      List<CartModel> cartList=[];
      
      carts.forEach((element)=>cartList.add(CartModel.fromJson(jsonDecode(element))));
      return cartList;
    }

    List<CartModel> getCartHistoryList(){
      if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
        cartHistory=[];
        cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
      }
      List<CartModel> cardListHistory=[];
      cartHistory.forEach((element) =>cardListHistory.add(CartModel.fromJson(jsonDecode(element))));
      return cardListHistory;
    }

    void addToCartHistoryList(){
      if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
        cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
      }
      for(int i=0;i<cart.length;i++){
        print("history list"+cart[i]);
        cartHistory.add(cart[i]);
      }
      removeCart();
      sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
      print("The lenght of history list is "+getCartHistoryList().length.toString());
      for(int j=0;j<getCartHistoryList().length;j++){
        print("The time for the order is "+getCartHistoryList()[j].time.toString());
      }
    } 
    void removeCart(){
         cart=[];
         sharedPreferences.remove(AppConstants.CART_LIST);
    }
    void clearCartHistory(){
      removeCart();
      cartHistory=[];
      sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    }
}