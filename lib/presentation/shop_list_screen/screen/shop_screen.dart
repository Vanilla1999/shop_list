import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shop_list/presentation/shop_list_screen/widgets/filter_widget.dart';
import 'package:shop_list/tools/app_colors.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: FilterWidget(),
        ),
      ),
    );
  }
}
