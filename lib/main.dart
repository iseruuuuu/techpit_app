import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techpit_app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techpit_app/model/data/login/login_user.dart';

final nameProvider = Provider(
  (_) => LoginUser(id: 'abcd1234', name: 'Taro'),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
