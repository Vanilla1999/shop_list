import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shop_list/data/datasources/retrofit_client.dart';
import 'package:shop_list/presentation/app/shop_app.dart';
import 'data/datasources/hive_repo.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
 await initialData();
  runApp(const ShopApp());
}

Future<void> initialData() async {
  final hiveRepo = HiveRepo();
  await hiveRepo.init();
  await hiveRepo.clearDataBase();
  await hiveRepo.saveShops(await RestClientMock().getShops());
}
