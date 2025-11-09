import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';
import 'package:healthcare_app/core/widgets/main_button.dart';
import 'package:healthcare_app/core/widgets/main_text_form_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 250,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )),
        title: Stack(
          children:[
            PositionedDirectional(
              start: -5,
                top: -6,
                child: IconButton(onPressed: (){
                  pop(context) ;
                }, icon:const  Icon(Icons.arrow_back_ios_new , color: AppColors.whiteColor,))) ,

            Column(
            children: [
              Text(
                'Set up your profile',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyles.textStyles22.copyWith(
                  color: AppColors.accentColor,
                ),
              ),
              const Gap(20),
              Text(
                'Update your profile to connect your doctor with better impression ',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyles.textStyles16
                    .copyWith(color: AppColors.accentColor),
              ),
              const Gap(20),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      AppImages.noProfileImage,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: -8,
                      right: -8,
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImages.cameraIconSvg)))
                ],
              )
            ],
          ),
          ]
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Personal Information',
                style: TextStyles.textStyles22,
              ),
              const Gap(15),
              MainTextFormField(
                hintText: FirebaseAuth.instance.currentUser?.displayName ?? 'User',
                textInputType: TextInputType.name,
                borderColor: Colors.transparent,
                suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                suffixIconColor: AppColors.greyColor,
              ),
              const Gap(15),
              MainTextFormField(
                hintText: 'Phone',
                textInputType: TextInputType.phone,
                borderColor: Colors.transparent,
                suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                suffixIconColor: AppColors.greyColor,
              ),
              const Gap(15),
              MainTextFormField(
                hintText: 'Date of birth',
                textInputType: TextInputType.datetime,
                borderColor: Colors.transparent,
                suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                suffixIconColor: AppColors.greyColor,
              ),
              const Gap(15),
              MainTextFormField(
                hintText: 'City',
                textInputType: TextInputType.streetAddress,
                borderColor: Colors.transparent,
                suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                suffixIconColor: AppColors.greyColor,
              ),
              const Gap(40),
              MainButton(
                text: 'Update Profile',
                width: double.infinity,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
