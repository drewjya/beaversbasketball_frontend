// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beaverbasketball/src/core/api/url.dart';
import 'package:beaverbasketball/src/features/content/providers/sponsor_providers.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;

    final sponsor = [
      AssetConstant.sponsor1,
      AssetConstant.sponsor2,
      AssetConstant.sponsor3,
      AssetConstant.iconBPJS
    ];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: BACKGROUND_CONTENT,
        border: Border(
          top: BorderSide(
            color: NAVBAR,
            width: 10,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: DefaultTextStyle(
        style: GoogleFonts.inter(
            color: Colors.white, fontSize: isActionEnabled ? 15 : 13),
        child: Visibility(
          visible: isActionEnabled,
          replacement: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleFooter(text: "ADDRESS"),
              "Raffles College - Kebon Jeruk".toWidget(),
              "Jalan Arjuna Utara no. 35 Jakarta Barat.".toWidget(),
              SizedBox(
                height: 10,
              ),
              "Bintang Sport Center Bekasi ".toWidget(),
              "Jl. Raya Mustikasari No.109, RT.004/RW.001, Mustikasari, Kec. Mustika Jaya, Kota Bks, Jawa Barat 17116"
                  .toWidget(),
              SizedBox(
                height: 20,
              ),
              _TitleFooter(
                text: "TEAM & SCHEDULE",
              ),
              _FooterItem(text: "Coach"),
              _FooterItem(text: "Achievement"),
              _FooterItem(text: "Schedule"),
              _FooterItem(text: "About"),
              SizedBox(
                height: 20,
              ),
              _TitleFooter(
                text: "SUPPORT & GALLERY",
              ),
              _FooterItem(text: "Gallery"),
              _FooterItem(text: "News"),
              SizedBox(
                height: 20,
              ),
              _TitleFooter(
                text: "CONTACT US",
              ),
              GestureDetector(
                onTap: () async {
                  if (await canLaunchUrlString(
                      "https://www.youtube.com/channel/UCqQ32OBHgYtWcxCXjT-vRxQ/discussion")) {
                    launchUrlString(
                        "https://www.youtube.com/channel/UCqQ32OBHgYtWcxCXjT-vRxQ/discussion");
                  }
                },
                child: Row(
                  children: [
                    Image.asset(AssetConstant.iconYoutube, width: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Beavers Brave Official")
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () async {
                  if (await canLaunchUrlString(
                      "https://www.instagram.com/beaversbasketball")) {
                    launchUrlString(
                        "https://www.instagram.com/beaversbasketball");
                  }
                },
                child: Row(
                  children: [
                    Image.asset(AssetConstant.iconIg, width: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("beaversbasketball"),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () async {
                  if (await canLaunchUrlString(
                      "https://www.tokopedia.com/beaversofficialstore")) {
                    launchUrlString(
                        "https://www.tokopedia.com/beaversofficialstore");
                  }
                },
                child: Row(
                  children: [
                    Image.asset(AssetConstant.iconTokopedia, width: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("beaversofficialstore"),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () async {
                  final url = Uri.encodeFull(
                      'mailto:beaverbasketballid@gmail.com?subject=Subject&body=Body');
                  if (await canLaunchUrlString(url)) {
                    launchUrlString(url);
                  }
                },
                child: Row(
                  children: [
                    Image.asset(
                      AssetConstant.iconEmail,
                      width: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("beaverbasketballid@gmail.com"),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () async {
                  if (await canLaunchUrlString("https://wa.me/6281296834488")) {
                    launchUrlString("https://wa.me/6281296834488");
                  }
                },
                child: Row(
                  children: [
                    Image.asset(AssetConstant.iconWa, width: 22),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Admin Jakarta - 081296834488"),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () async {
                  if (await canLaunchUrlString("https://wa.me/6281211997790")) {
                    launchUrlString("https://wa.me/6281211997790");
                  }
                },
                child: Row(
                  children: [
                    Image.asset(AssetConstant.iconWa, width: 22),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Admin Bekasi -  081211997790"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SupportedByWidget(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "©2023 BEAVERSBASKETBALL",
                  style: GoogleFonts.inter(
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TitleFooter(text: "ADDRESS"),
                        "Raffles College - Kebon Jeruk".toWidget(),
                        "Jalan Arjuna Utara no. 35 Jakarta Barat.".toWidget(),
                        SizedBox(
                          height: 10,
                        ),
                        "Bintang Sport Center Bekasi ".toWidget(),
                        "Jl. Raya Mustikasari No.109, RT.004/RW.001, Mustikasari, Kec. Mustika Jaya, Kota Bks, Jawa Barat 17116"
                            .toWidget(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TitleFooter(
                          text: "TEAM & SCHEDULE",
                        ),
                        Row(
                          children: [
                            _FooterItem(text: "Coach"),
                            _FooterItem(text: "Achievement"),
                          ],
                        ),
                        Row(
                          children: [
                            _FooterItem(text: "Schedule"),
                            _FooterItem(text: "About"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TitleFooter(
                          text: "SUPPORT & GALLERY",
                        ),
                        Row(
                          children: [
                            _FooterItem(text: "Gallery"),
                            _FooterItem(text: "News"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TitleFooter(
                          text: "CONTACT US",
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                "https://www.youtube.com/channel/UCqQ32OBHgYtWcxCXjT-vRxQ/discussion")) {
                              launchUrlString(
                                  "https://www.youtube.com/channel/UCqQ32OBHgYtWcxCXjT-vRxQ/discussion");
                            }
                          },
                          child: Row(
                            children: [
                              Image.asset(AssetConstant.iconYoutube, width: 24),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Beavers Brave Official")
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                "https://www.instagram.com/beaversbasketball")) {
                              launchUrlString(
                                  "https://www.instagram.com/beaversbasketball");
                            }
                          },
                          child: Row(
                            children: [
                              Image.asset(AssetConstant.iconIg, width: 24),
                              SizedBox(
                                width: 5,
                              ),
                              Text("beaversbasketball"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                "https://www.tokopedia.com/beaversofficialstore")) {
                              launchUrlString(
                                  "https://www.tokopedia.com/beaversofficialstore");
                            }
                          },
                          child: Row(
                            children: [
                              Image.asset(AssetConstant.iconTokopedia,
                                  width: 24),
                              SizedBox(
                                width: 5,
                              ),
                              Text("beaversofficialstore"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final url = Uri.encodeFull(
                                'mailto:beaverbasketballid@gmail.com?subject=Subject&body=Body');
                            if (await canLaunchUrlString(url)) {
                              launchUrlString(url);
                            }
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                AssetConstant.iconEmail,
                                width: 24,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("beaverbasketballid@gmail.com"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                "https://wa.me/6281296834488")) {
                              launchUrlString("https://wa.me/6281296834488");
                            }
                          },
                          child: Row(
                            children: [
                              Image.asset(AssetConstant.iconWa, width: 22),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Admin Jakarta - 081296834488"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                "https://wa.me/6281211997790")) {
                              launchUrlString("https://wa.me/6281211997790");
                            }
                          },
                          child: Row(
                            children: [
                              Image.asset(AssetConstant.iconWa, width: 22),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Admin Bekasi -  081211997790"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SupportedByWidget(isActionEnabled: isActionEnabled),
              Text(
                "©2023 BEAVERSBASKETBALL",
                style: GoogleFonts.inter(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SupportedByWidget extends HookConsumerWidget {
  final bool isActionEnabled;
  const SupportedByWidget({
    super.key,
    this.isActionEnabled = false,
  });

  @override
  Widget build(BuildContext context, ref) {
    final sponsor = (ref.watch(sponsorProvider).value ?? []);
    final isEdit = useState(false);
    if (isActionEnabled) {
      return Column(
        children: [
          _TitleFooter(
            text: "SUPPORTED BY",
            onTap: () {
              isEdit.value = !isEdit.value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: sponsor.length < 5
                ? Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    alignment: WrapAlignment.center,
                    children: [
                      ...sponsor.mapFixed(
                        (e, index) => SupportedItem(
                          image: e.url_gambar,
                          id: "${e.id}",
                          isEdit: isEdit,
                          isLimited: true,
                        ),
                      ),
                      if (isEdit.value)
                        SupportedItem(
                          image: null,
                          isEdit: isEdit,
                        )
                    ],
                  )
                : GridView.count(
                    crossAxisCount: 5,
                    childAspectRatio: 1,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      ...sponsor.map((e) => SupportedItem(
                            image: e.url_gambar,
                            isEdit: isEdit,
                            id: "${e.id}",
                          )),
                      if (isEdit.value)
                        SupportedItem(
                          image: null,
                          isEdit: isEdit,
                        )
                    ],
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }
    return Column(
      children: [
        _TitleFooter(
          text: "SUPPORTED BY",
          onTap: () {
            isEdit.value = !isEdit.value;
          },
        ),
        SizedBox(
          height: 20,
        ),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            ...sponsor.mapFixed((item, index) {
              return SupportedItem(
                image: sponsor[index].url_gambar,
                id: "${sponsor[index].id}",
                isEdit: isEdit,
              );
            }),
            if (isEdit.value)
              SupportedItem(
                image: null,
                isEdit: isEdit,
              )
          ],
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}

class SupportedItem extends HookConsumerWidget {
  final String? image;
  final bool isLimited;
  final String? id;
  final ValueNotifier<bool> isEdit;
  const SupportedItem({
    required this.image,
    this.isLimited = false,
    this.id,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context, ref) {
    final bytes = useState<Uint8List?>(null);
    final platformFile = useState<PlatformFile?>(null);
    final editActive = useState(false);
    final user = ref.watch(authProvider);
    useEffect(() {
      editActive.value = false;
      bytes.value = null;
      platformFile.value = null;
      return;
    }, [isEdit.value]);
    if (image == null) {
      return Stack(
        children: [
          ImagePickerWidget(
            onTap: (file) {
              bytes.value = file?.bytes;
              platformFile.value = file;
            },
            child: Container(
              width: isLimited ? 150 : null,
              height: isLimited ? 150 : null,
              decoration: BoxDecoration(
                border: Border.all(
                  color: PRIMARY,
                ),
                color: BACKGROUND_CONTENT,
                image: bytes.value == null
                    ? null
                    : DecorationImage(
                        image: (MemoryImage(bytes.value!) as ImageProvider),
                      ),
              ),
              child: bytes.value == null
                  ? Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  : null,
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
                      if (platformFile.value == null) {
                        showToast(context, "Gambar Sponsor Tidak Boleh Kosong");
                        return;
                      }
                      ref
                          .read(sponsorProvider.notifier)
                          .insertSponsor(file: platformFile.value!);
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
                ],
              ),
            )
        ],
      );
    }
    if (!editActive.value) {
      return Stack(
        children: [
          Container(
            width: isLimited ? 150 : null,
            height: isLimited ? 150 : null,
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY,
              ),
              color: Colors.white,
              image: DecorationImage(
                image: (bytes.value == null
                    ? NetworkImage("${ApiUrl.storage}/$image")
                    : MemoryImage(bytes.value!) as ImageProvider),
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
                          .read(sponsorProvider.notifier)
                          .deleteSponsor(id: id ?? "", auth: user.value ?? "");
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
      );
    }
    return Stack(
      children: [
        ImagePickerWidget(
          onTap: (file) {
            bytes.value = file?.bytes;
            platformFile.value = file;
          },
          child: Container(
            width: isLimited ? 150 : null,
            height: isLimited ? 150 : null,
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY,
              ),
              color: Colors.white,
              image: DecorationImage(
                image: (bytes.value == null
                    ? NetworkImage("${ApiUrl.storage}/$image")
                    : MemoryImage(bytes.value!) as ImageProvider),
              ),
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
                    if (platformFile.value == null) {
                      showToast(context, "Gambar Tidak Boleh Kosong");
                    }
                    ref.read(sponsorProvider.notifier).editSponsor(
                        id: id ?? "", nama: "nama", file: platformFile.value!);
                    editActive.value = false;
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
              ],
            ),
          )
      ],
    );
  }
}

class _FooterItem extends StatelessWidget {
  final String text;
  const _FooterItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return GestureDetector(
      onTap: () => context.replaceNamed(text.toLowerCase()),
      child: Container(
        width: 100,
        child: Text(
          text,
          style: TextStyle(
            fontSize: isActionEnabled ? null : 13,
          ),
        ),
      ),
    );
  }
}

class _TitleFooter extends ConsumerWidget {
  final VoidCallback? onTap;

  final String text;
  const _TitleFooter({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(authProvider).value;
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return Container(
      padding: EdgeInsets.only(
        bottom: 8,
      ),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: isActionEnabled ? 2 : 0.2,
            color: Colors.white,
          ),
        ),
      ),
      child: onTap != null && user != null
          ? Row(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: !isActionEnabled ? 15 : 20,
                  ),
                ),
                if (onTap != null && user != null)
                  IconButton(
                      onPressed: onTap,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ))
              ],
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: !isActionEnabled ? 15 : 20,
              ),
            ),
    );
  }
}
