import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';
import 'package:prueba_uopp/ui/widgets/custom_tag.dart';

class PlusCard extends StatefulWidget {
  final String planName;
  final String subtext;
  final String planPrice;
  final Color planColor;
  final Color txtColor;
  final int index;

  const PlusCard({
    super.key,
    required this.planName,
    required this.planPrice,
    required this.planColor,

    required this.txtColor,
    required this.subtext,
    required this.index,
  });

  @override
  State<PlusCard> createState() => _PlusCardState();
}

class _PlusCardState extends State<PlusCard> {
  final PlanController controller = Get.put(PlanController());

  bool showAll = false;
  final int visibleCount = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildPlanHeader(), _buildFeatureList(widget.index)],
    );
  }

  Widget _buildPlanHeader() {
    return Padding(
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
              subtitle: widget.subtext,
              width: 210,
              text: widget.planName,
              align: TextAlign.center,
              textColor: widget.txtColor,
              color: widget.planColor,
            ),
            Spacer(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Row(
                    children: [
                      Text(
                        'Desde ',
                        style: _textStyle(13, AppConfig.primaryTextColor),
                      ),
                      Text(
                        widget.planPrice,
                        style: _textStyle(15, AppConfig.upgradeTextColor),
                      ),
                    ],
                  ),
                ),
                _buildNoPermanenceTag(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureList(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: AppConfig.primaryTextColor),
            right: BorderSide(color: AppConfig.primaryTextColor),
          ),
        ),
        child: SizedBox(
          height: 90,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, i) {
              return _buildFeatureItem(
                controller.plans[index]['share'],
                controller.plans[index]['description'],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String feature, String days) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Image.asset('assets/icons/Yes.png'),
                SizedBox(width: 10),
                Text(days, style: _textStyle(14, AppConfig.findPlanTextColor)),
              ],
            ),
          ),
          Row(
            children: [
              Image.asset('assets/icons/Yes.png'),
              SizedBox(width: 10),
              SizedBox(
                width: 300,
                child: Text(
                  feature,
                  style: _textStyle(14, AppConfig.findPlanTextColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNoPermanenceTag() {
    return Padding(
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
          style: _textStyle(9, AppConfig.bgTextColor, FontWeight.w400),
        ),
      ),
    );
  }

  TextStyle _textStyle(
    double size,
    Color color, [
    FontWeight fontWeight = FontWeight.w400,
  ]) {
    return TextStyle(
      fontFamily: 'CircularStd',
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
