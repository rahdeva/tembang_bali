import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tembang_bali/feature/sekar/sekar_madia/sekar_madia_controller.dart';
import 'package:tembang_bali/model/song.dart';
import 'package:tembang_bali/resources/resources.dart';
import 'package:tembang_bali/routes/page_names.dart';
import 'package:tembang_bali/utills/widget/expansion_tile_widget.dart';

class SekarMadiaListItem extends StatelessWidget {
  final int index;
  final SekarMadiaController controller;
  final Song mData;

  const SekarMadiaListItem({
    super.key, 
    required this.index, 
    required this.controller, 
    required this.mData,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTileWidget(
      title: mData.title ?? "-",
      withIcon: true,
      content: Column(
        children: [
          const SizedBox(height: 8),
          InkWell(
            onTap: (){
              Get.toNamed(
                PageName.INFO_DETAIL,
                arguments: mData
              );
            },
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.black,
                  child: HeroIcon(
                    HeroIcons.questionMarkCircle,
                    style: HeroIconStyle.outline, // Outlined icons are used by default.
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Sejarah dan Aturan",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: (){
              Get.toNamed(
                PageName.PLAYER,
                arguments: mData
              );
            },
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.black,
                  child: HeroIcon(
                    HeroIcons.playCircle,
                    style: HeroIconStyle.outline, // Outlined icons are used by default.
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Audio Tembang",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}