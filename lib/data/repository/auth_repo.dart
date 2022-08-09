import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/model/sign_up_body_model.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.RGISTRATION_URI, signUpBody.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);

    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
