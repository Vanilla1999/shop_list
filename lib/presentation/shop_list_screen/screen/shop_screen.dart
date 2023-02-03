import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shop_list/presentation/shop_list_screen/widgets/filter_widget.dart';
import 'package:shop_list/presentation/shop_list_screen/widgets/shop_list_widget.dart';
import 'package:shop_list/tools/app_colors.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:  const [
              FilterWidget(),
              SizedBox(height: 20,),
              ShopListWidget()
            ],
          ),
        ),
      ),
    );
  }
}