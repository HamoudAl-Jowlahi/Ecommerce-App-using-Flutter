import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/presentation/manager/main_layout_cubit.dart';
import 'package:ecommerce_app/features/main_layout/presentation/manager/main_layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_card_item.dart';
import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit, MainLayoutStates>(
      builder: (context, state) {
        var cubit = context.read<MainLayoutCubit>();
        return Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              // category title
              SliverToBoxAdapter(
                child: Text(
                  cubit.categoriesList[cubit.selectedCategory].categoryName,
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s14),
                ),
              ),
              // the category card
              SliverToBoxAdapter(
                child: CategoryCardItem(cubit.categoriesList[cubit.selectedCategory].categoryName,
                    ImageAssets.categoryCardImage,
                    // cubit.categoriesList[cubit.selectedCategory].categoryImage,
                    goToCategoryProductsListScreen
                ),
              ),
              // the grid view of the subcategories
              // if(state is LoadingSubGetCategoryState)
              //   SliverGrid(
              //       delegate: SliverChildBuilderDelegate(
              //         childCount: 4,
              //             (context, index) => SkeletonLoading(
              //                 child: Container(
              //                   width: 200,
              //                   height: 300,
              //                   decoration: BoxDecoration(
              //                     color: Colors.grey,
              //                     borderRadius: BorderRadius.circular(8.0)
              //                   ),
              //                 )
              //             ),
              //       ),
              //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 3,
              //         childAspectRatio: 0.75,
              //         mainAxisSpacing: AppSize.s8,
              //         crossAxisSpacing: AppSize.s8,
              //       )),
              // if(state is SuccessSubGetCategoryState && context.read<MainLayoutCubit>().subCategoryList.isNotEmpty)
                SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      // childCount: cubit.subCategoryList.length,
                      childCount: cubit.categoriesList[cubit.selectedCategory].subCategoriesList?.length ?? 0,
                          (context, index) => SubCategoryItem(
                              cubit.categoriesList[cubit.selectedCategory].subCategoriesList![index].subCategoryName,
                              // cubit.categoriesList[cubit.selectedCategory].subCategoriesList![index].subCategoryName,
                              ImageAssets.subcategoryCardImage,
                              goToCategoryProductsListScreen),
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: AppSize.s8,
                      crossAxisSpacing: AppSize.s8,
                    )),
              // if(state is SuccessSubGetCategoryState && context.read<MainLayoutCubit>().subCategoryList.isEmpty)
              //   const SliverToBoxAdapter(
              //     child: Center(
              //       child: Text("Sub category not found.... select another category"),
              //     ),
              //   )



            ],
          ),
        );
      }
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
