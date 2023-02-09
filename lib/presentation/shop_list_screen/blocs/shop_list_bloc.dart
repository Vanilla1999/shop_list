import 'package:bloc/bloc.dart';
import 'package:shop_list/data/datasources/hive_repo.dart';
import 'package:shop_list/data/datasources/retrofit_client.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/data/repository/shop_repo.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_event.dart';
import 'package:shop_list/data/models/type.dart';
import 'shop_list_state.dart';

class ShopListBloc extends Bloc<ShopListEvents, ShopListState> {
  final RestClientMock apiClient = RestClientMock();
  final ShopRepo databaseRepo = ShopRepoImpl(hiveRepo: HiveRepo());
  List<Shop> shops = [];
  List<Type> listType = [];
  String productName = '';
  String productWeight = '';

  ShopListBloc() : super(const ShopListState.loading()) {
    on<ShopListEvents>((event, emit) async {
      await event.when(
          filterType:
              (productName, productWeight, productType, shopList)  {
                listType = productType;
            emit(ShopListState.success(
                shopList: shopList,
                typeList: listType,
                textWeight: productWeight,
                textName: productName));
          },
          initialData: () async {
            final List<Shop> shopList = await databaseRepo.getShopList();
            final List<Type> typeList = await databaseRepo.getTypeList();
            shops = shopList;
            listType = typeList;
            emit(ShopListState.success(
                shopList: shopList,
                typeList: typeList,
                textName: productName,
                textWeight: ""));
          },
          filterName: (String productName) {
            productName = productName;
            emit(ShopListState.success(
                shopList: shops,
                typeList: listType,
                textName: productName,
                textWeight: productWeight.toString()));
          },
          filterWeight: (String productWeight) {
            productWeight = productWeight;
            emit(ShopListState.success(
                shopList: shops,
                typeList: listType,
                textName: productName,
                textWeight: productWeight.toString()));
          });
    });
  }
}
