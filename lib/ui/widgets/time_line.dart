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
                ? Image.asset('assets/icons/yes purple.png')
                : Image.asset('assets/icons/Yes.png'),
            if (!isLast)
              Container(width: 3, height: 50, color: Color(0xff56F3C2))
            else
              Container(width: 3, height: 50, color: Color(0xffE9E7FF)),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Wrap(
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: Row(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              color: AppConfig.findPlanTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text(
                            isLast ? '' : 'Promo STARTER -50%',
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              color: AppConfig.findPlanTextColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            date,
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              color: AppConfig.findPlanTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: isLast ? '' : "19,99€ ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppConfig.primaryTextColor,
                                    fontFamily: 'CircularStd',
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w500,
                                    height: 0.8,
                                  ),
                                ),

                                TextSpan(
                                  text: isLast ? "19,99€" : "9,99€",
                                  style: TextStyle(
                                    fontFamily: 'CircularStd',
                                    color:
                                        isLast
                                            ? AppConfig.primaryTextColor
                                            : AppConfig.upgradeTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    height: 1.0,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
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
