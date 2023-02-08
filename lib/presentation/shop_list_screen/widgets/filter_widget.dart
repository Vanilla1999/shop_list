import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_bloc.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_event.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_state.dart';
import 'package:shop_list/data/models/type.dart';

class FilterWidget extends StatelessWidget {
  final ShopListState state;
  final TextEditingController nameProductController = TextEditingController();
  final TextEditingController weightProductController = TextEditingController();

  FilterWidget({Key? key, required this.state}) : super(key: key);

  InputDecoration _decoration() => InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            )),
      );

  @override
  Widget build(BuildContext context) {
    List<Type> typeList = [];
    return Column(
      children: [
        TextField(
          onChanged: (_) => {
            context.read<ShopListBloc>().add(ShopListEvents.filter(
                productName: nameProductController.text,
                productWeight: 0,
                productType: typeList)),
          },
          controller: nameProductController,
          decoration: _decoration().copyWith(
              prefixIcon: const Icon(Icons.search),
              labelText: "Введите название товара"),
        ),
        const SizedBox(height: 10.0),
        TextField(
          onChanged: (_) => {
            context.read<ShopListBloc>().add(ShopListEvents.filter(
                productName: nameProductController.text,
                productWeight: double.parse(weightProductController.text),
                productType: typeList)),
          },
          controller: weightProductController,
          decoration: _decoration().copyWith(
              prefixIcon: const Icon(Icons.search),
              labelText: "Введите вес товара"),
        ),
        const SizedBox(height: 10.0),
        state.when(
          loading: () => const SizedBox(
            height: 10,
          ),
          success: (list, listFilter) {
            typeList = listFilter;
            return SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: listFilter.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: _FilterCardWidget(
                      type: listFilter[index],
                      listType: listFilter,
                    ),
                  );
                },
              ),
            );
          },
          failure: (error) => const SizedBox(
            height: 10,
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

class _FilterCardWidget extends StatelessWidget {
  final Type type;
  final List<Type> listType;

  const _FilterCardWidget(
      {Key? key, required this.type, required this.listType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: type.selected ? Colors.blue : Colors.white,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(type.type)),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                type.selected = !type.selected;
                listType
                    .where((element) => element.type == type.type)
                    .first
                    .selected = type.selected;
                context.read<ShopListBloc>().add(ShopListEvents.filter(
                    productName: "", productWeight: 0, productType: listType));
              },
            ),
          )
        ],
      ),
    );
  }
}
