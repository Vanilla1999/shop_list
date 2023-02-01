import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  InputDecoration _decoration() => InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            )) ,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            )),
      );

  @override
  Widget build(BuildContext context) {
    final mocCharacteristic = [
      "Drinks",
      "Food",
      "Health",
      "Gaming",
      "3D",
      "Clothes"
    ];
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
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: mocCharacteristic.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                  child: Text(
                    mocCharacteristic[index],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
