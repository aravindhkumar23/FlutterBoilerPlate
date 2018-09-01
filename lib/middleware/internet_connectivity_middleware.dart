import 'package:flutter_boiler_plate/actions/internet_connectivity_actions.dart';
import 'package:flutter_boiler_plate/data/app_repository.dart';
import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:redux/redux.dart';

class InternetConnectivityMiddleware {
  final AppRepository repository;

  InternetConnectivityMiddleware({this.repository});

  List<Middleware<AppState>> getMiddleware() {
    return <Middleware<AppState>>[
      new TypedMiddleware<AppState, GetConnectivityStatus>(
          onConnectivityChange),
    ];
  }

  void onConnectivityChange(Store<AppState> store, GetConnectivityStatus action,
      NextDispatcher next) async {
    next(action);
    try {
    } catch (e) {
      return;
    }
  }
}
