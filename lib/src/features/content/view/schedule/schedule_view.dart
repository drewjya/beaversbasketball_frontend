import 'package:beaverbasketball/src/src.dart';

class ScheduleView extends HookConsumerWidget {
  const ScheduleView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return ListView(
      children: [
        TitlePage(text: "JADWAL RUTIN"),
        ...List.generate(
          2,
          (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: BACKGROUND_CONTENT,
            ),
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Wednesday",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ...["16.00 - 18.00", "18.00 - 20.00"].map(
                  (value) => Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: NAVBAR,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: !isActionEnabled ? 8 : 12,
                        ),
                        Text(
                          """
RC 1 = KU 14 16 18 Beginner Putra + KU 18 Putri 
RC 2 = KU 14 16 18 Expert Putra
RC 3 = Toddler + KU 10 Mix
""",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        TitlePage(text: "EVENTS"),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: NAVBAR,
          ),
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "7 JUNE 2023 - WEDNESDAY",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                  color: BACKGROUND_CONTENT,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
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
