import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_getx_app/controls/authentication.dart';
import 'package:my_first_getx_app/screens/home_page.dart';

class UserWelcomePage extends GetWidget<AuthController> {
  const UserWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome Page"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.signOut();
                Get.offAll(() => const HomePage());
              }, icon: const Icon(Icons.logout),
            ),
          ],
        ),
      body: const Center(
        child: Text("Hello"),
      ),

    );
  }
}
