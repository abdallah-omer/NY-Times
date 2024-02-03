import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:ny_times/features/ny_time_details/presentation/cubit/ny_time_details_cubit.dart';
import 'package:ny_times/features/ny_time_details/presentation/cubit/ny_time_details_states.dart';
import 'package:ny_times/utilities/constants/colors.dart';
import 'package:ny_times/utilities/di.dart';

class NYTimeDetailsScreen extends StatelessWidget {
  const NYTimeDetailsScreen({
    super.key,
    required this.jobId,
  });

  final int jobId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NYTimeDetailsCubit(useCase: DI.di(), jobId: jobId),
      child: BlocBuilder<NYTimeDetailsCubit, NYTimeDetailsStates>(
        builder: (context, state) {
          NYTimeDetailsCubit cubit = NYTimeDetailsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorConstants.limeGreen,
              elevation: 4.0,
              shadowColor: ColorConstants.gray,
              title: Text(
                cubit.nyTimeEntity?.businessName ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: HtmlWidget(
                    cubit.nyTimeEntity?.description ?? '',
                    textStyle: const TextStyle(
                      color: ColorConstants.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
