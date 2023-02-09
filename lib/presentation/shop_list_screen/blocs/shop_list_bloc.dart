import 'package:bloc/bloc.dart';
import 'package:shop_list/data/datasources/hive_repo.dart';
import 'package:shop_list/data/datasources/retrofit_client.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/data/models/shop_data.dart';
import 'package:shop_list/data/repository/shop_repo.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_event.dart';
import 'package:shop_list/data/models/type.dart';
import 'shop_list_state.dart';

class ShopListBloc extends Bloc<ShopListEvents, ShopListState> {
  final RestClientMock apiClient = RestClientMock();
  final ShopRepo databaseRepo = ShopRepoImpl(hiveRepo: HiveRepo());

  ShopsData shopData = ShopsData(
      shops: [], listType: [], productName: '', productWeight: '');

  ShopListBloc() : super(const ShopListState.loading()) {
    on<ShopListEvents>((event, emit) async {
      await event.when(
          filterType:
              (productType) {
            shopData = shopData.copyWith(listType: productType);
            emit(ShopListState.success(
                shopData:shopData));
          },
          initialData: () async {
            final List<Shop> shopList = await databaseRepo.getShopList();
            final List<Type> typeList = await databaseRepo.getTypeList();
            shopData = shopData.copyWith(listType: typeList,shops: shopList);
            emit(ShopListState.success(
                shopData:shopData));
          },
          filterName: (String productName) {
            shopData = shopData.copyWith(productName: productName);
            emit(ShopListState.success(
                shopData:shopData));
          },
          filterWeight: (String productWeight) {
            shopData = shopData.copyWith(productWeight: productWeight);
            emit(ShopListState.success(
                shopData:shopData));
          });
    });
  }
}
