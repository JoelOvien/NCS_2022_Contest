import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ChangeNotifierProvider<FieldVieweProvider> fieldViewProvider =
    ChangeNotifierProvider((res) => FieldVieweProvider(ref: res));

class FieldVieweProvider extends ChangeNotifier {
  FieldVieweProvider({required this.ref});
  Ref ref;

  bool _cameraOnline = false;

  bool get cameraOnline => _cameraOnline;

  set cameraOnline(bool value) {
    _cameraOnline = value;
    notifyListeners();
  }
}
