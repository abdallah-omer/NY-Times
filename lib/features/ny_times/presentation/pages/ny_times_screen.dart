import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/features/ny_time_details/presentation/pages/ny_time_details_screen.dart';
import 'package:ny_times/features/ny_times/presentation/cubit/ny_times_cubit.dart';
import 'package:ny_times/features/ny_times/presentation/cubit/ny_times_states.dart';
import 'package:ny_times/features/ny_times/presentation/widgets/ny_time_item_widget.dart';
import 'package:ny_times/utilities/constants/Strings.dart';
import 'package:ny_times/utilities/constants/colors.dart';
import 'package:ny_times/utilities/di.dart';

class NYTimeScreen extends StatelessWidget {
  const NYTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NYTimesCubit(useCase: DI.di()),
      child: BlocBuilder<NYTimesCubit, NYTimesStates>(
        builder: (context, state) {
          NYTimesCubit cubit = NYTimesCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorConstants.limeGreen,
              elevation: 4.0,
              shadowColor: ColorConstants.gray,
              title: const Text(
                Strings.nyTimeTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            body: SafeArea(
              bottom: false,
              child: ListView.builder(
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NYTimeDetailsScreen(
                        jobId: cubit.nyTimes[index].id,
                      ),
                    ),
                  ),
                  child: NYTimeItemWidget(
                    nyTimesEntity: cubit.nyTimes[index],
                  ),
                ),
                itemCount: cubit.nyTimes.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
