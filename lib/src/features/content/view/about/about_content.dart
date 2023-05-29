// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';

import 'package:beaverbasketball/src/src.dart';

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
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "History",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Container(
          height: 300,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 30),
          color: Colors.red,
          child: Center(
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            "FOUNDER",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0)
              .copyWith(top: 8, bottom: 20),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 80,
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 80,
                ),
              ],
            ),
          ),
        ),
        FooterWidget(),
        // SliverStickyHeader(
        //   header: Container(
        //     height: 40,
        //     decoration: BoxDecoration(
        //       color: Theme.of(context).primaryColor,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        //     child: Align(
        //       alignment: Alignment.centerLeft,
        //       child: Text.rich(
        //         TextSpan(
        //             text: "/",
        //             style: TextStyle(
        //               fontSize: 20,
        //             ),
        //             children: ["history", "organisasi"]
        //                 .take(ref.watch(currentIndexAboutProvider) + 1)
        //                 .mapIndexed(
        //                   (e, i, first, last) => TextSpan(
        //                       text: "$i/",
        //                       style: TextStyle(
        //                           fontWeight: last ? FontWeight.w700 : null)),
        //                 )
        //                 .toList()),
        //       ),
        //     ),
        //   ),
        //   sticky: true,
        //   sliver: SliverToBoxAdapter(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         SubtitleWidget(label: "History"),
        //         MeasureSize(
        //           onChange: (size) {
        //             ref
        //                 .read(aboutPotitionProvider.notifier)
        //                 .addValue(MapEntry("history", size.height));
        //           },
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 10.0)
        //                 .copyWith(top: 8),
        //             child: Text("""
        //         Perbasi didirikan pada tahun 1951, Komite Olimpiade Indonesia (KOI) untuk menyusun organisasi olahraga bola basket Indonesia. Atas prakarsa kedua tokoh ini, pada tanggal 23 Oktober 1951 dibentuklah organisasi bola basket Indonesia dengan nama Persatuan Basketball Seluruh Indonesia, disingkat Perbasi. Tony Wen menduduki jabatan ketua serta Wim Latumeten sebagai sekretaris. Tahun 1955 namanya diubah dan disesuaikan dengan perbendaharaan bahasa Indonesia, menjadi Persatuan Bola Basket Seluruh Indonesia dan tetap disingkat Perbasi.

        //         Perbasi menganut sistem vertikal berjenjang, yang dimulai dari tingkat perkumpulan, pengurus cabang (pengcab) Perbasi, pengurus daerah (pengda) Perbasi, sampai kepada pengurus besar (PB) Perbasi. Dalam perjalanannya PB Perbasi telah beberapa kali berganti kepengurusan. Tercatat pengusaha muda Noviantika Nasution pernah menjabat sebagai Ketua Umum PB Perbasi masa jabatan 2006-2010, setelah sebelumnya jabatan Ketua Umum dipegang oleh Gubernur DKI, Sutiyoso.

        //         Pada 2010 Ketua Umum PB Perbasi dipegang oleh mantan Kepala Badan Kebijakan Fiskal Kementerian Keuangan Republik Indonesia Anggito Abimanyu, setelah unggul 133 suara dari satu calon lainnya Azrul Ananda di Musyawarah Nasional Perbasi di Jakarta.[1]

        //         Tahapan kongres yang molor membuat kongres baru bisa digelar 13-14 Maret 2015. Danny Kosasih terpilih dengan mengalahkan Azrul."""),
        //           ),
        //         ),
        //         MeasureSize(
        //           onChange: (size) {
        //             ref
        //                 .read(aboutPotitionProvider.notifier)
        //                 .addValue(MapEntry("history", size.height));
        //           },
        //           child: Padding(
        //             padding: const EdgeInsets.all(10.0),
        //             child: Divider(
        //               thickness: 2,
        //             ),
        //           ),
        //         ),
        //         SubtitleWidget(label: "Organisasi"),
        //         MeasureSize(
        //           onChange: (size) {
        //             ref
        //                 .read(aboutPotitionProvider.notifier)
        //                 .addValue(MapEntry("organisasi", size.height));
        //           },
        // child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10.0)
        //       .copyWith(top: 8, bottom: 20),
        //   child: Center(
        //     child: Wrap(
        //       alignment: WrapAlignment.center,
        //       crossAxisAlignment: WrapCrossAlignment.center,
        //       children: [
        //         CircleAvatar(
        //           radius: 80,
        //         ),
        //         SizedBox(
        //           width: 20,
        //         ),
        //         CircleAvatar(
        //           radius: 80,
        //         ),
        //         SizedBox(
        //           width: 20,
        //         ),
        //         CircleAvatar(
        //           radius: 80,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        //         ),
        //         FooterWidget(),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
        ),
        child: (isActionEnabled)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: buildFooterChild(isActionEnabled)),
                  if (isActionEnabled)
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text("Alamat"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Raffles College - Kebon Jeruk"),
                          Text("Jalan Arjuna Utara no. 35 Jakarta Barat."),
                          Text("Sekolah Victory Plus Bekasi,"),
                          SizedBox(
                            height: 12,
                          ),
                          Text("Perumahan Kemang Pratama,"),
                          Text("Jalan Citra Niaga Raya Bloc AO1-14,"),
                          Text("Bojong Rawalumbu Kota Bekasi."),
                        ],
                      ),
                    ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildFooterChild(isActionEnabled),
              ),
      ),
    );
  }

  buildFooterChild(bool isActionEnabled) {
    int loadNum() => Random().nextInt(255);
    return [
      SizedBox(
        width: isActionEnabled ? 10 : 0,
        height: !isActionEnabled ? 10 : 0,
      ),
      if (!isActionEnabled) ...[
        Text("Supported By"),
        SizedBox(
          height: 10,
        ),
        Row(
          children: List.generate(
              5,
              (index) => Container(
                    height: 45,
                    width: 45,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(loadNum(), loadNum(), loadNum(), 1),
                    ),
                  )),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Partnership With"),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 35,
          color: Colors.white,
          child: Image.asset(AssetConstant.iconBPJS),
        ),
      ] else ...[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Supported By"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: List.generate(
                  5,
                  (index) => Container(
                        height: 45,
                        width: 45,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(
                              loadNum(), loadNum(), loadNum(), 1),
                        ),
                      )),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Partnership With"),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 35,
              color: Colors.white,
              child: Image.asset(AssetConstant.iconBPJS),
            ),
          ],
        )
      ],
      SizedBox(
        width: isActionEnabled ? 20 : 0,
        height: !isActionEnabled ? 40 : 0,
      ),
      if (!isActionEnabled) ...[
        Text("Contact Us"),
        SizedBox(
          width: isActionEnabled ? 20 : 0,
          height: !isActionEnabled ? 20 : 0,
        ),
      ],
      if (isActionEnabled) ...[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contact Us"),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.asset(
                              AssetConstant.iconIg,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("beaversbasketball"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          child: Image.asset(AssetConstant.iconWa),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("081296834488"),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Image.asset(
                            AssetConstant.iconEmail,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("beaverbasketballid@gmail.com"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.asset(
                              AssetConstant.iconTokopedia,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("beaversofficialstore"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          child: Image.asset(AssetConstant.iconYoutube),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Beavers Brave Official"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ] else ...[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Row(
                children: [
                  Container(
                    width: 40,
                    child: Image.asset(
                      AssetConstant.iconIg,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("beaversbasketball"),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  child: Image.asset(AssetConstant.iconWa),
                ),
                SizedBox(
                  width: 8,
                ),
                Text("081296834488"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  width: 42,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    AssetConstant.iconEmail,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text("beaverbasketballid@gmail.com"),
              ],
            ),
          ],
        ),
        SizedBox(
          width: isActionEnabled ? 20 : 0,
          height: !isActionEnabled ? 20 : 0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Row(
                children: [
                  Container(
                    width: 40,
                    child: Image.asset(
                      AssetConstant.iconTokopedia,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("beaversofficialstore"),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  child: Image.asset(AssetConstant.iconYoutube),
                ),
                SizedBox(
                  width: 8,
                ),
                Text("Beavers Brave Official"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text("Alamat"),
            SizedBox(
              height: 12,
            ),
            Text("Raffles College - Kebon Jeruk"),
            Text("Jalan Arjuna Utara no. 35 Jakarta Barat."),
            Text("Sekolah Victory Plus Bekasi,"),
            SizedBox(
              height: 12,
            ),
            Text("Perumahan Kemang Pratama,"),
            Text("Jalan Citra Niaga Raya Bloc AO1-14,"),
            Text("Bojong Rawalumbu Kota Bekasi."),
          ],
        ),
      ],
    ];
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
