import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../field_view/domains/providers/field_view_provider.dart';

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
      "Soil": "Loamy",
      "crop": "Apple, Orange, Grapes",
    },
    {
      "title": "Vegetable",
      "value": "0",
      "unit": "mm",
      "irrigate": false,
      "camera": false,
      "Soil": "Loamy",
      "crop": "Tomato, Cucumber, Carrot",
    },
    {
      "title": "Grains",
      "value": "0",
      "unit": "mm",
      "irrigate": false,
      "camera": false,
      "Soil": "Loamy",
      "crop": "Wheat, Rice, Millet",
    },
    {
      "title": "Corn",
      "value": "0",
      "unit": "mm",
      "irrigate": false,
      "camera": false,
      "Soil": "Loamy",
      "crop": "Corn",
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

  void switchCamera(bool newState) {
    farmValues[index]['camera'] = newState;
    if (farmValues[index]['camera']) {
      ref.read(fieldViewProvider).cameraOnline = true;
    } else {
      ref.read(fieldViewProvider).cameraOnline = false;
    }
    notifyListeners();
  }
}
