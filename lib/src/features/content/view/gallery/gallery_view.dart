import 'package:beaverbasketball/src/src.dart';

class GalleryView extends HookConsumerWidget {
  const GalleryView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "Gallery",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        ...List.generate(
          2,
          (index) => Container(
            height: 220,
            color: Colors.amber,
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Outing $index"),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              "Foto 1",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              "Foto 2",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              "Foto 3",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(DateTime.now().toString()),
                Text("More Pictures:  "),
              ],
            ),
          ),
        ),
        FooterWidget(),
      ],
    );
  }
}
