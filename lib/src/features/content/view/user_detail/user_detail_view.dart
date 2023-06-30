// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beaverbasketball/src/features/content/model/user_model.dart';
import 'package:beaverbasketball/src/features/content/providers/pendaftar_provider.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UserDetailView extends HookConsumerWidget {
  const UserDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(authProvider).value != null;
    final users = ref.watch(pendaftarProvider).value ?? [];
    return user
        ? ListView(
            children: [
              TitlePage(text: "REGISTRATION LIST"),
              Container(
                color: NAVBAR,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: "MEMBERS".toWidget(
                      color: Colors.white, textAlign: TextAlign.center),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: NAVBAR,
                    ),
                    color: BACKGROUND_CONTENT),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: WidthWidget(users: users.reversed.toList()),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              FooterWidget(),
            ],
          )
        : SizedBox.shrink();
  }
}

class WidthWidget extends HookWidget {
  const WidthWidget({
    super.key,
    required this.users,
  });

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    final width = useState(0.0);
    return MeasureSize(
      onChange: (size) {
        width.value = size.width;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...users.mapFixed(
            (item, index) {
              return [
                WidgetTesas(
                  index: index,
                  item: item,
                ),
                Container(
                  height: 2,
                  width: width.value,
                  color: NAVBAR,
                )
              ];
            },
          ).expand((element) => element),
        ],
      ),
    );
  }
}

class WidgetTesas extends HookWidget {
  final int index;
  final UserModel item;
  const WidgetTesas({
    required this.index,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final height = useState(0.0);

    return MeasureSize(
      onChange: (size) {
        height.value = size.height;
      },
      child: Container(
        child: Row(children: [
          Container(
            width: 200,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.nama_lengkap),
                Text(item.jenis_kelamin),
                Text(item.tempat_lahir + ", ${item.tanggal}"),
                Text(item.nomor_wa),
                Text(item.alamat),
              ],
            ),
          ),
          Container(
            width: 2,
            height: height.value,
            color: NAVBAR,
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Asal Sekolah\t:" + item.asal_sekolah),
                Text("Nama Ayah\t:" + item.nama_bpk),
                Text("Nomor HP Ayah\t:" + item.nomor_bpk),
                Text("Nama Ibu\t:" + item.nama_ibu),
                Text("Nomor HP Ibu\t:" + item.nomor_ibu),
              ],
            ),
          ),
          Container(
            width: 2,
            height: height.value,
            color: NAVBAR,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cabang Daftar:" + item.cabang_daftar),
                Text.rich(TextSpan(text: "Dokumen KK", children: [
                  WidgetSpan(
                      child: TextButton(
                          onPressed: () {
                            launchUrlString(item.dokumen_kk.url);
                          },
                          child: "Klik Disini".toWidget()))
                ])),
                Text.rich(TextSpan(text: "Dokumen Akta Kelahiran", children: [
                  WidgetSpan(
                      child: TextButton(
                          onPressed: () {
                            launchUrlString(item.dokumen_akta.url);
                          },
                          child: "Klik Disini".toWidget()))
                ])),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
