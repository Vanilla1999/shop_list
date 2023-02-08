import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_bloc.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_event.dart';
import 'package:shop_list/presentation/shop_list_screen/screen/shop_screen.dart';

class ScreenFactory {
  Widget makeShopListScreen() {
    return BlocProvider<ShopListBloc>(
      create: (context) => ShopListBloc()..add(const ShopListEvents.initialData()),
      child: const ShopListScreen(),
    );
  }
}
