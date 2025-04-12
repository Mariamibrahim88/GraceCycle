class VendorsTypeModel {
  final String type;
  final int id;

  VendorsTypeModel({
    required this.type,
    required this.id, 
  });

  factory VendorsTypeModel.fromJson(Map<String, dynamic> json) {
    return VendorsTypeModel(
      type: json['type'],
      id: json['id'],
    );
  }
 

}
