import 'package:food_delivery_app/model/response_model.dart';
import 'package:food_delivery_app/model/user_model.dart';

import 'package:get/get.dart';

import '../data/repository/user_repo.dart';



class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  //UserController(this.userRepo);

  UserController({required this.userRepo});

  bool _isLoading = false;
  late UserModel _userModel;
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;
  Future<ResposeModel> getUserInfo() async {
  
    Response response = await userRepo.getUserInfo();
    late ResposeModel resposeModel;
    print("test"+response.body.toString());
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading=true;
        
      resposeModel = ResposeModel(true, "Succesfully");
    } else {
      resposeModel = ResposeModel(false, response.statusText!);
    }
    
    update();
    return resposeModel;
  }
}