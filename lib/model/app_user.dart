import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_user.g.dart';

abstract class AppUser implements Built<AppUser, AppUserBuilder> {
  factory AppUser([AppUserBuilder updates(AppUserBuilder builder)]) = _$AppUser;

  AppUser._();

  factory AppUser.initState() {
    return new AppUser((AppUserBuilder b) {
      b
        ..uid = ''
        ..name = ''
        ..role = ''
        ..userId = 0
        ..profileId = 0
        ..accessToken = ''
        ..client = '';
    });
  }

  String get uid;

  String get name;

  String get role;

  @BuiltValueField(wireName: 'user_id')
  int get userId;

  @BuiltValueField(wireName: 'profile_id')
  int get profileId;

  @nullable
  String get accessToken;

  @nullable
  String get client;

  static Serializer<AppUser> get serializer => _$appUserSerializer;
}
