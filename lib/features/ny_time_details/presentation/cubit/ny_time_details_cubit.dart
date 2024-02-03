import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/features/ny_time_details/domain/use_cases/ny_time_details_use_case.dart';
import 'package:ny_times/features/ny_time_details/presentation/cubit/ny_time_details_states.dart';
import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';

class NYTimeDetailsCubit extends Cubit<NYTimeDetailsStates> {
  NYTimeDetailsCubit({
    required int jobId,
    required NYTimeDetailsUseCase useCase,
  }) : super(NYTimeDetailsInitialState()) {
    emit(NYTimeDetailsLoadingState());
    useCase.getNYTimeDetails(jobId: jobId).then((value) {
      nyTimeEntity = value;
      emit(NYTimeDetailsDataLoadedState());
    });
  }

  static NYTimeDetailsCubit get(context) => BlocProvider.of(context);

  NYTimeListEntity? nyTimeEntity;
}
