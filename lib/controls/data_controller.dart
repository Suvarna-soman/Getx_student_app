import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/user.dart';
import '../repository/box_repository.dart';

class DataController extends GetxController {
  late Box<User> _observableBox;
  Box get observableBox => _observableBox;
  int get userCount => _observableBox.length;

  @override
  void onInit() {
    super.onInit();
    _initBox();
  }

  _initBox() async {
    _observableBox = await BoxRepository.openBox();
    update();
  }

  createUser({required User user}) async {
    await _observableBox.add(user);
    update();
  }

  updateUser({
    required int index,
    user,
  }) async {
    await _observableBox.putAt(index, user);
    update();
  }

  deleteUser(int index) {
    _observableBox.deleteAt(index);
    update();
  }
}
