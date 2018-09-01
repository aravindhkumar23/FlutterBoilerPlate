import 'package:flutter_boiler_plate/actions/auth_actions.dart';
import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> authReducer = combineReducers(<Reducer<AppState>>[
  new TypedReducer<AppState, LoginUser>(setLoginLoading),
  new TypedReducer<AppState, SaveUser>(setUser),
  new TypedReducer<AppState, SetErrorLoggingIn>(errLogin),

]);

AppState setLoginLoading(AppState state, LoginUser action) {
  final AppStateBuilder b = state.toBuilder();
  b..isLoggingIn = true;
  return b.build();
}

AppState setUser(AppState state, SaveUser action) {
  final AppStateBuilder b = state.toBuilder();
  b
    ..isLoggingIn = false
    ..currentUser = action.user?.toBuilder();
  return b.build();
}

AppState errLogin(AppState state, SetErrorLoggingIn action) {
  final AppStateBuilder b = state.toBuilder();
  b
    ..isLoggingIn = false
    ..errMsg = action.error;
  return b.build();
}
