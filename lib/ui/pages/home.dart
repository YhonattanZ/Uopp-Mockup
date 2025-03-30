import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/local_video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppConfig.selectPlan,
        onBack: () => Get.back(),
      ),
      body: Column(
        children: [LocalVideoPlayer(videoPath: 'assets/videos/video.mp4')],
      ),
    );
  }
}
