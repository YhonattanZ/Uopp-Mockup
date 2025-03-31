import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';
import 'package:prueba_uopp/routes/app_routes.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/custom_button.dart';
import 'package:prueba_uopp/ui/widgets/custom_tag.dart';
import 'package:prueba_uopp/ui/widgets/diagonal_container.dart';
import 'package:prueba_uopp/ui/widgets/local_video_player.dart';

class SeePlans extends StatefulWidget {
  SeePlans({super.key});

  @override
  State<SeePlans> createState() => _SeePlansState();
}

class _SeePlansState extends State<SeePlans> {
  final PlanController controller = Get.put(PlanController());

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    int visibleCount = 5;

    return Scaffold(
      bottomNavigationBar: CustomElevatedButton(
        title: 'Seleccionar',
        onPressed: () => Get.toNamed(AppRoutes.plansPage),
      ),
      appBar: CustomAppBar(
        title: AppConfig.selectPlan,
        onBack: () => Get.back(),
      ),
      body: ListView(
        children: [
          LocalVideoPlayer(videoPath: 'assets/videos/video.mp4'),
          // Expanded(child: PageView()),
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
                  CustomTagWidget(
                    text: 'PLUS',
                    align: TextAlign.center,
                    textColor: AppConfig.bgTextColor,
                    color: AppConfig.plusColor,
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Row(
                          children: [
                            Text(
                              'desde ',
                              style: TextStyle(
                                color: AppConfig.primaryTextColor,
                                fontFamily: 'CircularStd',
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              AppConfig.pricePlus,
                              style: TextStyle(
                                color: AppConfig.upgradeTextColor,
                                fontFamily: 'CircularStd',
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 124,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Color(0xffFF9F2E),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            'SIN PERMANENCIA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppConfig.bgTextColor,
                              fontFamily: 'CircularStd',
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: AppConfig.primaryTextColor),
                  right: BorderSide(color: AppConfig.primaryTextColor),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  textAlign: TextAlign.center,
                  AppConfig.infoPlusPlan,
                  style: TextStyle(
                    color: AppConfig.primaryTextColor,
                    fontFamily: 'CircularStd',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff81ECCA),
                border: Border(
                  left: BorderSide(color: AppConfig.primaryTextColor),
                  right: BorderSide(color: AppConfig.primaryTextColor),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Text(
                  AppConfig.plusFeatures,
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppConfig.upgradeTextColor,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: AppConfig.primaryTextColor),
                    right: BorderSide(color: AppConfig.primaryTextColor),
                  ),
                ),
                child: Column(
                  children: [
                    ...controller.plusPlan
                        .take(
                          showAll ? controller.plusPlan.length : visibleCount,
                        )
                        .map(
                          (f) => Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/Yes.png'),
                                SizedBox(width: 10),
                                Text(
                                  f["feature"],
                                  style: TextStyle(
                                    fontFamily: 'CircularStd',
                                    fontSize: 14,
                                    color: AppConfig.findPlanTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(color: AppConfig.planTextColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  showAll = !showAll;
                                });
                              },
                              child: Text(
                                showAll ? 'Mostrar menos' : 'Mostrar más',
                                style: TextStyle(
                                  fontFamily: 'CircularStd',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppConfig.planTextColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: AppConfig.planTextColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DiagonalContainer(),
          ),
        ],
      ),
    );
  }
}
