import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_first_getx_app/screens/user_welcome.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  late Rx<User?> firebaseUser;

  String? get user => firebaseUser.value?.email;

  @override
  void onInit() {
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.authStateChanges());
    super.onInit();
  }

  void createUser(String userName, String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Get.offAll(const UserWelcomePage());
    } catch (e) {
      Get.snackbar("Success", "Create Account successfully");
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(const UserWelcomePage());
    } catch (e) {
      Get.snackbar("Error", "Invalid Email or Password");
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
