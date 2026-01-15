import 'package:ecommerce_app/features/main_layout/domain/entities/product_data.dart';

class SubCategoryData {
  final String categoryID;
  final String subCategoryName;
  final String subCategoryID;
  List<ProductData>? productsList;

   SubCategoryData({
    required this.categoryID,
    required this.subCategoryName,
    required this.subCategoryID,
    this.productsList,
  });
  // do not repead the object or equ... package
  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is SubCategoryData &&
    runtimeType == other.runtimeType &&
    categoryID == other.categoryID &&
    productsList == other.productsList &&
    subCategoryName == other.subCategoryName &&
        subCategoryID == other.subCategoryID ;


  @override
  int get hashCode =>
        categoryID.hashCode ^ subCategoryName.hashCode ^ subCategoryID.hashCode;


}
