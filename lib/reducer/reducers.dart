

import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:flutter_boiler_plate/reducer/auth_reducer.dart';
import 'package:flutter_boiler_plate/reducer/internet_connectivity_reducer.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  authReducer,
  interentConnectivityReducer,
]);
