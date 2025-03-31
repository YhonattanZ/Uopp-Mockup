import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/routes/app_routes.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/custom_button.dart';
import 'package:prueba_uopp/ui/widgets/custom_tag.dart';
import 'package:prueba_uopp/ui/widgets/diagonal_container.dart';
import 'package:prueba_uopp/ui/widgets/local_video_player.dart';

class SeePlans extends StatelessWidget {
  const SeePlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomElevatedButton(
        title: 'Seleccionar',
        onPressed: () => Get.toNamed(AppRoutes.plansPage),
      ),
      appBar: CustomAppBar(
        title: AppConfig.selectPlan,
        onBack: () => Get.back(),
      ),
      body: Column(
        children: [
          LocalVideoPlayer(videoPath: 'assets/videos/video.mp4'),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: AppConfig.primaryTextColor),
                  top: BorderSide(color: AppConfig.primaryTextColor),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Wrap(
                    children: [
                      CustomTagWidget(
                        text: 'PLUS',
                        align: TextAlign.center,
                        textColor: AppConfig.bgTextColor,
                        color: AppConfig.plusColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: DiagonalContainer(),
          // ),
        ],
      ),
    );
  }
}
