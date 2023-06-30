// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:beaverbasketball/src/features/content/model/achievement_model.dart';
import 'package:beaverbasketball/src/features/content/providers/achievement_providers.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';

class AchievementView extends HookConsumerWidget {
  const AchievementView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final isEdit = useState(false);
    final user = ref.watch(authProvider).value;
    final isAdd = useState(false);
    final achievement =
        (ref.watch(achievementProvider).value ?? <AchievementModel>[]);
    useEffect(() {
      isEdit.value = false;
    }, [ref.watch(achievementProvider)]);
    final data = groupBy(
      achievement,
      (p0) {
        return p0.title;
      },
    );
    log("$data");

    return ListView(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Center(child: TitlePage(text: "ACHIEVEMENT")),
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
        if (isEdit.value) ...[
          AddAchievement(
            isEdit: isEdit,
          ),
          ...achievement.mapFixed((element, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: EditAchievement(
                  achievement: element,
                  isEdit: isEdit,
                ),
              ))
        ] else
          ...data.map(
            (key, value) {
              print(value);
              return MapEntry(
                key,
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: BACKGROUND_CONTENT,
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: NAVBAR,
                          height: 45,
                          width: double.infinity,
                          child: Center(
                            child: key.toWidget(
                                fontSize: 25,
                                color: Colors.white,
                                textAlign: TextAlign.center),
                          ),
                        ),
                        CarouselSlider.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index, realIndex) {
                            return Image.network(
                              value[index].url_gambar.url,
                              fit: BoxFit.cover,
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                          ),
                        ),
                        ...value.mapFixed(
                          (element, index) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: NAVBAR),
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.symmetric(horizontal: 40).copyWith(
                              bottom: 20,
                              top: index == 0 ? 20 : 0,
                            ),
                            child: Column(
                              children: [
                                element.tanggal.toWidget(),
                                element.keterangan_gambar.toWidget(),
                                element.description.toWidget(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ).values,
        SizedBox(
          height: 20,
        ),
        FooterWidget(),
      ],
    );
  }
}

class EditAchievement extends HookConsumerWidget {
  final AchievementModel achievement;
  final ValueNotifier<bool> isEdit;
  const EditAchievement({
    Key? key,
    required this.achievement,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final editActive = useState(false);
    final tahun = useTextEditingController();
    final tanggal = useTextEditingController();
    final judul = useTextEditingController();
    final deskripsi = useTextEditingController();
    final gambar = useState<PlatformFile?>(null);
    useEffect(() {
      tahun.text = achievement.title;
      tanggal.text = formatDateWithMonthNameToDate(achievement.tanggal);
      judul.text = achievement.keterangan_gambar;
      deskripsi.text = achievement.description;
      return;
    }, [isEdit.value]);
    return Container(
      color: BACKGROUND_CONTENT,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Visibility(
        visible: editActive.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldCustom(
              label: "Tahun",
              controller: tahun,
            ),
            TextFieldCustom(
              label: "Tanggal",
              tangalController: tanggal,
              isDateTime: true,
            ),
            TextFieldCustom(
              label: "Judul",
              controller: judul,
            ),
            TextFieldCustom(
              label: "Deskripsi",
              controller: deskripsi,
            ),
            ImageWidget(
                label: "Gambar",
                file: (file) {
                  gambar.value = file;
                },
                isExpanded: false),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (tahun.isEmpty) {
                      showToast(context, "Tahun tidak boleh kosong");
                      return;
                    }
                    if (tanggal.isEmpty) {
                      showToast(context, "Tanggal tidak boleh kosong");
                      return;
                    }
                    if (judul.isEmpty) {
                      showToast(context, "Judul tidak boleh kosong");
                      return;
                    }
                    if (deskripsi.isEmpty) {
                      showToast(context, "Deskripsi tidak boleh kosong");
                      return;
                    }
                    if (gambar.value == null) {
                      showToast(context, "Gambar tidak boleh kosong");
                      return;
                    }
                    ref
                        .read(achievementProvider.notifier)
                        .editAchievement(id: "${achievement.id}", bodyString: {
                      "title": tahun.text,
                      "tanggal": tanggal.text,
                      "keterangan_gambar": judul.text,
                      "description": deskripsi.text,
                    }, bodyFile: {
                      "image": gambar.value!
                    });
                    editActive.value = false;
                  },
                  child: Text("Simpan")),
            ),
          ],
        ),
        replacement: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ("TAHUN\t:\t" + achievement.title).toWidget(),
                  ("TANGGAL\t:\t" + achievement.tanggal).toWidget(),
                  ("JUDUL\t:\t" + achievement.keterangan_gambar).toWidget(),
                  ("Deskripsi\t:\n" + achievement.description).toWidget(),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        editActive.value = true;
                      },
                      child: Text("Edit")),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref
                            .read(achievementProvider.notifier)
                            .deleteAchievement(
                                id: "${achievement.id}",
                                auth: ref.read(authProvider).value ?? "");
                      },
                      child: Text("Hapus")),
                ],
              ),
            ),
            Expanded(child: Image.network(achievement.url_gambar.url))
          ],
        ),
      ),
    );
  }
}

class AddAchievement extends HookConsumerWidget {
  final ValueNotifier<bool> isEdit;
  const AddAchievement({
    required this.isEdit,
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tahun = useTextEditingController();
    final tanggal = useTextEditingController();
    final judul = useTextEditingController();
    final deskripsi = useTextEditingController();
    final gambar = useState<PlatformFile?>(null);
    return Container(
      color: BACKGROUND_CONTENT,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ).copyWith(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldCustom(
            label: "Tahun",
            controller: tahun,
          ),
          TextFieldCustom(
            label: "Tanggal",
            tangalController: tanggal,
            isDateTime: true,
          ),
          TextFieldCustom(
            label: "Judul",
            controller: judul,
          ),
          TextFieldCustom(
            label: "Deskripsi",
            controller: deskripsi,
          ),
          ImageWidget(
              label: "Gambar",
              file: (file) {
                gambar.value = file;
              },
              isExpanded: false),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ElevatedButton(
                onPressed: () {
                  if (tahun.isEmpty) {
                    showToast(context, "Tahun tidak boleh kosong");
                    return;
                  }
                  if (tanggal.isEmpty) {
                    showToast(context, "Tanggal tidak boleh kosong");
                    return;
                  }
                  if (judul.isEmpty) {
                    showToast(context, "Judul tidak boleh kosong");
                    return;
                  }
                  if (deskripsi.isEmpty) {
                    showToast(context, "Deskripsi tidak boleh kosong");
                    return;
                  }
                  if (gambar.value == null) {
                    showToast(context, "Gambar tidak boleh kosong");
                    return;
                  }
                  ref
                      .read(achievementProvider.notifier)
                      .insertAchievement(bodyString: {
                    "title": tahun.text,
                    "tanggal": tanggal.text,
                    "keterangan_gambar": judul.text,
                    "description": deskripsi.text,
                  }, bodyFile: {
                    "image": gambar.value!
                  });
                  isEdit.value = false;
                },
                child: Text("Simpan")),
          ),
        ],
      ),
    );
  }
}
