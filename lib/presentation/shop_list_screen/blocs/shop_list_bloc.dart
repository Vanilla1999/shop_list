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

  ShopsData shopData =
      ShopsData(shops: [], listType: [], productName: '', productWeight: '');
  final List<Shop> mainShops = [];

  ShopListBloc() : super(const ShopListState.loading()) {
    on<ShopListEvents>((event, emit) async {
      await event.when(filterType: (productType) {
        final List<Shop> filteredShops = _filterShops(mainShops, productType,
            shopData.productName, shopData.productWeight);
        shopData =
            shopData.copyWith(listType: productType, shops: filteredShops);
        emit(ShopListState.success(shopData: shopData));
      }, initialData: () async {
        final List<Shop> shopList = await databaseRepo.getShopList();
        final List<Type> typeList = await databaseRepo.getTypeList();
        mainShops.clear();
        mainShops.addAll(shopList);
        shopData = shopData.copyWith(listType: typeList, shops: mainShops);
        emit(ShopListState.success(shopData: shopData));
      }, filterName: (String productName) {
        final List<Shop> filteredShops = _filterShops(
            mainShops, shopData.listType, productName, shopData.productWeight);
        shopData =
            shopData.copyWith(productName: productName, shops: filteredShops);
        emit(ShopListState.success(shopData: shopData));
      }, filterWeight: (String productWeight) {
        final List<Shop> filteredShops = _filterShops(
            mainShops, shopData.listType, shopData.productName, productWeight);
        shopData = shopData.copyWith(
            productWeight: productWeight, shops: filteredShops);
        emit(ShopListState.success(shopData: shopData));
      });
    });
  }

  List<Shop> _filterShops(List<Shop> mainShops, List<Type> productType,
      String productName, String productWeight) {
    final List<Shop> filterShops = [];
    final selectedType =
        productType.where((element) => element.selected == true);
    if (productName == '' && productWeight == '' && selectedType.isEmpty) {
      filterShops.addAll(mainShops);
    }
    if (productName != '' && productWeight == '' && selectedType.isEmpty) {
      for (var shop in mainShops) {
        final newShop = shop.copyWith(products: shop.products.toList());
        final products = shop.products
            .where((product) => product.name.startsWith(productName));
        if (products.isNotEmpty) {
          newShop.products.clear();
          newShop.products.addAll(products);
          filterShops.add(newShop);
        }
      }
    }
    if (productName != '' && productWeight != '' && selectedType.isEmpty) {
      for (var shop in mainShops) {
        final newShop = shop.copyWith(products: shop.products.toList());
        final products = shop.products.where((product) =>
            product.name.startsWith(productName) &&
            product.weight == double.parse(productWeight));
        if (products.isNotEmpty) {
          newShop.products.clear();
          newShop.products.addAll(products);
          filterShops.add(shop);
        }
      }
    }
    if (productName != '' && productWeight != '' && selectedType.isNotEmpty) {
      for (var shop in mainShops) {
        final newShop = shop.copyWith(products: shop.products.toList());
        final products = shop.products.where((product) =>
            product.type == selectedType.first.type &&
            product.name.startsWith(productName) &&
            product.weight == double.parse(productWeight));
        if (products.isNotEmpty) {
          newShop.products.clear();
          newShop.products.addAll(products);
          filterShops.add(shop);
        }
      }
    }

    return filterShops;
  }
}
