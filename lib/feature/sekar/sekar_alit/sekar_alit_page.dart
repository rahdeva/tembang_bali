import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tembang_bali/feature/sekar/sekar_alit/sekar_alit_controller.dart';
import 'package:tembang_bali/feature/sekar/sekar_alit/widgets/sekar_alit_list_builder.dart';
import 'package:tembang_bali/utills/widget/button/back_button.dart';
import 'package:tembang_bali/utills/widget/empty_list_widget.dart';
import 'package:tembang_bali/utills/widget/shimmer/shimmer_widget.dart';
import '/resources/resources.dart';

class SekarAlitPage extends StatelessWidget {
  const SekarAlitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SekarAlitController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const BackButtonWidget(),
                Expanded(
                  child: Stack(
                    children: [
                      (controller.isLoading)
                        ? Column(
                            children: [
                              const SizedBox(height: 40),
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 24),
                                  child: ShimmerWidget.simpleShimmer()
                                ),
                            ],
                          )
                        : (controller.dataList.isEmpty)
                          ? const EmptyListWidget()
                          : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 40),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Text(
                                    "Sekar Alit",
                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                      fontSize: 30,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                ListSekarAlitBuilder(
                                  controller: controller
                                ),
                              ],
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}