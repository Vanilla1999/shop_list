import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shop_list/presentation/app/shop_app.dart';
import 'data/datasources/hive_repo.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await HiveRepo().init();
  runApp(const ShopApp());
}
