// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:beaverbasketball/src/src.dart';
import 'package:google_fonts/google_fonts.dart';

scrollLoggerListener(ScrollController controller, WidgetRef ref) {
  if (controller.hasClients) {
    final data = ref.watch(aboutPotitionProvider).entries.toList();

    double total = 0;
    int lastIndex = 0;
    for (var i = 0; i < data.length; i++) {
      if (total <= (controller.position.pixels + 80)) {
        total += data[i].value;

        lastIndex = i;
      }
    }

    ref.read(currentIndexAboutProvider.notifier).changeindex(lastIndex);
  }
}

class AboutContent extends HookConsumerWidget {
  const AboutContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return ListView(
      children: [
        SizedBox(
          height: !isActionEnabled ? 24 : 48,
        ),
        Text(
          "HISTORY",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: !isActionEnabled ? 24 : 48,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: isActionEnabled ? 50 : 20),
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: BACKGROUND_CONTENT,
            border: Border.all(
              color: NAVBAR,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: isActionEnabled ? 25 : 15,
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(
                  "Beavers Basketball Club resmi didirikan pada tanggal 1 November 2018. Beavers Basketball Club didirikan dengan landasan kuat untuk melakukan pembinaan terhadap kegiatan bola basket terutama pada kelompok umur.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: isActionEnabled ? 20 : 10),
                Text(
                  "Beavers Basketball Club fokus untuk melakukan program pembinaan bola basket mulai dari usia 3 tahun sampai dengan usia 18 tahun putra dan putri.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: isActionEnabled ? 20 : 10),
                Text(
                  "Selain kelompok umur pembinaan, Beavers Basketball Club juga memiliki kelompok umur 19 tahun sampai dengan 35 tahun untuk berpartisipasi di berbagai tournament dan kompetisi yang ada. Tidak berhenti sampai usia 35 tahun, Beavers Basketball Club punya tim kelompok umur 35 tahun keatas atau yang lebih dikenal dengan kelompok umur veteran.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: isActionEnabled ? 20 : 10),
                Text(
                  "Beavers Basketball Club punya visi besar untuk melakukan pembinaan bola basket dengan didukung oleh kemampuan management yang baik. Management yang dimaksud mulai dari kualitas kepelatihan, keaktifan sosial media, kemampuan untuk branding yang kuat dan masih banyak hal-hal baik lainnya.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: isActionEnabled ? 20 : 10),
                Text(
                  "Sebagai bentuk keserius Beavers Basketball Club juga sudah dilengkapi dengan badan hukum dengan PT BINA VISI SUKSES sebagai nama perusahaan yang terdaftar.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: isActionEnabled ? 20 : 10),
                Text(
                  "Beavers Basketball Club mempunyai tagline yaitu Stay Together and Be Brave, dimana BRAVE memiliki arti yaitu Brave, Respect, Attitudes, Value dan Enthusiasm.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: isActionEnabled ? 20 : 10),
                Text(
                  "Dalam mencapai visi besar tersebut, management Beavers Basketball Club sadar betul harus melakukan banyak kolaborasi dengan berbagai pihak baik internal ataupun external. Internal contohnya dengan orang tua para pemain, dan pemain itu sendiri. External contohnya dengan pihak ketiga yang dapat membantu kelancaran dan dapat memberikan Value tambahan kepada Beavers Basketball Club.",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: !isActionEnabled ? 24 : 48,
        ),
        Text(
          "FOUNDER",
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
          padding: const EdgeInsets.symmetric(horizontal: 60.0)
              .copyWith(top: 8, bottom: 20),
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
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
                        "$index",
                        style: GoogleFonts.inter(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 3),
        ),
        FooterWidget(),
      ],
    );
  }
}

class SubtitleWidget extends StatefulHookConsumerWidget {
  final String label;
  const SubtitleWidget({
    required this.label,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SubtitleWidgetState();
}

class _SubtitleWidgetState extends ConsumerState<SubtitleWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
      onChange: (size) {
        ref
            .read(aboutPotitionProvider.notifier)
            .addValue(MapEntry(widget.label.toLowerCase(), size.width));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
