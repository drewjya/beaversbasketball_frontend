// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beaverbasketball/src/features/content/model/gallery_model.dart';
import 'package:beaverbasketball/src/features/content/providers/gallery_provider.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/file_picker.dart';

class GalleryView extends HookConsumerWidget {
  const GalleryView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final gallery = ref.watch(galleryProvider).value ?? [];
    final isEdit = useState(false);
    final user = ref.watch(authProvider).value;

    return ListView(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Center(child: TitlePage(text: "GALLERY")),
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
        ...gallery.mapFixed(
          (item, index) => GalleryItemWidget(
            isActionEnabled: isActionEnabled,
            isEdit: isEdit,
            item: item,
          ),
        ),
        if (isEdit.value) AddGallery(),
        SizedBox(
          height: 25,
        ),
        FooterWidget(),
      ],
    );
  }
}

class AddGallery extends HookConsumerWidget {
  final GalleryModel? galleryModel;
  final void Function(
    Map<String, String> body,
    Map<String, PlatformFile> bodyFile,
  )? onTap;
  const AddGallery({
    this.galleryModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, ref) {
    final judul = useTextEditingController();
    final tanggal = useTextEditingController();
    final linkMore = useTextEditingController();
    final isAdd = useState(false);
    final image1 = useState<PlatformFile?>(null);
    final image2 = useState<PlatformFile?>(null);
    final image3 = useState<PlatformFile?>(null);
    useEffect(() {
      if (galleryModel != null) {
        isAdd.value = true;
        judul.text = galleryModel!.title;
        tanggal.text =
            formatDateNormal(galleryModel!.tanggal, isRecieved: true);
        linkMore.text = galleryModel!.link_more_image;
      }
      return;
    }, []);
    return GestureDetector(
      onTap: isAdd.value
          ? null
          : () {
              isAdd.value = true;
            },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          color: BACKGROUND_CONTENT,
          border: galleryModel == null
              ? Border.all(
                  color: NAVBAR,
                )
              : null,
        ),
        margin: EdgeInsets.all(30).copyWith(bottom: 0, top: 15),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: !isAdd.value
            ? Icon(
                Icons.add,
                color: Colors.white,
              )
            : Column(
                children: [
                  TextFieldCustom(label: "Judul Kegiatan", controller: judul),
                  TextFieldCustom(
                      label: "Tanggal Kegiatan",
                      isDateTime: true,
                      tangalController: tanggal),
                  TextFieldCustom(label: "Link More", controller: linkMore),
                  ImageWidget(
                    label: "Gambar 1",
                    file: (file) {
                      image1.value = file;
                    },
                    isExpanded: false,
                  ),
                  ImageWidget(
                    label: "Gambar 2",
                    file: (file) {
                      image2.value = file;
                    },
                    isExpanded: false,
                  ),
                  ImageWidget(
                    label: "Gambar 3",
                    file: (file) {
                      image3.value = file;
                    },
                    isExpanded: false,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (onTap != null) {
                        onTap?.call(
                            GalleryModel.toEditMapString(
                                title: judul.text,
                                tanggal: tanggal.text,
                                keterangan_gambar: "null",
                                link_more_image: linkMore.text),
                            GalleryModel.toEditImage(
                                image1: image1.value,
                                image2: image2.value,
                                image3: image3.value));
                      } else {
                        if (judul.text.isEmpty) {
                          showToast(context, "Judul Tidak Boleh Kosong");
                          return;
                        }
                        if (tanggal.text.isEmpty) {
                          showToast(context, "Tanggal Tidak Boleh Kosong");
                          return;
                        }
                        if (linkMore.text.isEmpty) {
                          showToast(context, "Linkmore Tidak Boleh Kosong");
                          return;
                        }
                        if (image1.value == null) {
                          showToast(context, "Image1 Tidak Boleh Kosong");
                          return;
                        }
                        if (image2.value == null) {
                          showToast(context, "Image2 Tidak Boleh Kosong");
                          return;
                        }
                        if (image3.value == null) {
                          showToast(context, "Image3 Tidak Boleh Kosong");
                          return;
                        }
                        ref.read(galleryProvider.notifier).insertGallery(
                              bodyString: GalleryModel.toInsertMapString(
                                  title: judul.text,
                                  tanggal: tanggal.text,
                                  keterangan_gambar: "null",
                                  link_more_image: linkMore.text),
                              bodyFile: GalleryModel.toInsertImage(
                                image1: image1.value!,
                                image2: image2.value!,
                                image3: image3.value!,
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: NAVBAR,
                    ),
                    child: Center(
                      child: Text("Simpan"),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
      ),
    );
  }
}

class GalleryItemWidget extends HookConsumerWidget {
  final GalleryModel item;
  final ValueNotifier<bool> isEdit;
  const GalleryItemWidget({
    Key? key,
    required this.item,
    required this.isEdit,
    required this.isActionEnabled,
  }) : super(key: key);

  final bool isActionEnabled;

  @override
  Widget build(BuildContext context, ref) {
    final editActive = useState(false);
    final user = ref.watch(authProvider).value;
    useEffect(() {
      editActive.value = false;
      return;
    }, [isEdit.value]);
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: BACKGROUND_CONTENT,
        border: Border.all(
          color: NAVBAR,
        ),
      ),
      margin: EdgeInsets.all(30).copyWith(bottom: 0, top: 15),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          if (editActive.value)
            AddGallery(
              galleryModel: item,
              onTap: (body, bodyFile) {
                ref.read(galleryProvider.notifier).editGallery(
                    id: "${item.id}", bodyString: body, bodyFile: bodyFile);
                editActive.value = false;
              },
            )
          else
            Column(
              children: [
                SizedBox(
                  height: !isActionEnabled ? 10 : 28,
                ),
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: !isActionEnabled ? 10 : 28,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Image.network(
                          item.url_gambar1.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: Image.network(
                          item.url_gambar2.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: Image.network(
                          item.url_gambar3.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: !isActionEnabled ? 10 : 28,
                ),
                Text(
                  item.tanggal,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: !isActionEnabled ? 10 : 28,
                ),
                SelectableText(
                  "More Pictures:  ${item.link_more_image}",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: !isActionEnabled ? 18 : 28,
                ),
              ],
            ),
          if (isEdit.value)
            if (editActive.value == false) ...[
              Align(
                alignment: Alignment(0.95, -0.95),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        editActive.value = true;
                      },
                      child: Container(
                        width: 65,
                        height: 20,
                        decoration: BoxDecoration(
                          color: NAVBAR,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(child: Text("Edit")),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        ref
                            .read(galleryProvider.notifier)
                            .deleteGallery(id: "${item.id}", auth: user!);
                      },
                      child: Container(
                          width: 65,
                          height: 20,
                          decoration: BoxDecoration(
                            color: NAVBAR,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(child: Text("Hapus"))),
                    ),
                  ],
                ),
              )
            ]
        ],
      ),
    );
  }
}
