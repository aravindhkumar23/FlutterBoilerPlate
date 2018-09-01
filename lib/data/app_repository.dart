import 'dart:async';

import 'package:flutter_boiler_plate/data/api_client.dart';
import 'package:flutter_boiler_plate/data/database_client.dart';
import 'package:flutter_boiler_plate/data/preferences_client.dart';
import 'package:flutter_boiler_plate/model/app_user.dart';


class AppRepository {
  final ApiClient apiClient;
  final PreferencesClient preferencesClient;
  final DatabaseClient databaseClient;

  AppRepository({this.apiClient, this.preferencesClient, this.databaseClient});

  // Signin user with email and password return Appuser data if success else thows at api_client
  Future<AppUser> signInWithEmailAndPassword(
      {String email, String password}) async {
    final AppUser appUser =
        await apiClient.signInWithEmailAndPassword(email, password);
    preferencesClient.saveUser(appUser);
    return appUser;
  }

  // get Appuser data from shared preference called at initial state.
  Future<AppUser> getUserFromPrefs() async {
    return preferencesClient.getUser();
  }

  Future<AppUser> logOut() async {
    preferencesClient.saveUser(null);
    await closeDatabase();
    databaseClient.deleteLocalDatabase();
    return null;
  }

  // Close database
  Future<void> closeDatabase() async {
    databaseClient.closeDatabaseInstance();
  }

  //Opens database and create table
  Future<void> openDatabase() async {
    await databaseClient.create();
    await databaseClient.open();
    return null;
  }
}
