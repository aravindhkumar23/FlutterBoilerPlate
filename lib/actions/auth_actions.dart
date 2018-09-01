import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/model/app_user.dart';

class CheckForUserInPrefs {}

class LoginUser {
  final String username;
  final String password;

  final ValueChanged<String> onError;

  LoginUser({this.username, this.password, this.onError});
}

class LogOutUser {}

class SaveUser {
  final AppUser user;

  SaveUser({this.user});
}

class SetErrorLoggingIn {
  final String error;

  SetErrorLoggingIn({this.error});
}
