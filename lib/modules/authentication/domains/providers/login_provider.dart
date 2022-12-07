// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utilities/custom_navigator.dart';
import '../../../nav_bar/views/widgets/nav_bar_widget.dart';
import '../../views/profile_setup.dart';

ChangeNotifierProvider<LoginProvider> loginProvider =
    ChangeNotifierProvider((ref) => LoginProvider(ref: ref));

class LoginProvider extends ChangeNotifier {
  LoginProvider({required this.ref});
  Ref ref;

  bool _passVisible = false;
  bool _loading = false;

  bool get loading => _loading;
  bool get passVisible => _passVisible;

  set passVisible(bool state) {
    _passVisible = state;
    notifyListeners();
  }

  set loading(bool state) {
    _loading = state;
    notifyListeners();
  }

  dynamic login(
    BuildContext context, {
    required String username,
    required String password,
    bool routeAfter = true,
  }) async {
    loading = true;
    await Future.delayed(const Duration(seconds: 2));

    loading = false;

    CustomNavigator.routeForEver(context, NavBarWidget.routeName);
  }

  dynamic reg(
    BuildContext context,
  ) async {
    loading = true;
    await Future.delayed(const Duration(seconds: 2));

    loading = false;
    CustomNavigator.route(context, ProfileSetupPage.routeName);
  }
}
