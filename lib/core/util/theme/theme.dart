import 'package:flutter/material.dart';

import '../color_manager/color_manager.dart';

ThemeData  themeData = ThemeData(
          colorSchemeSeed: ColorManager.primaryColor,
          scaffoldBackgroundColor: ColorManager.backgroundScaffold,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: ColorManager.whiteColor , fontSize: 20, fontWeight: FontWeight.bold),
            backgroundColor: ColorManager.backgroundScaffold,
            elevation: 0,
            iconTheme: IconThemeData(color: ColorManager.whiteColor),
          ),
          textTheme: const TextTheme(
           bodyLarge: TextStyle(color: ColorManager.whiteColor , fontSize: 20, fontWeight: FontWeight.bold),
           titleMedium: TextStyle(color: ColorManager.whiteColor , fontSize: 18, fontWeight: FontWeight.bold),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: ColorManager.backgroundScaffold,
            selectedItemColor: ColorManager.primaryColor,
            unselectedItemColor: ColorManager.whiteColor),
        );