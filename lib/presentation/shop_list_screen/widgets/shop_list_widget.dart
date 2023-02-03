import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shop_list/tools/app_colors.dart';

class ShopListWidget extends StatelessWidget {
  const ShopListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: const [
          _ResultsTextWithSeeAllWidget(),
          _ShopListResultWidget(),
        ],
      ),
    );
  }
}

class _ResultsTextWithSeeAllWidget extends StatelessWidget {
  const _ResultsTextWithSeeAllWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            maxLines: 1,
            text: const TextSpan(children: [
              TextSpan(
                text: "Find results",
                style: TextStyle(
                  fontSize: 21,
                  color: AppColors.findResultText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: "  ",
              ),
              TextSpan(
                text: "(896 items)",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          ),
        ),
        TextButton(
          onPressed: () => {},
          child: const Text(
            "(See All)",
            style: TextStyle(color: AppColors.startGradient),
          ),
        ),
      ],
    );
  }
}

class _ShopListResultWidget extends StatelessWidget {
  const _ShopListResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mockList = [
      "Банан",
      "Банан",
      "Банан",
      "Банан",
      "Банан",
      "Банан",
      "Банан",
      "Банан",
      "Банан",
      "Банан",
      "Банан",
      "Банан"
    ];
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: mockList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: AppColors.startGradient,
            ),
          );
        },
      ),
    );
  }
}
