import 'package:food_delivery_app/data/repository/auth_repo.dart';
import 'package:food_delivery_app/model/response_model.dart';
import 'package:food_delivery_app/model/sign_up_body_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResposeModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResposeModel resposeModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      resposeModel = ResposeModel(true, response.body["token"]);
    } else {
      resposeModel = ResposeModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return resposeModel;
  }
  Future<ResposeModel> login(String email, String password) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    late ResposeModel resposeModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      resposeModel = ResposeModel(true, response.body["token"]);
    } else {
      resposeModel = ResposeModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return resposeModel;
  }
  void saveUserNumberAndPassword(String number, String password){
    authRepo.saveUserNumberAndPassword(number, password);
  }
  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }
  bool clearShareData(){
    return authRepo.clearSharedData();
  }
  
}
