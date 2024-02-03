import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ny_times/features/ny_times/domain/entities/ny_times_entity.dart';
import 'package:ny_times/utilities/constants/colors.dart';
import 'package:ny_times/utilities/date_manager.dart';

class NYTimeItemWidget extends StatelessWidget {
  const NYTimeItemWidget({
    super.key,
    required this.nyTimesEntity,
  });

  final NYTimeListEntity nyTimesEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 56.0,
            width: 56.0,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                border: Border.all(color: ColorConstants.gray)),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: nyTimesEntity.businessImage ?? '',
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: ColorConstants.darkGray,
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nyTimesEntity.businessName,
                  style: const TextStyle(
                    color: ColorConstants.black,
                    fontSize: 18.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  nyTimesEntity.businessBranchName,
                  style: const TextStyle(
                    color: ColorConstants.darkGray,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        nyTimesEntity.status ?? '',
                        style: const TextStyle(
                          color: ColorConstants.darkGray,
                          fontSize: 14.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: ColorConstants.darkGray,
                          size: 20.0,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          DateManager.formattedDate(
                              dateString: nyTimesEntity.startDatetime),
                          style: const TextStyle(
                            color: ColorConstants.darkGray,
                            fontSize: 14.0,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: ColorConstants.black,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}
