// // ignore_for_file: depend_on_referenced_packages

// import 'package:hive/hive.dart';
// class UserRepository extends BaseRepository {
//   Future<Box<UserEntity>> get _box async {
//     final box = await Hive.openBox<UserEntity>(UserEntity.tableName);
//     return box;
//   }

//   Future<UserEntity?> getUser() async {
//     final box = await _box;
//     return box.get(UserEntity.localId);
//   }

//   Future<UserEntity?> setUser({
//     required Map<String, dynamic> userData,
//   }) async {
//     // ignore: unused_local_variable
//     final oldUser = await getUser();

//     final UserEntity newUser = UserEntity(userData: userData, uuid: userData["id"]);
//     final box = await _box;
//     await box.put(UserEntity.localId, newUser);
//     return newUser;
//   }

//   @override
//   Future<void> clear() async {
//     await _box.then((box) => box.clear());
//   }
// }
