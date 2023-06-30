import 'package:beaverbasketball/src/features/content/model/news_model.dart';
import 'package:beaverbasketball/src/features/content/providers/news_provider.dart';
import 'package:beaverbasketball/src/features/content/view/news/news_detail_view.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/file_picker.dart';

class NewsView extends HookConsumerWidget {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdit = useState(false);
    final isAdd = useState(false);
    final newsItem = useState<NewsModel?>(null);
    final user = ref.watch(authProvider).value;
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final titleStyle = TextStyle(
      fontSize: isActionEnabled ? 20 : 12,
      fontWeight: FontWeight.w700,
    );
    final bodyStyle = TextStyle(
      fontSize: isActionEnabled ? 18 : 10,
    );
    var news = (ref.watch(newsProvider).value ?? []).toList();

    NewsModel? headline;
    if (news.isNotEmpty) {
      headline = news.first;
      news.remove(headline);
    }
    if (ref.watch(isNewsDetailProvider)) {
      return NewsDetailView(
        news: newsItem.value!,
      );
    }

    return ListView(
      children: [
        if (isEdit.value) ...[
          Row(
            children: [
              TextButton(
                onPressed: () {
                  isEdit.value = false;
                },
                child: Text("Kembali"),
              ),
              TextButton(
                onPressed: () {
                  isAdd.value = true;
                },
                child: Text("Tambah"),
              ),
            ],
          ),
          ...(ref.watch(newsProvider).value ?? [])
              .mapFixed((element, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        newsItem.value = element;
                        ref
                            .read(isNewsDetailProvider.notifier)
                            .update((state) => true);
                      },
                      iconColor: Colors.white,
                      trailing: IconButton(
                          onPressed: () {
                            ref
                                .read(newsProvider.notifier)
                                .deleteNews(id: "${element.id}", auth: user!);
                          },
                          icon: Icon(Icons.close)),
                      title: Text(element.title),
                      subtitle: Text(element.tanggal),
                      textColor: Colors.white,
                      tileColor: BACKGROUND_CONTENT,
                    ),
                  )),
          if (isAdd.value) AddNews()
        ] else ...[
          Stack(
            alignment: Alignment.center,
            children: [
              Center(child: TitlePage(text: "HEADLINE NEWS")),
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
          if (headline == null)
            SizedBox()
          else
            Container(
              height: MediaQuery.of(context).size.height * (0.5),
              margin: EdgeInsets.symmetric(horizontal: 40),
              width: MediaQuery.of(context).size.height * (0.7),
              child: Column(children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Image.network(
                      headline.url_gambar.url,
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
                          headline.title,
                          style: titleStyle,
                        ),
                        Text(
                          "${headline.tanggal}",
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
                        news[index].title,
                        style: titleStyle,
                      ),
                      Text(
                        news[index].tanggal,
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
            itemCount: news.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
        SizedBox(
          height: 65,
        ),
        FooterWidget(),
      ],
    );
  }
}

class AddNews extends HookConsumerWidget {
  const AddNews({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdit = useState(false);
    final judul = useTextEditingController();
    final tanggal = useTextEditingController();
    final deskripsi = useTextEditingController();
    final gambar = useState<PlatformFile?>(null);

    return Column(
      children: [
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
            ref.read(newsProvider.notifier).insertNews(bodyString: {
              "title": judul.text,
              "tanggal": tanggal.text,
              "description": deskripsi.text,
            }, bodyFile: {
              "image": gambar.value!
            });
            isEdit.value = false;
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
      ],
    );
  }
}
