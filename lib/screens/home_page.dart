import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_getx_app/constants/const_widgets/color.dart';
import 'package:my_first_getx_app/constants/const_widgets/image.dart';
import 'package:my_first_getx_app/constants/const_widgets/size.dart';
import 'package:my_first_getx_app/constants/const_widgets/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness =mediaQuery.platformBrightness;
    final isDarkMode =brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage(tHomePageImage),
              height: height * 0.6,
            ),
             Column(
              children: [
                Text(tWelcomeTitle.toUpperCase()),
                const Text(tWelcomeSubTitle, textAlign: TextAlign.center),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.toNamed( '/login');
                    },
                    child: Text(tLogin.toUpperCase()),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed( '/new');
                      },
                    child: Text(tNewOne.toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
