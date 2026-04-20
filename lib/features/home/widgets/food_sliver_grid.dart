import 'package:flutter/material.dart';
import 'food_grid_item.dart';
import '../../product/views/product_details_view.dart';

class FoodSliverGrid extends StatelessWidget {
  const FoodSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: 8,
        (context, index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductDetailsView()),
          ),
          child: const FoodGridItem(),
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.737,
        crossAxisCount: 2,
      ),
    );
  }
}
