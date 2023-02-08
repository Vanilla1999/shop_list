import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_list/data/hive_objects/product_hive.dart';
import 'package:shop_list/data/hive_objects/shop_hive.dart';
import 'package:shop_list/data/hive_objects/type_hive.dart';

class HiveRepo {
  Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
    Hive.registerAdapter(ShopHiveAdapter());
    Hive.registerAdapter(ProductHiveAdapter());
    Hive.registerAdapter(TypeHiveAdapter());
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

  Future<void> saveTypes(List<TypeHive> listTypes) async {
    Box<TypeHive> typeBox;
    if (!Hive.isBoxOpen('types')) {
      typeBox = await Hive.openBox<TypeHive>('types');
    } else {
      typeBox = Hive.box<TypeHive>('types');
    }
    typeBox.addAll(listTypes);
  }

  Future<List<TypeHive>> getTypesFromDb() async {
    Box<TypeHive> typeBox;
    if (!Hive.isBoxOpen('types')) {
      typeBox = await Hive.openBox<TypeHive>('types');
    } else {
      typeBox = Hive.box('types');
    }
    return typeBox.values.toList();
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
    Box typeBox;
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
    if (!Hive.isBoxOpen('types')) {
      typeBox = await Hive.openBox<TypeHive>('types');
    } else {
      typeBox = Hive.box('types');
    }
    await boxShop.clear();
    await typeBox.clear();
    await boxProduct.clear();
  }
}
