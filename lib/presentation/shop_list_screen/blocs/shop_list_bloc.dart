import 'package:bloc/bloc.dart';
import 'package:shop_list/data/datasources/hive_repo.dart';
import 'package:shop_list/data/datasources/retrofit_client.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/data/repository/shop_repo.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_event.dart';

import 'shop_list_state.dart';

class ShopListBloc extends Bloc<ShopListEvents, ShopListState> {
  final RestClientMock apiClient = RestClientMock();
  final ShopRepo databaseRepo = ShopRepoImpl(hiveRepo: HiveRepo());

  ShopListBloc() : super(const ShopListState.loading()) {
    on<ShopListEvents>((event, emit) async {
      await event.when(
          filter: (productName, productWeight, productType) {},
          initialData: () async {
            final List<Shop> shopList = await databaseRepo.getShopList();
            emit(ShopListState.success(shopList: shopList));
          });
    });
  }
}
