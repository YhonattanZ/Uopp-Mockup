import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/custom_button.dart';
import 'package:prueba_uopp/ui/widgets/local_video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomElevatedButton(
        title: AppConfig.seePlans,
        onPressed: () {},
      ),
      appBar: CustomAppBar(
        title: AppConfig.selectPlan,
        onBack: () => Get.back(),
      ),
      body: Column(
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: AppConfig.planTextColor),
                top: BorderSide(color: AppConfig.planTextColor),
                right: BorderSide(color: AppConfig.planTextColor),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 62,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: AppConfig.findPlanTextColor),
                right: BorderSide(color: AppConfig.findPlanTextColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    width: 82,
                    height: 34,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(color: AppConfig.primaryTextColor),
                    ),
                    child: Text(
                      'Basic',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppConfig.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  AppConfig.priceBasic,
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xff81ECCA),
              border: Border(
                left: BorderSide(color: AppConfig.upgradeTextColor),
                bottom: BorderSide(color: AppConfig.upgradeTextColor),
                right: BorderSide(color: AppConfig.upgradeTextColor),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                textAlign: TextAlign.center,

                AppConfig.upgradePlan,
                style: TextStyle(
                  color: AppConfig.upgradeTextColor,
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
