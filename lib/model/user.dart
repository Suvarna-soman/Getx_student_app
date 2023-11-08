import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String firstName;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  int age;

  @HiveField(3)
  int phoneNumber;

  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.phoneNumber,
  });
}
