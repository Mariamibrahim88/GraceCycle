import 'package:grace_cycle/features/home/data/models/vendors_model.dart';

class DiscoverVendorsModel {
  final int count;
  final int pageIndex;
  final int pageSize;
  final List<VendorItemModel> data;

  DiscoverVendorsModel({
    required this.count,
    required this.pageIndex,
    required this.pageSize,
    required this.data,
  });

  factory DiscoverVendorsModel.fromJson(Map<String, dynamic> json) {
    return DiscoverVendorsModel(
      count: json['count'] as int,
      pageIndex: json['pageIndex'] as int ,
      pageSize: json['pageSize'] as int ,
      
      data: (json['data'] as List)
              .map((item) => VendorItemModel.fromJson(item))
              .toList()
        
    );
  }
}
