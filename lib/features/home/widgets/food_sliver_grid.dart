import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/features/home/widgets/food_grid_item.dart';

class FoodSliverGrid extends StatelessWidget {
  const FoodSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: 8,
        (context, index) => const FoodGridItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.737,
        crossAxisCount: 2,
      ),
    );
  }
}
