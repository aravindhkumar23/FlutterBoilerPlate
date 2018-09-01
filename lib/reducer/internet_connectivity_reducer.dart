import 'package:connectivity/connectivity.dart';
import 'package:flutter_boiler_plate/actions/internet_connectivity_actions.dart';
import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> interentConnectivityReducer =
    combineReducers(<Reducer<AppState>>[
  new TypedReducer<AppState, GetConnectivityStatus>(getConnectivity),
]);

AppState getConnectivity(AppState state, GetConnectivityStatus action) {
  final AppStateBuilder b = state.toBuilder();
  if (action.result == ConnectivityResult.mobile ||
      action.result == ConnectivityResult.wifi) {
    b..isInternetConnected = true;
  } else {
    b..isInternetConnected = false;
  }
  return b.build();
}
