import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boiler_plate/actions/auth_actions.dart';
import 'package:flutter_boiler_plate/actions/internet_connectivity_actions.dart';
import 'package:flutter_boiler_plate/app_routes.dart';
import 'package:flutter_boiler_plate/data/api_client.dart';
import 'package:flutter_boiler_plate/data/app_repository.dart';
import 'package:flutter_boiler_plate/data/database_client.dart';
import 'package:flutter_boiler_plate/data/preferences_client.dart';
import 'package:flutter_boiler_plate/generated/i18n.dart';
import 'package:flutter_boiler_plate/middleware/middleware.dart';
import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:flutter_boiler_plate/reducer/reducers.dart';
import 'package:flutter_boiler_plate/utils/app_theme.dart';
import 'package:flutter_boiler_plate/view/initial_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  final ApiClient apiClient = new ApiClient();

  final PreferencesClient preferencesClient = new PreferencesClient(
    client: await SharedPreferences.getInstance(),
  );

  final DatabaseClient databaseClient =
      new DatabaseClient(sqflite: new Sqflite());

  final AppRepository repository = new AppRepository(
    apiClient: apiClient,
    preferencesClient: preferencesClient,
    databaseClient: databaseClient,
  );

  runApp(new App(repository: repository));
}

class App extends StatefulWidget {
  final AppRepository repository;
  final Store<AppState> store;

  App({Key key, this.repository})
      : store = new Store<AppState>(
          reducer,
          initialState: AppState.initState(),
          middleware: createMiddleware(repository),
        ),
        super(key: key);

  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  Store<AppState> store;

  //for internet connectivity
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    store = widget.store;
    init();
  }

  void init() async {
    // await for initial connection listener.
    await initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      store.dispatch(new GetConnectivityStatus(result));
    });
    store.dispatch(new CheckForUserInPrefs());
//    store.dispatch(new CreateDatabase());
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: new MaterialApp(
          title: 'Hinch',
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
            fontFamily: 'OpenSans',
            primaryColor: AppColors.themeColor,
            accentColor: AppColors.accentColor,
            scaffoldBackgroundColor: AppColors.bgColor,
          ),
          localizationsDelegates: const <
              LocalizationsDelegate<WidgetsLocalizations>>[S.delegate],
          supportedLocales: S.delegate.supportedLocales,
          routes: <String, WidgetBuilder>{
            AppRoutes.initialRoute: (BuildContext context) => new InitialPage(),
          },
        ));
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<Null> initConnectivity() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final ConnectivityResult result = await _connectivity.checkConnectivity();
      store.dispatch(new GetConnectivityStatus(result));
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }
}
