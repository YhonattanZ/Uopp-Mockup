import 'package:flutter/material.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/ui/widgets/custom_tag.dart';

class FeaturesPlanWidget extends StatefulWidget {
  final String planName;
  final String planPrice;
  final String planInfo;
  final String planFeatures;
  final Color planColor;
  final Color txtColor;
  final List<Map<String, dynamic>> featuresList;

  const FeaturesPlanWidget({
    super.key,
    required this.planName,
    required this.planPrice,
    required this.planInfo,
    required this.planFeatures,
    required this.planColor,
    required this.featuresList,
    required this.txtColor,
  });

  @override
  State<FeaturesPlanWidget> createState() => _FeaturesPlanWidgetState();
}

class _FeaturesPlanWidgetState extends State<FeaturesPlanWidget> {
  bool showAll = false;
  final int visibleCount = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPlanHeader(),
        _buildPlanInfo(),
        _buildFeatureTitle(),
        _buildFeatureList(),
      ],
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

  Widget _buildPlanInfo() {
    return Padding(
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
          padding: const EdgeInsets.all(5),
          child: Text(
            textAlign: TextAlign.center,
            widget.planInfo,
            style: _textStyle(16, AppConfig.primaryTextColor, FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureTitle() {
    return Padding(
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
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            widget.planFeatures,
            style: _textStyle(14, AppConfig.upgradeTextColor, FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureList() {
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
        child: Stack(
          children: [
            Positioned(
              right: -60,
              top: 10,
              child: Image.asset(
                'assets/icons/1.png',
                width: 217,
                height: 170,
                opacity: const AlwaysStoppedAnimation(0.2),
              ),
            ),
            Column(
              children: [
                ...widget.featuresList
                    .take(showAll ? widget.featuresList.length : visibleCount)
                    .map(
                      (f) => _buildFeatureItem(f["feature"]?.toString() ?? ''),
                    ),
                _buildShowMoreButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        children: [
          Image.asset('assets/icons/Yes.png'),
          SizedBox(width: 10),
          Text(feature, style: _textStyle(14, AppConfig.findPlanTextColor)),
        ],
      ),
    );
  }

  Widget _buildShowMoreButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Divider(color: AppConfig.planTextColor)),
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
                style: _textStyle(16, AppConfig.planTextColor, FontWeight.w500),
              ),
            ),
          ),
          Expanded(child: Divider(color: AppConfig.planTextColor)),
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
    FontWeight fontWeight = FontWeight.w500,
  ]) {
    return TextStyle(
      fontFamily: 'CircularStd',
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
