import 'package:ny_times/features/ny_time_details/domain/entities/ny_time_details_entity.dart';
import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';
import 'package:ny_times/utilities/api/api_consumer.dart';

class NYTimeDetailsDataSource {
  final ApiConsumer apiConsumer;

  NYTimeDetailsDataSource({required this.apiConsumer});

  Future<NYTimeListEntity> getNYTimeDetails(
    String relativeURL, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response =
        await apiConsumer.get(relativeURL, queryParameters: queryParameters);

    return NYTimeDetailsEntity.fromJson(response).result;
  }
}
