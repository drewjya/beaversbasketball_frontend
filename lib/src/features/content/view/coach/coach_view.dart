import 'package:beaverbasketball/src/src.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return ListView(
      children: [
        SizedBox(
          height: !isActionEnabled ? 24 : 48,
        ),
        Text(
          "COACH",
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
          padding: const EdgeInsets.all(30),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 60, mainAxisSpacing: 60),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: BACKGROUND_CONTENT,
                      border: Border.all(
                        width: 4,
                        color: NAVBAR,
                      ),
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      listCoach[index],
                      style: GoogleFonts.inter(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: listCoach.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        FooterWidget()
      ],
    );
  }
}
