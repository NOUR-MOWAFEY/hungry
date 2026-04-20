import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widgets/product_details_view_app_bar.dart';
import '../widgets/product_details_view_footer.dart';
import '../widgets/side_options_section.dart';
import '../widgets/slider_section.dart';
import '../widgets/toppings_section.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProuductDetailsAppBar(),

      body: ListView(
        children: [
          const Gap(20),

          Padding(
            padding: const EdgeInsets.only(right: 14),

            child: Row(
              children: [
                // image
                Image.asset('assets/test/details_burger.png', width: 180),

                const Spacer(),

                // text + slider
                const SliderSection(),
              ],
            ),
          ),

          const Gap(50),

          const ToppingsSection(),

          const Gap(38),

          const SideOptionsSection(),

          const Gap(38),

          const ProductDetailsViewFooter(),
        ],
      ),
    );
  }
}
