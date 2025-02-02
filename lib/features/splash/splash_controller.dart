import 'package:financy_app/features/splash/splash_state.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:flutter/foundation.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;

  SplashController(this._service);

  SplashState _state = SplashStateInitial();

  SplashState get state => _state;

  void changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {    
    final result = await _service.readOne(key: "CURRENT_USER");

    if (result != null) {
      changeState(SplashStateSuccess());
    } else {
      changeState(SplashStateError());
    }
  }
}
