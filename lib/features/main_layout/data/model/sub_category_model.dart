import 'package:ecommerce_app/features/main_layout/domain/entities/category_data.dart';
import 'package:ecommerce_app/features/main_layout/domain/entities/sub_category_data.dart';

class SubCategoryModel extends SubCategoryData{

  SubCategoryModel({
    required super.categoryID,
    required super.subCategoryName,
    required super.subCategoryID
  });
 factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
     categoryID: json["category"],
   subCategoryName:json["name"],
   subCategoryID:json["_id"],
 );

}