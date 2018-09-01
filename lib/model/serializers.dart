import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_boiler_plate/model/app_user.dart';

part 'serializers.g.dart';

@SerializersFor(const <Type>[
  AppUser,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
