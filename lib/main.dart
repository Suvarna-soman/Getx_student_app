import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_first_getx_app/controls/authentication.dart';
import 'package:my_first_getx_app/model/user.dart';
import 'package:my_first_getx_app/repository/box_repository.dart';
import 'package:my_first_getx_app/screens/detail_page.dart';
import 'package:my_first_getx_app/screens/edit_account.dart';

import 'package:my_first_getx_app/screens/home_page.dart';
import 'package:my_first_getx_app/screens/new_account.dart';
import 'package:my_first_getx_app/screens/login_page.dart';
import 'package:my_first_getx_app/screens/signup_page.dart';
import 'package:my_first_getx_app/screens/splash_page.dart';
import 'package:get/get.dart';
import 'constants/themes/themes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   Hive.registerAdapter(UserAdapter());
   await BoxRepository.openBox();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return GetMaterialApp(
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/signup', page: () => const SignUpPage()),
        GetPage(name: '/new', page: () => const NewAccount()),
        GetPage(name: '/detail', page: () => const DetailPage()),
        GetPage(
          name: '/edit',
          page: () => const EditPage(),
        ),
      ],
    );
  }
}
