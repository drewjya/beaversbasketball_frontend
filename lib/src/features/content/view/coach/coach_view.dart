import 'dart:developer';

import 'package:beaverbasketball/src/core/api/url.dart';
import 'package:beaverbasketball/src/features/content/model/coach_model.dart';
import 'package:beaverbasketball/src/features/content/providers/coach_providers.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CoachView extends HookConsumerWidget {
  const CoachView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(authProvider).value;
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final isEdit = useState(false);
    final coachData = ref.watch(coachProvider);

    return RefreshIndicator(
      onRefresh: () => ref.read(coachProvider.notifier).loadCoach(),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Center(child: TitlePage(text: "COACH")),
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
            padding: const EdgeInsets.all(30),
            child: coachData.maybeWhen(
              orElse: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              onInit: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              onLoading: (value) {
                print(value?.length ?? 0 + (isEdit.value ? 1 : 0));
                return Container(
                  child: Stack(
                    children: [
                      if ((value?.length ?? 0 + (isEdit.value ? 1 : 0)) !=
                          0) ...[
                        GridView.builder(
                          itemCount:
                              value?.length ?? 0 + (isEdit.value ? 1 : 0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: isActionEnabled ? 60 : 5,
                            mainAxisSpacing: isActionEnabled ? 60 : 5,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (context, index) {
                            if (isEdit.value && index == value?.length) {
                              return AddWidget(
                                  isActionEnabled: isActionEnabled, user: user);
                            }
                            if (value == null) {
                              return SizedBox();
                            }
                            return EditableWidget(
                                coach: value[index],
                                isActionEnabled: isActionEnabled,
                                isEdit: isEdit,
                                user: user);
                          },
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        ),
                      ] else ...[
                        if (isEdit.value)
                          GridView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: isActionEnabled ? 60 : 5,
                              mainAxisSpacing: isActionEnabled ? 60 : 5,
                              childAspectRatio: 0.8,
                            ),
                            children: [
                              AspectRatio(
                                aspectRatio: 0.8,
                                child: AddWidget(
                                    isActionEnabled: isActionEnabled,
                                    user: user),
                              )
                            ],
                          )
                        else
                          SizedBox()
                      ],
                      if (coachData.isLoading)
                        Container(
                          color: Colors.black38,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    ],
                  ),
                );
              },
              onSuccess: (value) {
                log("${value.length + (isEdit.value ? 1 : 0)}");
                if ((value.length + (isEdit.value ? 1 : 0)) != 0) {
                  return GridView.builder(
                    itemCount: value.length + (isEdit.value ? 1 : 0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: isActionEnabled ? 60 : 5,
                      mainAxisSpacing: isActionEnabled ? 60 : 5,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      if (isEdit.value && index == value.length) {
                        return AddWidget(
                            isActionEnabled: isActionEnabled, user: user);
                      }
                      return EditableWidget(
                          coach: value[index],
                          isActionEnabled: isActionEnabled,
                          isEdit: isEdit,
                          user: user);
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  );
                }
                if (isEdit.value) {
                  return GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: isActionEnabled ? 60 : 5,
                      mainAxisSpacing: isActionEnabled ? 60 : 5,
                      childAspectRatio: 0.8,
                    ),
                    children: [
                      AspectRatio(
                        aspectRatio: 0.8,
                        child: AddWidget(
                            isActionEnabled: isActionEnabled, user: user),
                      )
                    ],
                  );
                }
                return SizedBox();
              },
            ),
          ),
          FooterWidget()
        ],
      ),
    );
  }
}

class EditableWidget extends HookConsumerWidget {
  const EditableWidget({
    required this.coach,
    super.key,
    required this.isActionEnabled,
    required this.isEdit,
    required this.user,
  });

  final CoachModel coach;
  final bool isActionEnabled;
  final ValueNotifier<bool> isEdit;
  final String? user;

  @override
  Widget build(BuildContext context, ref) {
    final editActive = useState(false);
    final controller = useTextEditingController();
    useEffect(() {
      controller.text = coach.nama;
      editActive.value = false;
      log("RESTART ${coach.nama}");
      return;
    }, [isEdit.value]);
    if (editActive.value) {
      return AddWidget(
        isActionEnabled: isActionEnabled,
        user: user,
        data: "${coach.id}",
        initController: controller,
        // data: NetworkImage("${ApiUrl.storage}/${coach.url_gambar.replaceAll("public/", "")}",
      );
    }
    return Column(
      children: [
        Expanded(
            child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(isActionEnabled ? 20 : 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "${ApiUrl.storage}/${coach.url_gambar.replaceAll("public/", "")}",
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  width: isActionEnabled ? 4 : 2,
                  color: NAVBAR,
                ),
              ),
            ),
            if (isEdit.value)
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
                            .read(coachProvider.notifier)
                            .deleteCoach(id: "${coach.id}", auth: user!);
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
          ],
        )),
        Container(
          height: isActionEnabled ? 125 : 85,
          child: Text(
            "Coach " + coach.nama,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: isActionEnabled ? 25 : 10,
            ),
          ),
        ),
      ],
    );
  }
}

class AddWidget extends HookConsumerWidget {
  final TextEditingController? initController;
  final String? data;
  const AddWidget({
    super.key,
    this.initController,
    this.data,
    required this.isActionEnabled,
    required this.user,
  });

  final bool isActionEnabled;
  final String? user;

  @override
  Widget build(BuildContext context, ref) {
    final image = useState<Uint8List?>(null);
    final imageData = useState<PlatformFile?>(null);
    final controller = useTextEditingController();
    return ImagePickerWidget(
      onTap: (file) {
        image.value = file?.bytes;
        imageData.value = file;
      },
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(isActionEnabled ? 20 : 5),
                  decoration: BoxDecoration(
                    image: image.value != null
                        ? DecorationImage(
                            image: MemoryImage(image.value!),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: image.value != null ? null : BACKGROUND_CONTENT,
                    border: Border.all(
                      width: isActionEnabled ? 4 : 2,
                      color: NAVBAR,
                    ),
                  ),
                  child: image.value == null
                      ? Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      : null,
                ),
                Align(
                  alignment: Alignment(0.95, -0.95),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (initController != null) {
                            if (imageData.value == null) {
                              showToast(context, "Gambar Tidak Boleh Kosong");
                              return;
                            }
                            if (initController!.text.isEmpty) {
                              showToast(context, "Nama Tidak Boleh Kosong");
                              return;
                            }
                            ref.read(coachProvider.notifier).editCoach(
                                nama: initController!.text,
                                id: data!,
                                file: imageData.value!);
                            return;
                          }
                          if (imageData.value == null) {
                            showToast(context, "Gambar Tidak Boleh Kosong");
                            return;
                          }
                          if (controller.text.isEmpty) {
                            showToast(context, "Nama Tidak Boleh Kosong");
                            return;
                          }
                          ref.read(coachProvider.notifier).insertCoach(
                              nama: controller.text, file: imageData.value!);
                        },
                        child: Container(
                          width: 65,
                          height: 20,
                          decoration: BoxDecoration(
                            color: NAVBAR,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(child: Text("Save")),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: isActionEnabled ? 125 : 85,
            child: TextFieldCustom(
                label: "Nama", controller: initController ?? controller),
          ),
        ],
      ),
    );
  }
}
