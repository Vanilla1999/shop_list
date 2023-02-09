import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_bloc.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_event.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_state.dart';
import 'package:shop_list/presentation/shop_list_screen/widgets/filter_widget.dart';
import 'package:shop_list/presentation/shop_list_screen/widgets/shop_list_widget.dart';
import 'package:shop_list/data/models/type.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ShopListBloc, ShopListState>(
          listener: (context, state) {
            // do stuff here based on BlocA's state
          },
          builder: (context, state) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                FilterWidget(
                  state: state,
                  onChangedName: (String query) {
                    context.read<ShopListBloc>().add(ShopListEvents.filterName(
                          productName: query,
                        ));
                  },
                  onChangedType: (List<Type> listType) {
                    context.read<ShopListBloc>().add(ShopListEvents.filterType(
                        productType: listType));
                  },
                  onChangedWeigth: (String query) {
                    context
                        .read<ShopListBloc>()
                        .add(ShopListEvents.filterWeight(
                          productWeight: query,
                        ));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ShopListWidget(state: state)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
