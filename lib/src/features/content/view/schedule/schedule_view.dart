import 'package:beaverbasketball/src/features/content/view/about/about_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScheduleView extends HookConsumerWidget {
  const ScheduleView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "Schedule",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Center(
          child: Text(
            "Jadwal Rutin",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        ...List.generate(
          2,
          (index) => Container(
            color: Colors.blueGrey,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Wednesday",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ...List.generate(
                  2,
                  (index) => Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.amberAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "16.00-18.00",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text("""
RC 1 = KU 14 16 18 Beginner Putra + KU 18 Putri 
RC 2 = KU 14 16 18 Expert Putra
RC 3 = Toddler + KU 10 Mix
""")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            "EVENTS",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Container(
          color: Colors.red,
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Wednesday",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ...List.generate(
                2,
                (index) => Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.amberAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "16.00-18.00",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text("""
RC 1 = KU 14 16 18 Beginner Putra + KU 18 Putri 
RC 2 = KU 14 16 18 Expert Putra
RC 3 = Toddler + KU 10 Mix
""")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 35,
        ),
        FooterWidget(),
      ],
    );
  }
}
