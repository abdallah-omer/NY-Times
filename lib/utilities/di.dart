import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ny_times/features/ny_time_details/data/datasources/ny_time_details_datasource.dart';
import 'package:ny_times/features/ny_time_details/data/repositories/ny_time_details_repository.dart';
import 'package:ny_times/features/ny_time_details/domain/abstractions/ny_time_details_abstraction.dart';
import 'package:ny_times/features/ny_time_details/domain/use_cases/ny_time_details_use_case.dart';
import 'package:ny_times/features/ny_times/data/datasources/ny_times_datasource.dart';
import 'package:ny_times/features/ny_times/data/repositories/ny_times_repository.dart';
import 'package:ny_times/features/ny_times/domain/abstractions/ny_times_abstraction.dart';
import 'package:ny_times/features/ny_times/domain/use_cases/ny_times_use_case.dart';
import 'package:ny_times/utilities/api/api_consumer.dart';
import 'package:ny_times/utilities/api/dio_consumer.dart';

class DI {
  static final di = GetIt.instance;

  static Future init() async {
    di.registerLazySingleton(() => Dio());
    di.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: di()));
    di.registerLazySingleton(() => NYTimesDataSource(apiConsumer: di()));
    di.registerLazySingleton<NYTimesAbstraction>(
        () => NYTimesRepository(dataSource: di()));
    di.registerLazySingleton(() => NYTimesUseCase(abstraction: di()));
    di.registerLazySingleton(() => NYTimeDetailsDataSource(apiConsumer: di()));
    di.registerLazySingleton<NYTimeDetailsAbstraction>(
        () => NYTimeDetailsRepository(dataSource: di()));
    di.registerLazySingleton(() => NYTimeDetailsUseCase(abstraction: di()));
  }
}
