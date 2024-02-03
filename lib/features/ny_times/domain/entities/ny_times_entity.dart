class NYTimeEntity {
  final NYTimeResultEntity result;

  NYTimeEntity({
    required this.result,
  });

  factory NYTimeEntity.fromJson(Map<String, dynamic> json) {
    return NYTimeEntity(
      result: NYTimeResultEntity.fromJson(json['result']),
    );
  }
}

class NYTimeResultEntity {
  final List<NYTimeListEntity> list;

  NYTimeResultEntity({
    required this.list,
  });

  factory NYTimeResultEntity.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<NYTimeListEntity> jobsList =
        list.map((i) => NYTimeListEntity.fromJson(i)).toList();

    return NYTimeResultEntity(list: jobsList);
  }
}

class NYTimeListEntity {
  final int id;
  final String? status;
  final String businessName;
  final String? businessImage;
  final String businessBranchName;
  final String startDatetime;
  final String? description;

  NYTimeListEntity({
    required this.id,
    required this.status,
    required this.businessName,
    required this.businessImage,
    required this.businessBranchName,
    required this.startDatetime,
    required this.description,
  });

  factory NYTimeListEntity.fromJson(Map<String, dynamic> json) {
    return NYTimeListEntity(
      id: json['id'],
      status: json['status'],
      businessName: json['business_name'],
      businessImage: json['business_image'],
      businessBranchName: json['business_branch_name'],
      startDatetime: json['start_datetime'],
      description: json['description'],
    );
  }
}
