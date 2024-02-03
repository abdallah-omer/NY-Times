import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';

class NYTimeDetailsEntity {
  final NYTimeListEntity result;

  NYTimeDetailsEntity({
    required this.result,
  });

  factory NYTimeDetailsEntity.fromJson(Map<String, dynamic> json) {
    return NYTimeDetailsEntity(
      result: NYTimeListEntity.fromJson(json['result']),
    );
  }
}
