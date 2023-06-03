// ignore_for_file: public_member_api_docs, sort_constructors_first

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
    return ref.watch(youtubeDataProvider).when(data: (data) {
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
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Colors.amber),
                                child: Center(
                                  child: Text(
                                    'text $i',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ));
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
            SizedBox(
              height: !isActionEnabled ? 16 : 48,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "WELCOME",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: !isActionEnabled ? 24 : 48,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: BACKGROUND_CONTENT,
                      border: Border.all(color: PRIMARY),
                    ),
                    child: Text(
                      "Selamat datang di official website dari Beavers Basketball Club. Website ini dibuat supaya teman-teman semua bisa mengenal lebih dekat dengan Beavers Basketball Club. Jika teman-teman memiliki pertanyaan lebih lanjut silahkan hubungi admin Wa sesuai dengan lokasi latihan kalian. See You On Court BRAVER !",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: !isActionEnabled ? 24 : 48,
                  ),
                  Text(
                    "YOUTUBE",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: !isActionEnabled ? 16 : 48,
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
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
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
            SizedBox(
              height: !isActionEnabled ? 24 : 48,
            ),
            Text(
              "SUPPORTED BY",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: !isActionEnabled ? 24 : 48,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PRIMARY,
                    ),
                    color: BACKGROUND_CONTENT,
                  ),
                  child: Center(
                    child: Text("$index"),
                  ),
                );
              },
              itemCount: 6,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
            SizedBox(
              height: !isActionEnabled ? 24 : 48,
            ),
            FooterWidget()
          ],
        ),
      );
    }, error: (error, _) {
      return Center(child: Text("data"));
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
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
