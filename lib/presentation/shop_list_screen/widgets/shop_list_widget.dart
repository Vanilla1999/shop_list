import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/data/models/shop.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_bloc.dart';
import 'package:shop_list/presentation/shop_list_screen/blocs/shop_list_state.dart';
import 'package:shop_list/tools/app_colors.dart';

class ShopListWidget extends StatelessWidget {
  const ShopListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopListBloc, ShopListState>(
      listener: (context, state) {
        // do stuff here based on BlocA's state
      },
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              const _ResultsTextWithSeeAllWidget(),
              _ShopListResultWidget(
                state: state,
              ),
            ],
          ),
        );
      },
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
  final ShopListState state;

  const _ShopListResultWidget({Key? key, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return state.when(
        loading: () => Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: AppColors.startGradient,
                    ),
                  );
                },
              ),
            ),
        success: (list) => Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: AppColors.startGradient,
                      child: Text(list[index].name),
                    ),
                  );
                },
              ),
            ),
        failure: (error) => Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: AppColors.startGradient,
                    ),
                  );
                },
              ),
            ));
  }
}
