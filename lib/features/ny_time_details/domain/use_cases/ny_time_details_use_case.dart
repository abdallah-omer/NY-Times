import 'package:ny_times/features/ny_time_details/domain/abstractions/ny_time_details_abstraction.dart';
import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';
import 'package:ny_times/utilities/api/end_points.dart';

class NYTimeDetailsUseCase {
  final NYTimeDetailsAbstraction abstraction;

  NYTimeDetailsUseCase({required this.abstraction});

  Future<NYTimeListEntity> getNYTimeDetails({required int jobId}) =>
      abstraction.getNYTimeDetails(
        '${EndPoints.job}/$jobId',
      );
}
