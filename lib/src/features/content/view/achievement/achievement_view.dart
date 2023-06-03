import 'package:beaverbasketball/src/src.dart';

class AchievementView extends HookConsumerWidget {
  const AchievementView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return ListView(
      children: [
        SizedBox(
          height: !isActionEnabled ? 24 : 48,
        ),
        Text(
          "ACHIEVEMENT",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: !isActionEnabled ? 24 : 48,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isActionEnabled ? 90.0 : 20, vertical: 20),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: isActionEnabled ? 60 : 20,
              crossAxisSpacing: isActionEnabled ? 60 : 20,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      color: Colors.green,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: isActionEnabled ? 60 : 20,
                              padding: EdgeInsets.all(8).copyWith(
                                top: isActionEnabled ? 8 : 4,
                                bottom: isActionEnabled ? 8 : 4,
                              ),
                              color: NAVBAR,
                              child: Text(
                                "28 MAY 2023",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: BACKGROUND_CONTENT,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: FittedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateTime.now().toString(),
                                  ),
                                  Text("KU $index"),
                                  ...List.generate(
                                    5,
                                    (index) => Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Badge(),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Ini Nama event $index"),
                                        ]),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: 5,
          ),
        ),
        FooterWidget(),
      ],
    );
  }
}
