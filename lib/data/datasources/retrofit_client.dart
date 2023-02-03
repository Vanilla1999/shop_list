
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:shop_list/data/hive_objects/shop_hive.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/shops")
  Future<List<ShopHive>> getShops();
}