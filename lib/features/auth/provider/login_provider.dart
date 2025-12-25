import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{

  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;

  bool _confirPasswordVisibility = true;
  bool get confirPasswordVisibility => _confirPasswordVisibility;

  bool _keepMeLoggedIn = false;
  bool get keepMeLoggedIn => _keepMeLoggedIn;

  TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;

  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController get confirmPassword => _confirmPassword;

  bool _createHouseHold = true;
  bool get createHouseHold => _createHouseHold;

  void changeCreateHouseHold(val){
    _createHouseHold = val;
    notifyListeners();
  }




void changeVisibility(key){
  if(key=="password"){
    _passwordVisibility =!passwordVisibility;
  }else if(key == "confirm-password"){
 _confirPasswordVisibility = !confirPasswordVisibility;
  }
 
  notifyListeners();
}

void changeLogin(){
  _keepMeLoggedIn = !keepMeLoggedIn;
  notifyListeners();
}



}