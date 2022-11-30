import 'package:smart_irrigation/utilities/asset_path_util.dart';

class AppConstants {
  static const String isLoggedIn = "is_logged_in";
  static const String email = "email";
  static const String password = "password";

  static List<Map<String, dynamic>> barItems = [
    {"imagePath": SvgAssetPath.home, "title": "Home"},
    {"imagePath": SvgAssetPath.dashboard, "title": "Dashboard"},
    {"imagePath": SvgAssetPath.locationPin, "title": "Field View"},
    {"imagePath": SvgAssetPath.settings, "title": "Setting"},
  ];
}
