import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ChangeNotifierProvider<FarmProvider> farmProvider =
    ChangeNotifierProvider((res) => FarmProvider(ref: res));

class FarmProvider extends ChangeNotifier {
  FarmProvider({required this.ref});
  Ref ref;
  int index = 0;
  bool irrigate = false;
  List<Map<String, dynamic>> farmValues = [
    {
      "title": "Fruit",
      "value": "0",
      "unit": "mm",
      "irrigate": false,
      "camera": false,
    },
    {
      "title": "Vegetable",
      "value": "0",
      "unit": "mm",
      "irrigate": false,
      "camera": false,
    },
    {
      "title": "Grains",
      "value": "0",
      "unit": "mm",
      "irrigate": false,
      "camera": false,
    },
    {
      "title": "Corn",
      "value": "0",
      "unit": "mm",
      "irrigate": false,
      "camera": false,
    },
  ];

  void switchTo(int newIndex) {
    if (newIndex == 0) {}
    index = newIndex;
    notifyListeners();
  }

  void switchIrrigation(bool newState) {
    farmValues[index]['irrigate'] = newState;
    notifyListeners();
  }
}
