// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beaverbasketball/src/features/content/model/news_model.dart';
import 'package:beaverbasketball/src/features/content/providers/achievement_providers.dart';
import 'package:beaverbasketball/src/features/content/providers/news_provider.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/file_picker.dart';

class NewsDetailView extends HookConsumerWidget {
  final NewsModel news;
  const NewsDetailView({
    required this.news,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isEdit = useState(false);
    final user = ref.watch(authProvider).value;
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final judul = useTextEditingController();
    final tanggal = useTextEditingController();
    final deskripsi = useTextEditingController();
    final gambar = useState<PlatformFile?>(null);
    useEffect(() {
      judul.text = news.title;
      tanggal.text = formatDateWithMonthNameToDate(
        news.tanggal,
      );
      deskripsi.text = news.description;
    }, []);
    return ListView(
      children: [
        if (isEdit.value) ...[
          TextButton(
            onPressed: () {
              if (judul.isEmpty) {
                showToast(context, "Judul Tidak Boleh Kosong");
                return;
              }
              if (tanggal.isEmpty) {
                showToast(context, "Tanggal Tidak Boleh Kosong");
                return;
              }
              if (deskripsi.isEmpty) {
                showToast(context, "Deskripsi Tidak Boleh Kosong");
                return;
              }
              if (gambar.value == null) {
                showToast(context, "Gambar Tidak Boleh Kosong");
                return;
              }
              ref
                  .read(newsProvider.notifier)
                  .editNews(id: "${news.id}", bodyString: {
                "title": judul.text,
                "tanggal": tanggal.text,
                "description": deskripsi.text,
              }, bodyFile: {
                "image": gambar.value!
              });
              isEdit.value = false;
              ref.read(isNewsDetailProvider.notifier).update((state) => false);
            },
            child: Text("Save"),
          ),
          TextFieldCustom(label: "Judul", controller: judul),
          TextFieldCustom(
              label: "Tanggal", isDateTime: true, tangalController: tanggal),
          TextFieldCustom(
              label: "Deskripsi", maxLines: true, controller: deskripsi),
          ImageWidget(
            label: "Gambar",
            file: (file) {
              gambar.value = file;
            },
            isExpanded: false,
          )
        ] else ...[
          Stack(
            alignment: Alignment.center,
            children: [
              Center(child: TitlePage(text: "${news.title}")),
              if (user != null)
                Align(
                  alignment: Alignment(
                      Alignment.centerRight.x - 0.1, Alignment.centerRight.y),
                  child: IconButton(
                    onPressed: () {
                      isEdit.value = !isEdit.value;
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: !isActionEnabled ? 20 : 50),
            child: Image.network(news.url_gambar.url),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: BACKGROUND_CONTENT,
              borderRadius: BorderRadius.circular(5),
            ),
            margin:
                EdgeInsets.symmetric(horizontal: !isActionEnabled ? 20 : 50),
            padding: EdgeInsets.all(!isActionEnabled ? 20 : 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                news.tanggal.toWidget(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                news.description.toWidget(fontSize: 16),
              ],
            ),
          )
        ],
        SizedBox(
          height: 45,
        ),
        FooterWidget()
      ],
    );
  }
}
