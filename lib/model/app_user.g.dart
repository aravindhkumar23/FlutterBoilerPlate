// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<AppUser> _$appUserSerializer = new _$AppUserSerializer();

class _$AppUserSerializer implements StructuredSerializer<AppUser> {
  @override
  final Iterable<Type> types = const [AppUser, _$AppUser];
  @override
  final String wireName = 'AppUser';

  @override
  Iterable serialize(Serializers serializers, AppUser object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(String)),
      'user_id',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'profile_id',
      serializers.serialize(object.profileId,
          specifiedType: const FullType(int)),
    ];
    if (object.accessToken != null) {
      result
        ..add('accessToken')
        ..add(serializers.serialize(object.accessToken,
            specifiedType: const FullType(String)));
    }
    if (object.client != null) {
      result
        ..add('client')
        ..add(serializers.serialize(object.client,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  AppUser deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new AppUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'profile_id':
          result.profileId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'accessToken':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'client':
          result.client = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppUser extends AppUser {
  @override
  final String uid;
  @override
  final String name;
  @override
  final String role;
  @override
  final int userId;
  @override
  final int profileId;
  @override
  final String accessToken;
  @override
  final String client;

  factory _$AppUser([void updates(AppUserBuilder b)]) =>
      (new AppUserBuilder()..update(updates)).build();

  _$AppUser._(
      {this.uid,
      this.name,
      this.role,
      this.userId,
      this.profileId,
      this.accessToken,
      this.client})
      : super._() {
    if (uid == null) throw new BuiltValueNullFieldError('AppUser', 'uid');
    if (name == null) throw new BuiltValueNullFieldError('AppUser', 'name');
    if (role == null) throw new BuiltValueNullFieldError('AppUser', 'role');
    if (userId == null) throw new BuiltValueNullFieldError('AppUser', 'userId');
    if (profileId == null)
      throw new BuiltValueNullFieldError('AppUser', 'profileId');
  }

  @override
  AppUser rebuild(void updates(AppUserBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppUserBuilder toBuilder() => new AppUserBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! AppUser) return false;
    return uid == other.uid &&
        name == other.name &&
        role == other.role &&
        userId == other.userId &&
        profileId == other.profileId &&
        accessToken == other.accessToken &&
        client == other.client;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, uid.hashCode), name.hashCode),
                        role.hashCode),
                    userId.hashCode),
                profileId.hashCode),
            accessToken.hashCode),
        client.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppUser')
          ..add('uid', uid)
          ..add('name', name)
          ..add('role', role)
          ..add('userId', userId)
          ..add('profileId', profileId)
          ..add('accessToken', accessToken)
          ..add('client', client))
        .toString();
  }
}

class AppUserBuilder implements Builder<AppUser, AppUserBuilder> {
  _$AppUser _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _role;
  String get role => _$this._role;
  set role(String role) => _$this._role = role;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  int _profileId;
  int get profileId => _$this._profileId;
  set profileId(int profileId) => _$this._profileId = profileId;

  String _accessToken;
  String get accessToken => _$this._accessToken;
  set accessToken(String accessToken) => _$this._accessToken = accessToken;

  String _client;
  String get client => _$this._client;
  set client(String client) => _$this._client = client;

  AppUserBuilder();

  AppUserBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _name = _$v.name;
      _role = _$v.role;
      _userId = _$v.userId;
      _profileId = _$v.profileId;
      _accessToken = _$v.accessToken;
      _client = _$v.client;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppUser other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$AppUser;
  }

  @override
  void update(void updates(AppUserBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppUser build() {
    final _$result = _$v ??
        new _$AppUser._(
            uid: uid,
            name: name,
            role: role,
            userId: userId,
            profileId: profileId,
            accessToken: accessToken,
            client: client);
    replace(_$result);
    return _$result;
  }
}
