import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';

abstract class NYTimesAbstraction {
  Future<List<NYTimeListEntity>> getNYTimes(
    String relativeURL, {
    Map<String, dynamic>? queryParameters,
  });
}
