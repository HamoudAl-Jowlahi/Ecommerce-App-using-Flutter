import 'package:ecommerce_app/features/main_layout/domain/entities/sub_category_data.dart';

class CategoryData {
  final String categoryID;
  final String categoryName;
  final String categoryImage;
   List<SubCategoryData>? subCategoriesList;

   CategoryData({
    required this.categoryID,
    required this.categoryName,
    required this.categoryImage,
    this.subCategoriesList,
  });
  // do not repead the object or equ... package
  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is CategoryData &&
    runtimeType == other.runtimeType &&
    categoryID == other.categoryID &&
    categoryName == other.categoryName &&
    categoryName == other.categoryName ;


  @override
  int get hashCode =>
        categoryID.hashCode ^ categoryName.hashCode ^ categoryImage.hashCode;


}
