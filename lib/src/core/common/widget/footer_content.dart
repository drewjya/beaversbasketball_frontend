// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:beaverbasketball/src/src.dart';
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
              Text("Raffles College - Kebon Jeruk"),
              Text("Jalan Arjuna Utara no. 35 Jakarta Barat."),
              Text("Sekolah Victory Plus Bekasi,"),
              Text("Perumahan Kemang Pratama,"),
              Text("Jalan Citra Niaga Raya Bloc AO1-14,"),
              Text("Bojong Rawalumbu Kota Bekasi."),
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
                  if (await canLaunchUrlString("https://wa.me/6281296834488")) {
                    launchUrlString("https://wa.me/6281296834488");
                  }
                },
                child: Row(
                  children: [
                    Image.asset(AssetConstant.iconWa, width: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("081296834488"),
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
                height: 20,
              ),
              _TitleFooter(
                text: "SUPPORTED By",
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 40,
                  runSpacing: 40,
                  children: List.generate(
                      10,
                      (index) => CircleAvatar(
                            radius: 80,
                          )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _TitleFooter(
                text: "PARTNERSHIP WITH",
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 35,
                color: Colors.white,
                child: Image.asset(AssetConstant.iconBPJS),
              ),
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
                        Text("Raffles College - Kebon Jeruk"),
                        Text("Jalan Arjuna Utara no. 35 Jakarta Barat."),
                        Text("Sekolah Victory Plus Bekasi,"),
                        Text("Perumahan Kemang Pratama,"),
                        Text("Jalan Citra Niaga Raya Bloc AO1-14,"),
                        Text("Bojong Rawalumbu Kota Bekasi."),
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
                                "https://wa.me/6281296834488")) {
                              launchUrlString("https://wa.me/6281296834488");
                            }
                          },
                          child: Row(
                            children: [
                              Image.asset(AssetConstant.iconWa, width: 24),
                              SizedBox(
                                width: 5,
                              ),
                              Text("081296834488"),
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              _TitleFooter(
                text: "SUPPORTED By",
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 40,
                  runSpacing: 40,
                  children: List.generate(
                      10,
                      (index) => CircleAvatar(
                            radius: 80,
                          )),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              _TitleFooter(
                text: "PARTNERSHIP WITH",
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                height: 35,
                color: Colors.white,
                child: Image.asset(AssetConstant.iconBPJS),
              ),
              SizedBox(
                height: 20,
              ),

              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 5,
              //       crossAxisSpacing: 40,
              //       mainAxisSpacing: 40),
              //   itemBuilder: (context, index) {
              //     return CircleAvatar();
              //   },
              // ),
              SizedBox(
                height: 20,
              ),
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

// (isActionEnabled)
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: buildFooterChild(isActionEnabled)),
//                   if (isActionEnabled)
//                     Container(
//                       width: double.infinity,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Text("Alamat"),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text("Raffles College - Kebon Jeruk"),
//                           Text("Jalan Arjuna Utara no. 35 Jakarta Barat."),
//                           Text("Sekolah Victory Plus Bekasi,"),
//                           SizedBox(
//                             height: 12,
//                           ),
//                           Text("Perumahan Kemang Pratama,"),
//                           Text("Jalan Citra Niaga Raya Bloc AO1-14,"),
//                           Text("Bojong Rawalumbu Kota Bekasi."),
//                         ],
//                       ),
//                     ),
//                 ],
//               )
//             : Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: buildFooterChild(isActionEnabled),
//               ),
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
                    GestureDetector(
                      onTap: () async {},
                      child: Row(
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

class _TitleFooter extends StatelessWidget {
  final String text;
  const _TitleFooter({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Text(
        text,
        style: TextStyle(
          fontSize: !isActionEnabled ? 15 : 20,
        ),
      ),
    );
  }
}
