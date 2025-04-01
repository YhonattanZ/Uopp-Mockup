import 'package:flutter/material.dart';
import 'package:prueba_uopp/config/config.dart';

class TimelineItem extends StatelessWidget {
  final String title;
  final String date;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.title,
    required this.date,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            isLast
                ? Image.asset('assets/icons/Yes.png')
                : Image.asset('assets/icons/Yes.png'),
            if (!isLast)
              Container(width: 3, height: 50, color: Color(0xff56F3C2))
            else
              Container(width: 3, height: 50, color: Color(0xffE9E7FF)),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    width: 2,
                    color:
                        isLast ? Color(0xffE9E7FF) : AppConfig.upgradeTextColor,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              color: AppConfig.findPlanTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
