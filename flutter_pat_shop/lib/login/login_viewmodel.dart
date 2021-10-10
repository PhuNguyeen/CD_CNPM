import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  final _phoneNumberSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();
  final _buttonLoginSubject = BehaviorSubject<bool>();

  Stream<String> get phoneNumberStream => _phoneNumberSubject.stream;

  Sink<String> get phoneNumberSink => _phoneNumberSubject.sink;

  Stream<String> get passwordStream => _passwordSubject.stream;

  Sink<String> get passwordSink => _passwordSubject.sink;

  //nếu như chưa điền đủ tài khoản và mật khẩu thì nút đăng nhập sẽ không sáng
  Stream<bool> get buttonLoginStream => CombineLatestStream.combine2(
      _phoneNumberSubject, _passwordSubject, (phone, password) {
        if(phone.toString() != "" && password != ""){
          return true;
        }
        return false;
  });

  dispose() {
    _phoneNumberSubject.close();
    _passwordSubject.close();
    _buttonLoginSubject.close();
  }
}
