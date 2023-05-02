// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:beaverbasketball/src/core/common/constant/asset.dart';
import 'package:beaverbasketball/src/core/common/widget/measure_size.dart';
import 'package:beaverbasketball/src/features/content/providers/content_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beaverbasketball/src/core/common/constant/enum.dart';

scrollLoggerListener(ScrollController controller, WidgetRef ref) {
  if (controller.hasClients) {
    final data = ref.watch(aboutPotitionProvider).entries.toList();

    double total = 0;
    int lastIndex = 0;
    for (var i = 0; i < data.length; i++) {
      if (total <= (controller.position.pixels + 80)) {
        total += data[i].value;
        log(data[i].key);
        lastIndex = i;
      }
    }
    log(lastIndex.toString());
    ref.read(currentIndexAboutProvider.notifier).changeindex(lastIndex);
  }
}

class AboutContent extends HookConsumerWidget {
  const AboutContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = useScrollController();
    useEffect(() {
      controller.addListener(() => scrollLoggerListener(controller, ref));
      return null;
    }, [""]);

    final isActionEnabled = MediaQuery.of(context).size.width > 800;

    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverStickyHeader(
          header: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                    text: "/",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    children: ["history", "organisasi"]
                        .take(ref.watch(currentIndexAboutProvider) + 1)
                        .mapIndexed(
                          (e, i, first, last) => TextSpan(
                              text: "$i/",
                              style: TextStyle(
                                  fontWeight: last ? FontWeight.w700 : null)),
                        )
                        .toList()),
              ),
            ),
          ),
          sticky: true,
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubtitleWidget(label: "History"),
                MeasureSize(
                  onChange: (size) {
                    ref
                        .read(aboutPotitionProvider.notifier)
                        .addValue(MapEntry("history", size.height));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0)
                        .copyWith(top: 8),
                    child: Text("""
                Perbasi didirikan pada tahun 1951, Komite Olimpiade Indonesia (KOI) untuk menyusun organisasi olahraga bola basket Indonesia. Atas prakarsa kedua tokoh ini, pada tanggal 23 Oktober 1951 dibentuklah organisasi bola basket Indonesia dengan nama Persatuan Basketball Seluruh Indonesia, disingkat Perbasi. Tony Wen menduduki jabatan ketua serta Wim Latumeten sebagai sekretaris. Tahun 1955 namanya diubah dan disesuaikan dengan perbendaharaan bahasa Indonesia, menjadi Persatuan Bola Basket Seluruh Indonesia dan tetap disingkat Perbasi.
                
                Perbasi menganut sistem vertikal berjenjang, yang dimulai dari tingkat perkumpulan, pengurus cabang (pengcab) Perbasi, pengurus daerah (pengda) Perbasi, sampai kepada pengurus besar (PB) Perbasi. Dalam perjalanannya PB Perbasi telah beberapa kali berganti kepengurusan. Tercatat pengusaha muda Noviantika Nasution pernah menjabat sebagai Ketua Umum PB Perbasi masa jabatan 2006-2010, setelah sebelumnya jabatan Ketua Umum dipegang oleh Gubernur DKI, Sutiyoso.
                
                Pada 2010 Ketua Umum PB Perbasi dipegang oleh mantan Kepala Badan Kebijakan Fiskal Kementerian Keuangan Republik Indonesia Anggito Abimanyu, setelah unggul 133 suara dari satu calon lainnya Azrul Ananda di Musyawarah Nasional Perbasi di Jakarta.[1]
                
                Tahapan kongres yang molor membuat kongres baru bisa digelar 13-14 Maret 2015. Danny Kosasih terpilih dengan mengalahkan Azrul."""),
                  ),
                ),
                MeasureSize(
                  onChange: (size) {
                    ref
                        .read(aboutPotitionProvider.notifier)
                        .addValue(MapEntry("history", size.height));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                ),
                SubtitleWidget(label: "Organisasi"),
                MeasureSize(
                  onChange: (size) {
                    ref
                        .read(aboutPotitionProvider.notifier)
                        .addValue(MapEntry("organisasi", size.height));
                  },
                  child: Padding(
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
                ),
                Container(
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
                                  children: _buildListData()),
                            ],
                          )
                        : Column(
                            children: _buildListData(),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildListData() {
    return [
      SizedBox(
        width: 10,
      ),
      Text("Supported By"),
      SizedBox(
        width: 20,
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
