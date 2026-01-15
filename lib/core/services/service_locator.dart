 import 'package:ecommerce_app/core/services/web_service.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce_app/features/main_layout/data/data_source/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/data/repository_imp/category_repositories_imp.dart';
import 'package:ecommerce_app/features/main_layout/domain/repositories/category_repositories.dart';
import 'package:ecommerce_app/features/main_layout/domain/use_case/get_category_use_case.dart';
import 'package:ecommerce_app/features/main_layout/presentation/manager/main_layout_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
class ServiceLocator {
  static void init() {
     // sl.registerLazySingleton(
     //       () => AuthCubit(),
     // );
     /// diff between registerFactory && registerLazySingleton
    /// re... create when need it,,, each call but sing... create it only one ... call in first call
     sl..registerLazySingleton(
           () => AuthCubit(),
     )..registerFactory(()=>MainLayoutCubit());
    // sl.registerLazySingleton(
    //   () => AuthenticationConfigCubit(),
    // );
    //
    // sl.registerLazySingleton(
    //   () => LinesCubit(),
    //   dispose: (param) {
    //     param.searchController.clea();
    //   }
    // );
    //
    // sl.registerLazySingleton(
    //   () => GetAllLinesUseCase(sl()),
    // );

    // sl.registerLazySingleton(
    //   ////// us
    //       () => GetEmployeeBySerialUseCase(sl()),
    // );

    // sl.registerLazySingleton<LineRepositories>(
    //   ////// us
    //       () => LineRepositoriesImp(sl()),
    // );
    //
    // sl.registerLazySingleton<BaseLinesDataSource>(
    //       () => LinesRemoteDataSource(WebServices().privateDio),
    // );
     /// Use case
     sl.registerLazySingleton(
             () => GetCategoryUseCase(sl<CategoryRepositories>())
     );
     /// Repository
     sl.registerLazySingleton<CategoryRepositories>(
             () => CategoryRepositoriesImp(sl<BaseCategoryDataSource>())
     );
    /// Data source
     sl.registerLazySingleton<BaseCategoryDataSource>(
         () => RemoteCategoryDataSource(sl<WebServices>().freeDio)
    );
     /// Web services
    sl.registerLazySingleton<WebServices>(
          () => WebServices(),
    );
  }
}
 // late BaseCategoryDataSource _baseCategoryDataSource;
 // late CategoryRepositories _categoryRepositories;
 // late GetCategoryUseCase _getCategoryUseCase;