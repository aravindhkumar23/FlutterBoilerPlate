import 'package:built_value/built_value.dart';
import 'package:flutter_boiler_plate/model/app_user.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([AppStateBuilder updates(AppStateBuilder builder)]) =
      _$AppState;

  AppState._();

  static AppState initState() {
    return new AppState((AppStateBuilder b) {
      b
        ..isLoggingIn = false
        ..isLoading = false;
    });
  }

  // login state ***************************************************************************
  bool get isLoggingIn;

  // indicates loading state ***************************************************************************
  bool get isLoading;

  // is conneted to interenet default to false
  @nullable
  bool get isInternetConnected;

  //  get userDetails;
  @nullable
  AppUser get currentUser;

  // store error msg
  @nullable
  String get errMsg;
}
