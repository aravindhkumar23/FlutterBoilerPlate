import 'package:flutter_boiler_plate/data/app_repository.dart';
import 'package:flutter_boiler_plate/middleware/auth_middleware.dart';
import 'package:flutter_boiler_plate/middleware/internet_connectivity_middleware.dart';
import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleware(AppRepository repository) =>
    <List<Middleware<AppState>>>[
      new AuthMiddleware(repository: repository).getMiddleware(),
      new InternetConnectivityMiddleware(repository: repository)
          .getMiddleware(),
    ].expand((List<Middleware<AppState>> middleware) => middleware).toList();
