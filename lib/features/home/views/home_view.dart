import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/categories_list.dart';
import '../widgets/food_sliver_grid.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // app bar
            const SliverAppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              pinned: true,
              floating: true,
              actionsPadding: EdgeInsets.zero,
              titleSpacing: 0,
              toolbarHeight: 165,
              backgroundColor: Colors.white,
              flexibleSpace: Padding(
                padding: EdgeInsetsGeometry.only(top: 32, right: 18, left: 18),
                child: Column(
                  children: [
                    Gap(16),
                    HomeAppBar(),
                    Gap(12),
                    Flexible(child: SerachBar()),
                  ],
                ),
              ),
            ),

            // categories list
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(children: [Gap(12), CategoriesList()]),
              ),
            ),

            // food grid
            const SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 12,
                horizontal: 18,
              ),
              sliver: FoodSliverGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
