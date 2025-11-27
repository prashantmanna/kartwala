import 'dart:convert';

class BannerModel {
  final String id;
  final String imageUrl;

  BannerModel({required this.id, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'imageUrl': imageUrl};
  }

  String toJson() => json.encode(toMap());
  factory BannerModel.fromJson(Map<String, dynamic> map) {
    return BannerModel(
      id: map['_id'] as String,
      imageUrl: map["imageUrl"] as String,
    );
  }
}
