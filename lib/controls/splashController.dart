import 'package:get/get.dart';

import '../screens/home_page.dart';

class SplashController extends GetxController{
  static SplashController get find => Get.find();

  RxBool animate = false.obs;
  Future startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value= true;
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.to(const HomePage());

  }

}