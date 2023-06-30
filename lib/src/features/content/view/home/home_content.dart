// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:beaverbasketball/src/features/content/providers/news_provider.dart';
import 'package:beaverbasketball/src/features/content/providers/sponsor_providers.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomeContent extends HookConsumerWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    YoutubePlayerController controller =
        useMemoized(() => YoutubePlayerController(
              params: YoutubePlayerParams(
                mute: false,
                showControls: true,
                showFullscreenButton: true,
              ),
            ));
    final carouselController = useMemoized(
      () => CarouselController(),
    );
    final focusNode = useFocusNode();
    final isFocused = useState(false);

    useEffect(() {
      if ((ref.watch(youtubeDataProvider).asData?.value ?? []).isNotEmpty) {
        controller.cueVideoById(
            videoId:
                (ref.watch(youtubeDataProvider).asData?.value ?? []).first.id);
      }
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          isFocused.value = false;
        }
      });

      return;
    }, [ref.watch(youtubeDataProvider), focusNode]);
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final titleStyle = TextStyle(
      fontSize: isActionEnabled ? 20 : 12,
      fontWeight: FontWeight.w700,
    );
    final bodyStyle = TextStyle(
      fontSize: isActionEnabled ? 18 : 10,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: !isActionEnabled ? 200 : 400,
              width: double.infinity,
              child: Stack(
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(height: 400.0),
                    items: [
                      AssetConstant.carousel1,
                      AssetConstant.carousel2,
                      AssetConstant.carousel3,
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(i),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          carouselController.previousPage();
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          carouselController.nextPage();
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                TitlePage(text: "WELCOME"),
                Container(
                  width: MediaQuery.of(context).size.width *
                      (isActionEnabled ? 0.7 : 1),
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: BACKGROUND_CONTENT,
                    border: Border.all(color: PRIMARY),
                  ),
                  child: Text(
                    "Selamat datang di official website dari Beavers Basketball Club.\nWebsite ini dibuat supaya teman-teman semua bisa mengenal lebih dekat dengan Beavers Basketball Club. Jika teman-teman memiliki pertanyaan lebih lanjut silahkan hubungi admin Wa sesuai dengan lokasi latihan kalian.\nSee You On Court BRAVER!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                TitlePage(
                  text: "YOUTUBE",
                ),
                InkWell(
                  onTap: () {
                    if (!isFocused.value) {
                      isFocused.value = true;
                    }
                  },
                  onHover: (value) {
                    if (!value) {
                      isFocused.value = false;
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: PRIMARY,
                        )),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: YoutubePlayer(
                          enableFullScreenOnVerticalDrag: false,
                          controller: controller,
                          aspectRatio: 4 / 2,
                        ),
                      ),
                      if (!isFocused.value) ...[
                        PointerInterceptor(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            color: Colors.transparent,
                            child: AspectRatio(
                              aspectRatio: 4 / 2,
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: !isActionEnabled ? 16 : 48,
          ),
          ref.watch(youtubeDataProvider).when(data: (data) {
            return SizedBox(
              width: MediaQuery.of(context).size.width *
                  (!isActionEnabled ? 1 : 0.75),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: !isActionEnabled ? 10 : 40,
                  crossAxisSpacing: !isActionEnabled ? 10 : 40,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  final youtube = data[index];

                  return Center(
                    child: MeasureSize(
                      onChange: (size) =>
                          ref.read(sizeProvider.notifier).setSize(size),
                      child: YoutubeCard(
                        youtube: youtube,
                        onTap: (p0) {
                          isFocused.value = false;
                          controller.loadVideoById(videoId: p0);
                        },
                      ),
                    ),
                  );
                },
                itemCount: (data).length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            );
          }, error: (error, _) {
            return Center(child: Text("data"));
          }, loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
          SizedBox(
            height: !isActionEnabled ? 16 : 48,
          ),
          TitlePage(text: "HEADLINE NEWS"),
          Container(
            height: MediaQuery.of(context).size.height * (0.5),
            margin: EdgeInsets.symmetric(horizontal: 40),
            width: MediaQuery.of(context).size.height * (0.7),
            child: Consumer(builder: (context, ref, child) {
              final news = ref.watch(newsProvider).value ?? [];
              if (news.isEmpty) {
                return SizedBox();
              }
              final headline = news.first;
              return Column(children: [
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
                          headline.tanggal,
                          style: bodyStyle,
                        ),
                      ],
                    )),
              ]);
            }),
          ),
          SizedBox(
            height: !isActionEnabled ? 16 : 48,
          ),
          TitlePage(text: "SUPPORTED BY"),
          SizedBox(
            width: MediaQuery.of(context).size.width *
                (!isActionEnabled ? 1 : 0.75),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                mainAxisSpacing: !isActionEnabled ? 10 : 40,
                crossAxisSpacing: !isActionEnabled ? 10 : 40,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                ...(ref.watch(sponsorProvider).value ?? [])
                    .mapFixed((element, index) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PRIMARY,
                            ),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(element.url_gambar.url),
                            ),
                          ),
                        )),
              ],
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
          SizedBox(
            height: !isActionEnabled ? 24 : 48,
          ),
          FooterWidget()
        ],
      ),
    );
  }
}

class TitlePage extends StatelessWidget {
  final String text;
  final double? fontSize;
  const TitlePage({
    Key? key,
    required this.text,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return Column(
      children: [
        SizedBox(
          height: !isActionEnabled ? 24 : 48,
        ),
        Text(
          "$text",
          style: TextStyle(
            fontSize: fontSize ?? 35,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: !isActionEnabled ? 24 : 48,
        ),
      ],
    );
  }
}

class YoutubeCard extends HookWidget {
  final Function(String) onTap;
  const YoutubeCard({
    required this.onTap,
    required this.youtube,
  });

  final YoutubeModel youtube;

  @override
  Widget build(BuildContext context) {
    final height = useState(0.0);
    return InkWell(
      onHover: (value) {
        if (value) {
          height.value = 20;
          height.value = 40;
        } else {
          height.value = 20;
          height.value = 0;
        }
      },
      onTap: () {
        onTap(youtube.id);
      },
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: PRIMARY,
              )),
              child: Image.network(
                  "https://img.youtube.com/vi/${youtube.id}/0.jpg"),
            ),
          ),
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.bounceInOut,
              height: height.value,
              child: height.value != 0
                  ? Image.asset(AssetConstant.iconYoutube)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
