import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';
import 'package:ny_times/features/ny_times/domain/use_cases/ny_times_use_case.dart';
import 'package:ny_times/features/ny_times/presentation/cubit/ny_times_states.dart';

class NYTimesCubit extends Cubit<NYTimesStates> {
  NYTimesCubit({
    required NYTimesUseCase useCase,
  }) : super(NYTimesInitialState()) {
    emit(NYTimesLoadingState());
    useCase.getNYTimes().then((value) {
      nyTimes = value;
      emit(NYTimesDataLoadedState());
    });
  }

  static NYTimesCubit get(context) => BlocProvider.of(context);

  List<NYTimeListEntity> nyTimes = [];
}
