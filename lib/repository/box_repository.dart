import 'package:hive/hive.dart';

import '../model/user.dart';

class BoxRepository {
  static const String boxUsers = "CRUD";

  static  Future<Box<User>> openBox() async => await Hive.openBox<User>(boxUsers);

  static Future<Box<User>> getBox() async => Hive.box<User>(boxUsers);

  static Future<void> closeBox() async => Hive.close();
}
