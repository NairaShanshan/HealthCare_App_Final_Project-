import 'package:flutter/material.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/widgets/main_text_form_field.dart';
import 'package:healthcare_app/features/home/presentation/widgets/category_header.dart';
import 'package:healthcare_app/features/home/presentation/widgets/category_items_view.dart';
import 'package:healthcare_app/features/home/presentation/widgets/health_artical_view.dart';
import 'package:healthcare_app/features/home/presentation/widgets/home_screen_header.dart';
import 'package:healthcare_app/features/home/presentation/widgets/popular_doctors_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height / 3.6,
            child: const Stack(
              children: [
                HomeScreenHeader(),
                Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: MainTextFormField(
                      hintText: 'Search.......',
                      textInputType: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: SizedBox(
              height: height / 7.7,
              child: const CategoryItemsView(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: CategorysHeader(
              title: 'Popular Doctor',
              onTap: () {
                pushTo(context:  context,path:  Routes.detailedScreen, extra: 'Popular Doctor');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: SizedBox(
              height: height / 3.3,
              child: const PopularDoctorsView(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: CategorysHeader(
              title: 'Health article',
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: height / 2.5,
              child: const HealthArticalView(),
            ),
          ),
        ],
      ),
    );
  }
}
