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

  Future<void> saveShops(List<ShopHive> listShops) async {
    Box<ShopHive> boxShop;
    Box<ProductHive> boxProduct;
    if (!Hive.isBoxOpen('shops')) {
      boxShop = await Hive.openBox<ShopHive>('shops');
    } else {
      boxShop = Hive.box<ShopHive>('shops');
    }
    if (!Hive.isBoxOpen('product')) {
      boxProduct = await Hive.openBox<ProductHive>('product');
    } else {
      boxProduct = Hive.box<ProductHive>('product');
    }
    for (var shop in listShops) {
      boxProduct.addAll(shop.products);
    }
    boxShop.addAll(listShops);
  }

  Future<List<ShopHive>> getShopsFromDb() async {
    Box<ShopHive> boxShop;
    if (!Hive.isBoxOpen('shops')) {
      boxShop = await Hive.openBox<ShopHive>('shops');
    } else {
      boxShop = Hive.box('shops');
    }
    return boxShop.values.toList();
  }

  Future<List<ProductHive>> getProductsFromDb() async {
    Box<ProductHive> boxProduct;
    if (!Hive.isBoxOpen('product')) {
      boxProduct = await Hive.openBox<ProductHive>('product');
    } else {
      boxProduct = Hive.box('product');
    }
    return boxProduct.values.toList();
  }

  Future<void> clearDataBase() async {
    Box boxShop;
    Box boxProduct;
    if (!Hive.isBoxOpen('shops')) {
      boxShop = await Hive.openBox<ShopHive>('shops');
    } else {
      boxShop = Hive.box('shops');
    }
    if (!Hive.isBoxOpen('product')) {
      boxProduct = await Hive.openBox<ProductHive>('product');
    } else {
      boxProduct = Hive.box('product');
    }
    boxProduct = await Hive.openBox<ProductHive>('product');
    await boxShop.clear();
    await boxProduct.clear();
  }
}
