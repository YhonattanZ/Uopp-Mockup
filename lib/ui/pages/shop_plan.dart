import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';

import 'package:prueba_uopp/ui/widgets/diagonal_container.dart';
import 'package:prueba_uopp/ui/widgets/features_plan.dart';
import 'package:prueba_uopp/ui/widgets/local_video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopPlan extends StatefulWidget {
  const ShopPlan({super.key});

  @override
  State<ShopPlan> createState() => _ShopPlanState();
}

class _ShopPlanState extends State<ShopPlan> {
  final PlanController controller = Get.put(PlanController());
  final PageController _controller = PageController();

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          LocalVideoPlayer(videoPath: 'assets/videos/video.mp4'),
          FeaturesPlanWidget(
            planName: 'SHOP',
            planPrice: AppConfig.priceShop,
            planInfo: AppConfig.infoShopPlan,
            planFeatures: AppConfig.shopFeatures,
            planColor: Color(0xff9CFFC6),
            featuresList: controller.shopPlan,
            txtColor: AppConfig.upgradeTextColor,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DiagonalContainer(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: AppConfig.planTextColor,
                  dotColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
