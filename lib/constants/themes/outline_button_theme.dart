import 'package:flutter/material.dart';

import '../const_widgets/color.dart';
import '../const_widgets/size.dart';

class TOutlineButtonTheme{
TOutlineButtonTheme._();

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      side: const BorderSide(color: tSecondaryColor),
      padding:  const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  static final darkOutlineButtonTheme = OutlinedButtonThemeData(

    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      side: const BorderSide(color: tWhiteColor),
      padding:  const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );



}