import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_list/data/hive_objects/product_hive.dart';
import 'package:shop_list/data/hive_objects/shop_hive.dart';

class HiveRepo {
  Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
    Hive.registerAdapter(ShopHiveAdapter());
    Hive.registerAdapter(ProductHiveAdapter());
  }

  void saveShops(List<ShopHive> listShops) async {
    var box = await Hive.openBox<ShopHive>('shops');
    box.addAll(listShops);
  }

  Future<List<ShopHive>> getShopsFromDb() async {
    var box = await Hive.openBox<ShopHive>('shops');
    return box.values.toList();
  }

  Future<List<ProductHive>> getProductsFromDb() async {
    var box = await Hive.openBox<ProductHive>('product');
    return box.values.toList();
  }
}
