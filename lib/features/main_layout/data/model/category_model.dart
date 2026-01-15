import 'package:ecommerce_app/features/main_layout/domain/entities/category_data.dart';

class CategoryModel extends CategoryData{

  CategoryModel({
    required super.categoryID,
    required super.categoryName,
    required super.categoryImage
  });
 factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
     categoryID: json["_id"],
     categoryName:json["name"],
     categoryImage:json["image"],
 );

}