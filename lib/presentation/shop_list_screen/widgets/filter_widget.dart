import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_bloc.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_event.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_state.dart';
import 'package:shop_list/data/models/type.dart';

class FilterWidget extends StatelessWidget {
  final ShopListState state;
  final Function(String query) onChangedName;
  final Function(String query) onChangedWeigth;
  final Function(
    List<Type> listType,
  ) onChangedType;

  const FilterWidget(
      {Key? key,
      required this.state,
      required this.onChangedName,
      required this.onChangedType,
      required this.onChangedWeigth})
      : super(key: key);

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
    return Column(children: [
      TextField(
        onChanged: onChangedName,
        decoration: _decoration().copyWith(
            prefixIcon: const Icon(Icons.search),
            labelText: "Введите название товара"),
      ),
      const SizedBox(height: 10.0),
      TextField(
        onChanged: onChangedWeigth,
        keyboardType: TextInputType.number,
        decoration: _decoration().copyWith(
            prefixIcon: const Icon(Icons.search),
            labelText: "Введите вес товара"),
      ),
      const SizedBox(height: 10.0),
      state.when(
        loading: () => const SizedBox(height: 10.0),
        success: (shopData) => SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: shopData.listType.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                width: 100,
                child: _FilterCardWidget(
                  type: shopData.listType[index],
                  listType: shopData.listType,
                  onChangedType: onChangedType,
                ),
              );
            },
          ),
        ),
        failure: (error) => const SizedBox(height: 10.0),
      ),
      const SizedBox(height: 10.0),
    ]);
  }
}

class _FilterCardWidget extends StatelessWidget {
  final Type type;
  final List<Type> listType;
  final Function(
    List<Type> listType,
  ) onChangedType;

  const _FilterCardWidget(
      {Key? key,
      required this.type,
      required this.listType,
      required this.onChangedType})
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
                final List<Type> newList = listType.map((Type e) {
                  if (e.type == type.type) {
                    return e.copyWith(selected: !type.selected);
                  } else {
                    return e.copyWith(selected: false);
                  }
                }).toList();
                onChangedType(newList);
              },
            ),
          )
        ],
      ),
    );
  }
}
