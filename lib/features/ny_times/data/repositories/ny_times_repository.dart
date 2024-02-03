import 'package:ny_times/features/ny_times/data/datasources/ny_times_datasource.dart';
import 'package:ny_times/features/ny_times/domain/abstractions/ny_times_abstraction.dart';
import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';

class NYTimesRepository extends NYTimesAbstraction {
  final NYTimesDataSource dataSource;

  NYTimesRepository({required this.dataSource});

  @override
  Future<List<NYTimeListEntity>> getNYTimes(
    String relativeURL, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final nyTimes = await dataSource.getNYTimes(
      relativeURL,
      queryParameters: queryParameters,
    );
    return nyTimes;
  }
}
