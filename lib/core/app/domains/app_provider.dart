// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/app_constants.dart';
import '../../../utilities/helpers.dart';
import '../../../utilities/service_locator.dart';
import '../db.dart';
import '../repositories/preference_repository.dart';

ChangeNotifierProvider<AppProvider> appProvider =
    ChangeNotifierProvider((ref) => AppProvider(ref: ref));

class AppProvider extends ChangeNotifier {
  AppProvider({this.ref});
  Ref? ref;
  bool _isLogged = false;

  bool get isLogged => _isLogged;

  Future<void> initialise(BuildContext context) async {
    await locator.get<DbConfig>().init();

    _isLogged = await locator.get<PreferenceRepository>().get(
          AppConstants.isLoggedIn,
          defaultValue: false,
        );
  }

  Future<void> goHome(BuildContext context) async {
    // final rawUser = await locator.get<UserRepository>().getUser();

    // ignore: unnecessary_null_comparison
    try {
      await setup(context);
      // await Navigator.pushNamedAndRemoveUntil(context, Dashboard.routeName, (route) => false);
    } catch (e) {
      Helpers.logc(e.toString());
      resetUser();
      await locator.get<PreferenceRepository>().put(AppConstants.isLoggedIn, false);
      Helpers.logc("route to login");
    }
  }

  // Future<void> onLogin(User user, BuildContext context, {bool shouldSetup = true}) async {
  //   _user = user;
  //   if (shouldSetup) {
  //     await setup(context);
  //   }
  //   return;
  // }

  Future<void> setup(BuildContext context) async {
    try {} catch (e) {
      Helpers.log("here $e");
    }
  }

  void resetUser() {
    _isLogged = false;
  }
}
