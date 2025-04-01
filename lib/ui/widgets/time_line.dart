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
            Image.asset('assets/icons/Yes.png'),
            if (!isLast)
              Container(width: 3, height: 50, color: Color(0xff56F3C2)),
          ],
        ),
        SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 2, color: Color(0xff2A6A57)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
