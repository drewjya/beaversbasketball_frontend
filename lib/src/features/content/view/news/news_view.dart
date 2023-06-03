import 'package:beaverbasketball/src/src.dart';

class NewsView extends HookConsumerWidget {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "HEADLINE NEWS",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          color: Colors.green,
          child: Column(children: [
            Spacer(flex: 3),
            Container(
                color: NAVBAR,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Klub Basket Indonesia Muda Kembali Berlatih Ke Lapangan ABC Senayan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text("${DateTime.now()}"),
                  ],
                )),
          ]),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "MORE NEWS",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListView.separated(
          itemBuilder: (context, index) {
            return Container(
                color: NAVBAR,
                margin: EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Klub Basket Indonesia Muda Kembali Berlatih Ke Lapangan ABC Senayan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text("${DateTime.now()}"),
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
