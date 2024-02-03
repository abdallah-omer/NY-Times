import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';

abstract class NYTimeDetailsAbstraction {
  Future<NYTimeListEntity> getNYTimeDetails(
    String relativeURL, {
    Map<String, dynamic>? queryParameters,
  });
}
