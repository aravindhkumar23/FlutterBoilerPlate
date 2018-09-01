import 'dart:convert';

import 'package:flutter_boiler_plate/model/app_user.dart';
import 'package:flutter_boiler_plate/model/serializers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesClient {
  final SharedPreferences client;

  PreferencesClient({this.client});

  void saveUser(AppUser appUser) {
    if (appUser == null) {
      client.setString('appUser', null);
      return null;
    }
    final dynamic user = serializers.serializeWith(AppUser.serializer, appUser);
    final String userString = json.encode(user);
    client.setString('appUser', userString);
  }

  AppUser getUser() {
    final String userString = client.getString('appUser');
    if (userString == null) {
      return null;
    }
    final dynamic user = json.decode(userString);
    return serializers.deserializeWith(AppUser.serializer, user);
  }
}
