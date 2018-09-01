import 'dart:async';

import 'package:flutter_boiler_plate/actions/auth_actions.dart';
import 'package:flutter_boiler_plate/actions/database_actions.dart';
import 'package:flutter_boiler_plate/data/app_repository.dart';
import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:flutter_boiler_plate/model/app_user.dart';
import 'package:redux/redux.dart';

class AuthMiddleware {
  final AppRepository repository;
  String registrationToken = '';

  AuthMiddleware({this.repository}) {
  }

  List<Middleware<AppState>> getMiddleware() {
    return <Middleware<AppState>>[
      new TypedMiddleware<AppState, CheckForUserInPrefs>(checkForUserInPrefs),
      new TypedMiddleware<AppState, LoginUser>(login),
      new TypedMiddleware<AppState, LogOutUser>(_logOutUser),
    ];
  }

  void checkForUserInPrefs(Store<AppState> store, CheckForUserInPrefs action,
      NextDispatcher next) async {
    next(action);
    try {
      final AppUser user = await repository.getUserFromPrefs();
      if (user != null) {
        store.dispatch(new SaveUser(user: user));
        afterLogin(store);
      }
    } catch (e) {
      return;
    }
  }

  Future<Map<String, String>> getHeader(AppUser appUser) async {
    return <String, String>{
      'access-token': appUser.accessToken,
      'Uid': appUser.uid,
      'Client': appUser.client,
      'Content-Type': 'application/json'
    };
  }

  Future<void> afterLogin(Store<AppState> store) async {
    //after login perform action here like this
//    store.dispatch(new GetInspectionData());
  }

  void login(
      Store<AppState> store, LoginUser action, NextDispatcher next) async {
    next(action);
    try {
      final AppUser user = await repository.signInWithEmailAndPassword(
          email: action.username, password: action.password);
      store.dispatch(new SaveUser(user: user));
      //on Login Success create Db
      store.dispatch(new CreateDatabase());
      afterLogin(store);
    } catch (e) {
      store.dispatch(new SetErrorLoggingIn(error: e.toString()));
      action.onError(e.toString());
    }
  }

  void _logOutUser(
      Store<AppState> store, LogOutUser action, NextDispatcher next) async {
    next(action);
    await repository.logOut();
    store.dispatch(new SaveUser());
  }

}
