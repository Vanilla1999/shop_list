import 'package:shop_list/data/datasources/hive_repo.dart';
import 'package:shop_list/data/hive_objects/product_hive.dart';
import 'package:shop_list/data/hive_objects/shop_hive.dart';
import 'package:shop_list/data/hive_objects/shop_hive.dart';
import 'package:shop_list/data/models/product.dart';
import 'package:shop_list/data/models/shop.dart';

abstract class ShopRepo {
  Future<List<Shop>> getShopList();

  Future<void> saveShopList(List<Shop> shops);
}

class ShopRepoImpl extends ShopRepo {
  final HiveRepo hiveRepo;

  ShopRepoImpl({required this.hiveRepo})

  @override
  Future<List<Shop>> getShopList() async {
    final shops = await hiveRepo.getShopsFromDb();
    return shops.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> saveShopList(List<Shop> shops) {
    // TODO: implement saveShopList
    throw UnimplementedError();
  }
}

extension ShopHiveMap on ShopHive {
  Shop toEntity() =>
      Shop(id, icon, name, products.map((e) => e.toEntity()).toList());
}
extension ProductHiveMap on ProductHive {
  Product toEntity() => Product(id, name, weight, type);
}
