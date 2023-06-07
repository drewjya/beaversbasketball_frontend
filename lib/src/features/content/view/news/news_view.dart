import 'package:beaverbasketball/src/src.dart';

class NewsView extends HookConsumerWidget {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final titleStyle = TextStyle(
      fontSize: isActionEnabled ? 20 : 12,
      fontWeight: FontWeight.w700,
    );
    final bodyStyle = TextStyle(
      fontSize: isActionEnabled ? 18 : 10,
    );
    return ListView(
      children: [
        TitlePage(text: "HEADLINE NEWS"),
        Container(
          height: MediaQuery.of(context).size.height * (0.5),
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: MediaQuery.of(context).size.height * (0.7),
          child: Column(children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  AssetConstant.carousel1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                color: NAVBAR,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Klub Basket Indonesia Muda Kembali Berlatih Ke Lapangan ABC Senayan",
                      style: titleStyle,
                    ),
                    Text(
                      "${DateTime.now()}",
                      style: bodyStyle,
                    ),
                  ],
                )),
          ]),
        ),
        TitlePage(text: "MORE NEWS"),
        ListView.separated(
          itemBuilder: (context, index) {
            return Container(
                color: NAVBAR,
                margin: EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.height * (0.7),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Klub Basket Indonesia Muda Kembali Berlatih Ke Lapangan ABC Senayan",
                      style: titleStyle,
                    ),
                    Text(
                      "${DateTime.now()}",
                      style: bodyStyle,
                    ),
                  ],
                ));
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20,
            );
          },
          itemCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
        SizedBox(
          height: 65,
        ),
        FooterWidget(),
      ],
    );
  }
}
