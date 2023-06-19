import 'package:beaverbasketball/src/features/content/providers/coach_providers.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:google_fonts/google_fonts.dart';

class CoachView extends ConsumerWidget {
  const CoachView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final listCoach = {
      "Coach Ary Chandra": AssetConstant.coachAry,
      "Coach Hendra Su": AssetConstant.coachHendra,
      "Coach Vandy Susanto": AssetConstant.coachVandy,
      "Coach Lidya": AssetConstant.coachLidya,
      "Coach Asdila Arruna": AssetConstant.coachAsdila,
      "Coach Athini Mardlatika": AssetConstant.coachAthini,
    };
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return RefreshIndicator(
      onRefresh: () => ref.read(coachProvider.notifier).loadCoach(),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          TitlePage(text: "COACH"),
          ref.watch(coachProvider).maybeWhen(
                orElse: () => Text("Or Else"),
                onSuccess: (value) => SelectableText(
                    "${value.mapFixed((element, index) => element.url_gambar)}"),
              ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: isActionEnabled ? 60 : 5,
                mainAxisSpacing: isActionEnabled ? 60 : 5,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.all(isActionEnabled ? 20 : 5),
                      decoration: BoxDecoration(
                        color:
                            listCoach.entries.elementAt(index).value.isNotEmpty
                                ? null
                                : BACKGROUND_CONTENT,
                        image: listCoach.entries
                                .elementAt(index)
                                .value
                                .isNotEmpty
                            ? DecorationImage(
                                image: AssetImage(
                                    listCoach.entries.elementAt(index).value),
                                fit: BoxFit.cover,
                              )
                            : null,
                        border: Border.all(
                          width: isActionEnabled ? 4 : 2,
                          color: NAVBAR,
                        ),
                      ),
                    )),
                    Container(
                      height: isActionEnabled ? 125 : 85,
                      child: Text(
                        listCoach.entries.elementAt(index).key,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: isActionEnabled ? 25 : 10,
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
      ),
    );
  }
}
