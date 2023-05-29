import 'package:beaverbasketball/src/src.dart';

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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          leading: SizedBox(),
          title: SubtitleWidget(label: "Coach"),
          actions: [SizedBox()],
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        SliverGrid.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 65,
                ),
                Text(listCoach[index])
              ],
            );
          },
          itemCount: listCoach.length,
        ),
        SliverToBoxAdapter(child: FooterWidget())
      ],
    );
  }
}
