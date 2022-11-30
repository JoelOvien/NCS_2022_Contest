// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';

import 'base_repository.dart';

class PreferenceRepository extends BaseRepository {
  Future<Box> get _box async {
    final box = await Hive.openBox('preferences');
    return box;
  }

  Future<void> put(String key, dynamic value) async {
    final box = await _box;
    return box.put(key, value);
  }

  Future<dynamic> get(String key, {dynamic defaultValue}) async {
    final box = await _box;
    return box.get(key, defaultValue: defaultValue);
  }

  @override
  Future<void> clear() async {
    await _box.then((box) => box.clear());
  }
}
