import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';
import 'package:ny_times/utilities/api/api_consumer.dart';

class NYTimesDataSource {
  final ApiConsumer apiConsumer;

  NYTimesDataSource({required this.apiConsumer});

  Future<List<NYTimeListEntity>> getNYTimes(
    String relativeURL, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response =
        await apiConsumer.get(relativeURL, queryParameters: queryParameters);

    return NYTimeEntity.fromJson(response).result.list;
  }
}
