import 'package:flutter/material.dart';
import 'package:shop_list/navigation/main_navigation.dart';
import 'package:shop_list/tools/app_colors.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainNavigation.initialRoute,
      onGenerateRoute: MainNavigation().onGenerateRoute,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.startGradient,
        ),
        scaffoldBackgroundColor: AppColors.mainBackgroundScreen,
      ),
    );
  }
}
