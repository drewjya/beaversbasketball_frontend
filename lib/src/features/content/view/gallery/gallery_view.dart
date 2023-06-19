import 'package:beaverbasketball/src/src.dart';

class GalleryView extends HookConsumerWidget {
  const GalleryView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final user = ref.watch(authProvider).value;
    if (user != null) {
      return SingleChildScrollView(
        child: Column(
          children: [
            TitlePage(text: "GALLERY"),
            FooterWidget(),
          ],
        ),
      );
    }
    return ListView(
      children: [
        TitlePage(text: "GALLERY"),
        ...List.generate(
          5,
          (index) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height *
                    (isActionEnabled ? 0.65 : 0.45),
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  color: BACKGROUND_CONTENT,
                  border: Border.all(
                    color: NAVBAR,
                  ),
                ),
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.symmetric(horizontal: 30),
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
                    Expanded(
                        child: Center(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 60,
                          childAspectRatio: 0.95,
                        ),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              AssetConstant.carousel1,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )),
                    Text(
                      DateTime.now().toString(),
                      style: TextStyle(
                        fontSize: 25,
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
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: !isActionEnabled ? 18 : 28,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FooterWidget(),
      ],
    );
  }
}
