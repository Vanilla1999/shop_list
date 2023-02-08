import 'package:flutter/material.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_state.dart';

class FilterWidget extends StatelessWidget {
  final ShopListState state;

  const FilterWidget({Key? key, required this.state}) : super(key: key);

  InputDecoration _decoration() =>
      InputDecoration(
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
          loading: () =>
          const SizedBox(
            height: 10,
          ),
          success: (list, listFilter) =>
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                      .onDrag,
                  itemCount: listFilter.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 100,
                      width: 100,
                      child: _FilterCardWidget(type: listFilter[index].type,),
                    );
                  },
                ),
              ),
          failure: (error) =>
          const SizedBox(
            height: 10,
          ),),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

class _FilterCardWidget extends StatelessWidget {
  final String type;

  const _FilterCardWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(type)),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => {},
            ),
          )
        ],
      ),
    );
  }
}

