import 'package:ny_times/features/ny_times/domain/abstractions/ny_times_abstraction.dart';
import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';
import 'package:ny_times/utilities/api/end_points.dart';

class NYTimesUseCase {
  final NYTimesAbstraction abstraction;

  NYTimesUseCase({required this.abstraction});

  Future<List<NYTimeListEntity>> getNYTimes() => abstraction.getNYTimes(
        EndPoints.jobs,
      );
}
