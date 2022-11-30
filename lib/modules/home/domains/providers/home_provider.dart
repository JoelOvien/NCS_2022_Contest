import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ChangeNotifierProvider<HomeProvider> homeProvider =
    ChangeNotifierProvider((res) => HomeProvider(ref: res));

class HomeProvider extends ChangeNotifier {
  HomeProvider({required this.ref});
  Ref ref;
}
