import 'package:flutter/material.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/features/home/views/widgets/search.dart';
import 'package:shopit/src/features/home/views/widgets/home_banner.dart';
import 'package:shopit/src/features/home/views/widgets/featured_categories.dart';
import 'package:shopit/src/features/home/views/widgets/featured_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Search(),
              gapH24,
              HomeBanner(),
              gapH24,
              FeaturedCategories(),
              gapH24,
              FeaturedProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
