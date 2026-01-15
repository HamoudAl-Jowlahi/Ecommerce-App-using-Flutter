
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/data/data_source/sub_category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/domain/entities/category_data.dart';
import 'package:ecommerce_app/core/services/service_locator.dart';
import 'package:ecommerce_app/features/main_layout/domain/entities/product_data.dart';
import 'package:ecommerce_app/features/main_layout/domain/entities/sub_category_data.dart';
import 'package:ecommerce_app/features/main_layout/domain/repositories/sub_category_repositories.dart';
import 'package:ecommerce_app/features/main_layout/domain/use_case/get_category_use_case.dart';
import 'package:ecommerce_app/features/main_layout/domain/use_case/get_sub_category_use_case.dart';
import 'package:ecommerce_app/features/main_layout/presentation/manager/main_layout_state.dart';

import '../../../../core/services/web_service.dart';
import '../../data/repository_imp/sub_category_repositories_imp.dart';

class MainLayoutCubit extends Cubit<MainLayoutStates>  {
  MainLayoutCubit() : super(InitialMainLayoutState()){
    getCategoriesList();//api
    getSubCategoriesList();//api
  }

   List<CategoryData> _categoriesList = [];
   List<CategoryData> get categoriesList => _categoriesList;

   // final WebServices _services =  WebServices();
   // late BaseCategoryDataSource _baseCategoryDataSource;
   // late CategoryRepositories _categoryRepositories;
   // late GetCategoryUseCase _getCategoryUseCase;

  ///subCategory
  List<SubCategoryData> _subCategoryList = [];
  List<SubCategoryData> get subCategoryList => _subCategoryList;
  final WebServices _services =  WebServices();
  late BaseSubCategoryDataSource _baseSubCategoryDataSource;
  late SubCategoryRepositories _subCategoryRepositories;
  late GetSubCategoryUseCase _getSubCategoryUseCase;

  int _selectedCategory = 0;
  int get selectedCategory => _selectedCategory;
  void changeSelectedCategory(int v){
    _selectedCategory = v;
    emit(ChangeSelectedCategoryState());
  }

   Future<void> getCategoriesList() async{
     // _baseCategoryDataSource = RemoteCategoryDataSource(_services.freeDio);
     // _categoryRepositories = CategoryRepositoriesImp(_baseCategoryDataSource);
     // _getCategoryUseCase = GetCategoryUseCase(_categoryRepositories);
     final result = await sl<GetCategoryUseCase>().execute();

     return result.fold(
       (fail) {
         emit(ErrorGetCategoryState());
       },
       (data) {
         _categoriesList = data;
         emit(SuccessGetCategoryState());
       },

     );
   }

  /* Future<void> getSubCategoriesList(String categoryID) async {
     _baseSubCategoryDataSource = RemoteSubCategoryDataSource(_services.freeDio);
     _subCategoryRepositories = SubCategoryRepositoriesImp(_baseSubCategoryDataSource);
     _getSubCategoryUseCase = GetSubCategoryUseCase(_subCategoryRepositories);
     emit(LoadingSubGetCategoryState());
     final result = await _getSubCategoryUseCase.execute(categoryID);

     return result.fold(
     (fail) {
       emit(ErrorSubGetCategoryState());

     },
     (data) {
       _subCategoryList = data;
       emit(SuccessSubGetCategoryState());
     },
     );
   }*/
  Future<void> getSubCategoriesList({String? categoryID}) async {
     _baseSubCategoryDataSource = RemoteSubCategoryDataSource(_services.freeDio);
     _subCategoryRepositories = SubCategoryRepositoriesImp(_baseSubCategoryDataSource);
     _getSubCategoryUseCase = GetSubCategoryUseCase(_subCategoryRepositories);
     emit(LoadingSubGetCategoryState());
     final result = await _getSubCategoryUseCase.execute(categoryID: categoryID);

     return result.fold(
     (fail) {
       emit(ErrorSubGetCategoryState());

     },
     (data) {
       _subCategoryList = data;
       emit(SuccessSubGetCategoryState());
     },
     );
   }

   void getSubCategoriesOnCategory() {
    // Looping on categories List
     // we have category ID in each loop
     for(var categoryObject in _categoriesList) {
       List<SubCategoryData> subCategoriesList = [];
       for(var subCategoryObject in _subCategoryList){
         if(categoryObject.categoryID == subCategoryObject.categoryID){
           subCategoriesList.add(subCategoryObject);
         }
       }
       categoryObject.subCategoriesList = subCategoriesList;
       log(subCategoriesList.length.toString());
       log(categoryObject.subCategoriesList!.length.toString());
     }
   }
   // void getProductOnSubCategories() {
   //  // Looping on subCategories List
   //   // we have subCategory ID in each loop
   //   for(var subCategoryObject in _subCategoryList) {
   //     List<ProductData> productList = [];
   //     for(var productObject in _subCategoryList){
   //       if(subCategoryObject.subCategoryID == productObject.categoryID){
   //         subCategoriesList.add(subCategoryObject);
   //       }
   //     }
   //     categoryObject.subCategoriesList = subCategoriesList;
   //     log(subCategoriesList.length.toString());
   //     log(categoryObject.subCategoriesList!.length.toString());
   //   }
   // }
}