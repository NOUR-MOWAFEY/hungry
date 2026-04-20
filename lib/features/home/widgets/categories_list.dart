import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'food_category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedItem = 0;

  final categories = ['All', 'Combo', 'Sliders', 'Classic'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => setState(() {
            selectedItem = index;
          }),
          child: FoodCategoryItem(
            name: categories[index],
            isSelected: selectedItem == index,
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const Gap(6),
      ),
    );
  }
}
