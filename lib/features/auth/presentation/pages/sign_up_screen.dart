import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var
    return BlocBuilder<AuthCubit, AuthStates>(
      bloc: sl<AuthCubit>(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.primary,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    BuildTextField(
                      controller: sl<AuthCubit>().fullNameController,
                      backgroundColor: ColorManager.white,
                      hint: 'enter your full name',
                      label: 'Full Name',
                      textInputType: TextInputType.name,
                      validation: AppValidators.validateFullName,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: sl<AuthCubit>().phoneController,
                      hint: 'enter your mobile no.',
                      backgroundColor: ColorManager.white,
                      label: 'Mobile Number',
                      validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: sl<AuthCubit>().emailSignUpController,
                      hint: 'enter your email address',
                      backgroundColor: ColorManager.white,
                      label: 'E-mail address',
                      validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: sl<AuthCubit>().passwordSignUpController,
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          label: 'Sign Up',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary, fontSize: AppSize.s20),
                          onTap: () {
                            sl<AuthCubit>().signUp().then((value) {
                              if(value){
                                Navigator.pushNamedAndRemoveUntil(context, Routes.mainRoute, (route) =>false);
                              }
                            },);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
