import 'package:flutter_pat_shop/data/remote/UserAPI.dart';
import 'package:flutter_pat_shop/repo/UserRepo.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpViewModel extends Model {
  static SignUpViewModel? _instance;

  static getInstace() {
    if (_instance == null) {
      _instance = SignUpViewModel();
    }
    return _instance;
  }

  UserRepo userRepo = UserAPI();
  String? message;

  /*
   * nếu sđt chưa tồn tại thì trả về true & ngược lại
   */
  Future<bool> updateMessage(String userPhone) async {
    final result = await userRepo.signUpByPhoneNumber(userPhone);
    if (result == null) {
      message = "There was a problem, please try again!";
    } else if (!result) {
      message = "This phone number is already in use by someone!";
    } else {
      message = null;
    }
    notifyListeners();
    return result ?? false;
  }
}
