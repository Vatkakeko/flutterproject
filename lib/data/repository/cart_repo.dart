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
  void addToCartList(List<CartModel> cartList){
    cart=[];
    
    cartList.forEach((element)=>cart.add(jsonEncode(element)));
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
}