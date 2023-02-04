import 'package:hive/hive.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:shop_list/data/hive_objects/product_hive.dart';
import 'package:shop_list/data/hive_objects/shop_hive.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  RestClient();

  factory RestClient.Rest(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/shops")
  Future<List<ShopHive>> getShops();
}

class RestClientMock extends RestClient {
  @override
  Future<List<ShopHive>> getShops() async {
    await Future.delayed(const Duration(seconds: 1));
    final productBox = await Hive.openBox("product");
    final productListMagnit = HiveList(productBox, objects: [
      const ProductHive(id: 0, name: "Banan", weight: 10.0, type: "Food"),
      const ProductHive(id: 1, name: "Beer", weight: 11.0, type: "Drinks"),
      const ProductHive(
          id: 2, name: "Metal Gear", weight: 12.0, type: "Gaming"),
      const ProductHive(id: 3, name: "Ender", weight: 13.0, type: "3D"),
      const ProductHive(id: 4, name: "T-shirt", weight: 10.0, type: "Clothes"),
    ]);
    final productListFixPrice = HiveList(productBox, objects: [
      const ProductHive(id: 5, name: "Banan1", weight: 1.0, type: "Food"),
      const ProductHive(id: 6, name: "Beer1", weight: 5, type: "Drinks"),
      const ProductHive(
          id: 7, name: "Metal Gear1", weight: 132.0, type: "Gaming"),
      const ProductHive(id: 3, name: "Ender1", weight: 113.0, type: "3D"),
      const ProductHive(
          id: 8, name: "T-shirt1", weight: 140.0, type: "Clothes"),
    ]);
    final productListSevenEleven = HiveList(productBox, objects: [
      const ProductHive(id: 9, name: "Banan2", weight: 10.0, type: "Food"),
      const ProductHive(id: 10, name: "Beer2", weight: 11.0, type: "Drinks"),
      const ProductHive(
          id: 11, name: "Metal Gear2", weight: 12.0, type: "Gaming"),
      const ProductHive(id: 3, name: "Ender2", weight: 13.0, type: "3D"),
      const ProductHive(
          id: 12, name: "T-shirt2", weight: 10.0, type: "Clothes"),
    ]);
    final productsTabris = HiveList(productBox, objects: [
      const ProductHive(id: 13, name: "Banan3", weight: 10.0, type: "Food"),
      const ProductHive(id: 14, name: "Beer3", weight: 6.0, type: "Drinks"),
      const ProductHive(
          id: 15, name: "Metal Gear3", weight: 7.0, type: "Gaming"),
      const ProductHive(id: 3, name: "Ender3", weight: 13.0, type: "3D"),
      const ProductHive(
          id: 16, name: "T-shirt3", weight: 10.0, type: "Clothes"),
    ]);
    final productsPyatorka = HiveList(productBox, objects: [
      const ProductHive(id: 17, name: "Banan4", weight: 10.0, type: "Food"),
      const ProductHive(id: 18, name: "Beer4", weight: 81.0, type: "Drinks"),
      const ProductHive(
          id: 19, name: "Metal Gear4", weight: 12.0, type: "Gaming"),
      const ProductHive(id: 3, name: "Ender4", weight: 13.0, type: "3D"),
      const ProductHive(
          id: 20, name: "T-shirt4", weight: 10.0, type: "Clothes"),
    ]);
    await productBox.close();
    return [
      ShopHive(
          id: 0, icon: "magnit", name: "Magnit", products: productListMagnit),
      ShopHive(
        id: 1,
        icon: "fix_price",
        name: "fix_price",
        products: productListFixPrice,
      ),
      ShopHive(
          id: 2,
          icon: "seven_eleven",
          name: "seven_eleven",
          products: productListSevenEleven),
      ShopHive(id: 3, icon: "tabris", name: "tabris", products: productsTabris),
      ShopHive(
          id: 4,
          icon: "pyatorochka",
          name: "pyatorochka",
          products: productsPyatorka),
    ];
  }
}