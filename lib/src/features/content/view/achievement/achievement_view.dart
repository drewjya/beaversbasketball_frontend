import 'package:beaverbasketball/src/src.dart';

class AchievementView extends HookConsumerWidget {
  const AchievementView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "Achievement",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 30),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.grey,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(DateTime.now().toString()),
                          Text("KU $index"),
                          ...List.generate(
                            5,
                            (index) => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
