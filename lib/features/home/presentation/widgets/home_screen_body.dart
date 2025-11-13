import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/widgets/main_text_form_field.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';
import 'package:healthcare_app/features/home/presentation/cubits/popular_doctors_cubit/popular_doctors_cubit.dart';
import 'package:healthcare_app/features/home/presentation/cubits/popular_doctors_cubit/popular_doctors_state.dart';
import 'package:healthcare_app/features/home/presentation/widgets/category_header.dart';
import 'package:healthcare_app/features/home/presentation/widgets/health_artical_view.dart';
import 'package:healthcare_app/features/home/presentation/widgets/home_screen_header.dart';
import 'package:healthcare_app/features/home/presentation/widgets/popular_doctors_view_bloc_builder.dart';
import 'package:healthcare_app/features/home/presentation/widgets/specialization_listview.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  List<DoctorEntity> popularDoctors = [];

  @override
  void initState() {
    // TODO: implement initState
    context.read<PopularDoctorsCubit>().getPopularDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BlocListener<PopularDoctorsCubit, PopularDoctorsState>(
      listener: (context, state) {
        if (state is PopularDoctorsSuccess) {
          popularDoctors = state.popularDoctors;
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 3.6,
              child: Stack(
                children: [
                  const HomeScreenHeader(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          pushTo(
                              context: context, path: Routes.search, extra: '');
                        },
                        child: const AbsorbPointer(
                          child: MainTextFormField(
                            hintText: 'Search.......',
                            textInputType: TextInputType.text,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: SizedBox(
                  height: height / 7.7, child: const SpecializationList()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: CategorysHeader(
                title: 'Popular Doctor',
                onTap: () {
                  pushTo(
                    context: context,
                    path: Routes.detailedScreen,
                    extra: popularDoctors,
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: SizedBox(
                height: height / 3.3,
                child: const PopularDoctorsViewBlocBuilder(),
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
           const  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child:  HealthArticalView(),
            ),
          ],
        ),
      ),
    );
  }
}
