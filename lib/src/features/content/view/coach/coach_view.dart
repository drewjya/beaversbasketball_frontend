import 'package:beaverbasketball/src/core/common/constant/enum.dart';
import 'package:beaverbasketball/src/features/content/view/about/about_content.dart';
import 'package:flutter/material.dart';

class CoachView extends StatelessWidget {
  const CoachView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listCoach = [
      "Coach Andi",
      "Coach Intan",
      "Coach Doddy",
      "Coach Ary Chandra",
      "Coach Aklili",
      "Coach Tika",
      "Coach Lidya",
      "Coach Randy",
      "Coach Vandy",
      "Coach Fernando",
      "Coach Hendra",
    ];
    return ListView(
      children: [
        SubtitleWidget(label: "Coach"),
        ...listCoach.mapIndexed(
          (index, e, start, end) => Padding(
            padding: start ? const EdgeInsets.only(top: 8.0) : EdgeInsets.zero,
            child: ListTile(
              title: Text(
                e,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Divider(
            thickness: 2,
          ),
        ),
        FooterWidget()
      ],
    );
  }
}
