import 'dart:async';
import 'dart:convert';
import 'package:flutter_boiler_plate/model/app_user.dart';
import 'package:flutter_boiler_plate/model/serializers.dart';
import 'package:http/http.dart';

class ApiRoutes {
  //dev pointing
  static const String domain = 'http://192.168.0.52:3000';
  static const String apiUrl = '$domain/api/v1/';
  static const String login = 'user/login';
}

class ApiClient {
  final Client api = new Client();

  Future<AppUser> signInWithEmailAndPassword(
      String email, String password) async {
    final Uri uri = Uri.parse(ApiRoutes.apiUrl + ApiRoutes.login);
    final MultipartRequest request = new MultipartRequest('POST', uri);
    request.fields['email'] = email;
    request.fields['password'] = password;

//    final Response response = await Response.fromStream(await request.send());

    //for testing assign init user
    return AppUser.initState();

//    if (response.statusCode == 201) {
//      //valid used login success
//      final Map<String, dynamic> data =
//          json.decode(response.body)['user'].cast<String, dynamic>();
//      final AppUserBuilder b =
//          serializers.deserializeWith(AppUser.serializer, data).toBuilder();
//      b
//        ..accessToken = response.headers['access-token']
//        ..client = response.headers['client'];
//      return b.build();
//    } else if (response.statusCode == 200) {
//      throw '${json.decode(response.body)['error']}';
//    } else {
//      throw 'Error login';
//    }
  }
}
