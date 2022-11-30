// ignore_for_file: avoid_setters_without_getters, depend_on_referenced_packages

import 'package:hive_flutter/hive_flutter.dart';

import '../../modules/authentication/domains/entities/user_entity.dart';

class DbConfig {
  static bool _hasInit = false;

  Future<void> init() async {
    if (!_hasInit) {
      // Avoid initializing hive multiple times

      // initialize hive database
      await Hive.initFlutter();

      // register adapters
      Hive.registerAdapter(UserEntityAdapter());

      _hasInit = true;
    }
  }

  set hasInit(bool init) => _hasInit = init;
}
