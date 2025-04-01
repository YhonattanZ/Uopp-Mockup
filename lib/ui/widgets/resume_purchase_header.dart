import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';
import 'package:prueba_uopp/ui/widgets/time_line.dart';

class ResumePurchaseHeader extends StatelessWidget {
  const ResumePurchaseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final PlanController controller = Get.put(PlanController());

    return Wrap(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(120)),
                  ),
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  color: AppConfig.plusColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        AppConfig.plusPlan,
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          color: AppConfig.bgTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            infoPlan(),
            Spacer(),
            pricePlan(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Expanded(child: Divider()),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 260,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.dates.length,
              itemBuilder:
                  (context, i) => TimelineItem(
                    title: controller.dates[i]['title'].toString(),
                    date: controller.dates[i]['date'].toString(),
                    isLast: i == controller.dates.length - 1,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget pricePlan() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 20,
            width: 130,
            decoration: BoxDecoration(
              color: Color(0xffFFD000),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                'Ahorras 9,99€ al mes ',
                style: TextStyle(
                  fontFamily: 'CircularStd',

                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Text(
            '19,99€',
            style: TextStyle(
              fontFamily: 'CircularStd',
              color: AppConfig.primaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget infoPlan() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Plan PLUS 120',
            style: TextStyle(
              fontFamily: 'CircularStd',
              color: AppConfig.primaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Pago mensual',
            style: TextStyle(
              fontFamily: 'CircularStd',
              color: AppConfig.findPlanTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
