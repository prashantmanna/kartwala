import 'dart:convert';

class Subcategorymodel {
  final String id;
  final String categoryId;
  final String categoryname;
  final String subCategoryImage;
  final String subcategoryname;

  Subcategorymodel({
    required this.id,
    required this.categoryId,
    required this.categoryname,
    required this.subCategoryImage,
    required this.subcategoryname,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryId': categoryId,
      'categoryname': categoryname,
      'subCategoryImage': subCategoryImage,
      'subcategoryname': subcategoryname,
    };
  }

  String toJson() => json.encode(toMap());

  factory Subcategorymodel.fromJson(Map<String, dynamic> map) {
    return Subcategorymodel(
      id: map['_id'] ?? map['id'] ?? '',
      categoryId: map['categoryId'] ?? '',
      categoryname: map['categoryname'] ?? '',
      subCategoryImage: map['subCategoryImage'] ?? map['image'] ?? '',
      subcategoryname: map['subcategoryname'] ?? '',
    );
  }
}
