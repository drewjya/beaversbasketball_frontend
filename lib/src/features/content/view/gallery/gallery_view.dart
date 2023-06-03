import 'package:beaverbasketball/src/src.dart';

class GalleryView extends HookConsumerWidget {
  const GalleryView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return ListView(
      children: [
        SizedBox(
          height: !isActionEnabled ? 24 : 48,
        ),
        Text(
          "GALLERY",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: !isActionEnabled ? 24 : 48,
        ),
        ...List.generate(
          5,
          (index) => Container(
            height: MediaQuery.of(context).size.height * 0.27,
            decoration: BoxDecoration(
                color: BACKGROUND_CONTENT,
                border: Border.all(
                  color: NAVBAR,
                )),
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(
                  height: !isActionEnabled ? 18 : 28,
                ),
                Text(
                  "OUTING $index",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: !isActionEnabled ? 18 : 28,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 60,
                        mainAxisSpacing: 60),
                    itemBuilder: (context, index) {
                      return Container(
                        color: NAVBAR,
                        child: Text("$index"),
                      );
                    },
                  ),
                )),
                SizedBox(
                  height: !isActionEnabled ? 18 : 28,
                ),
                Text(
                  DateTime.now().toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: !isActionEnabled ? 18 : 28,
                ),
                Text(
                  "More Pictures:  ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: !isActionEnabled ? 18 : 28,
                ),
              ],
            ),
          ),
        ),
        FooterWidget(),
      ],
    );
  }
}
