import 'package:flutter/material.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_state.dart';

class FilterWidget extends StatelessWidget {
  final ShopListState state;

  const FilterWidget({Key? key, required this.state}) : super(key: key);

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
    return Column(
      children: [
        TextField(
          decoration: _decoration().copyWith(
              prefixIcon: const Icon(Icons.search),
              labelText: "Введите название товара"),
        ),
        const SizedBox(height: 10.0),
        TextField(
          decoration: _decoration().copyWith(
              prefixIcon: const Icon(Icons.search),
              labelText: "Введите вес товара"),
        ),
        const SizedBox(height: 10.0),
        state.when(
          loading: () => const SizedBox(
            height: 10,
          ),
          success: (list) => SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                    child: Text(
                      list[index].name,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          failure: (error) => const SizedBox(
            height: 10,
        ),),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
