import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ChangeNotifierProvider<NavBarProvider> navBarProvider =
    ChangeNotifierProvider((res) => NavBarProvider(ref: res));

class NavBarProvider extends ChangeNotifier {
  NavBarProvider({required this.ref});
  Ref ref;
  int index = 0;

  void switchTo(int newIndex) {
    if (newIndex == 0) {}
    index = newIndex;
    notifyListeners();
  }
}
