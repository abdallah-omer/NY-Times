import 'package:ny_times/features/ny_time_details/data/datasources/ny_time_details_datasource.dart';
import 'package:ny_times/features/ny_time_details/domain/abstractions/ny_time_details_abstraction.dart';
import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';

class NYTimeDetailsRepository extends NYTimeDetailsAbstraction {
  final NYTimeDetailsDataSource dataSource;

  NYTimeDetailsRepository({required this.dataSource});

  @override
  Future<NYTimeListEntity> getNYTimeDetails(
    String relativeURL, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final nyTime = await dataSource.getNYTimeDetails(
      relativeURL,
      queryParameters: queryParameters,
    );
    return nyTime;
  }
}
