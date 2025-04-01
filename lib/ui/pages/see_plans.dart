import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';
import 'package:prueba_uopp/routes/app_routes.dart';
import 'package:prueba_uopp/ui/pages/plus_plan.dart';
import 'package:prueba_uopp/ui/pages/shop_plan.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/custom_button.dart';
import 'package:prueba_uopp/ui/widgets/local_video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SeePlans extends StatefulWidget {
  const SeePlans({super.key});

  @override
  State<SeePlans> createState() => _SeePlansState();
}

class _SeePlansState extends State<SeePlans> {
  final PlanController controller = Get.put(PlanController());
  final PageController _pageController = PageController();

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomElevatedButton(
        title: 'Seleccionar',
        onPressed: () => Get.toNamed(AppRoutes.selectedPlanPage),
      ),
      appBar: CustomAppBar(
        title: AppConfig.selectPlan,
        onBack: () => Get.back(),
      ),
      body: Column(
        children: [
          LocalVideoPlayer(videoPath: 'assets/videos/video.mp4'),

          Expanded(
            child: PageView(
              controller: _pageController,
              children: [PlusPlan(), ShopPlan()],
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: ExpandingDotsEffect(
              activeDotColor: AppConfig.planTextColor,
              dotColor: Colors.grey,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
        ],
      ),
    );
  }
}
