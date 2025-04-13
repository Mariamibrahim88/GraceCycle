class GetCategoriesModel {
  final int id;
  final String nameOfCategory;

  GetCategoriesModel({required this.id, required this.nameOfCategory});

  factory GetCategoriesModel.fromJson(Map<String, dynamic> json) {
    return GetCategoriesModel(
      id: json['id'],
      nameOfCategory: json['name'],
    );
  }
}
