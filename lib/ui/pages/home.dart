import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/routes/app_routes.dart';
import 'package:prueba_uopp/ui/widgets/custom_actualPlan_card.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/custom_button.dart';
import 'package:prueba_uopp/ui/widgets/custom_expandable_widget.dart';

import 'package:prueba_uopp/ui/widgets/local_video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomElevatedButton(
        title: AppConfig.seePlans,
        onPressed: () => Get.toNamed(AppRoutes.plansPage),
      ),
      appBar: CustomAppBar(
        title: AppConfig.selectPlan,
        onBack: () => Get.back(),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          LocalVideoPlayer(videoPath: 'assets/videos/video.mp4'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              AppConfig.moreInfo,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'CircularStd',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppConfig.primaryTextColor,
              ),
            ),
          ),
          ActualPlanCard(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PlanFeaturesWidget(),
          ),
        ],
      ),
    );
  }
}
