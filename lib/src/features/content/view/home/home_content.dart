// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:beaverbasketball/src/src.dart';
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

      return () => focusNode.dispose();
    }, [ref.watch(youtubeDataProvider)]);
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return ref.watch(youtubeDataProvider).when(data: (data) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: !isActionEnabled ? 200 : 400,
                width: double.infinity,
                color: Colors.green,
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
                    "BEAVERS BASKETBALL CLUB",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Demonized',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "STAY TOGETHER AND BE BRAVE",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Demonized',
                    ),
                  ),
                  SizedBox(
                    height: !isActionEnabled ? 16 : 48,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    color: Colors.green,
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eleifend turpis vitae augue finibus accumsan. Nam placerat vulputate eros sit amet ullamcorper. Nunc tempus nisl lacinia, semper justo eget, consectetur mi. Cras pulvinar est id iaculis viverra. Pellentesque vitae iaculis turpis, non imperdiet lorem. Duis eget ex et diam convallis suscipit. Duis scelerisque nunc non mi facilisis, non fringilla tellus pulvinar. Etiam viverra malesuada laoreet. Nullam risus mi, aliquam ac ante at, tristique pellentesque mauris. Donec eu ipsum nibh. Integer tincidunt est ut turpis dignissim, eget elementum orci euismod. Aenean tellus sapien, scelerisque non turpis vitae, lacinia bibendum justo. Nunc vehicula quam ac lacus interdum, et egestas nisl sollicitudin."),
                  ),
                  SizedBox(
                    height: !isActionEnabled ? 16 : 48,
                  ),
                  Text(
                    "Youtube",
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                        SizedBox(
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
              height: !isActionEnabled ? 16 : 48,
            ),
            Center(child: Text("Supported By")),
            Container(
              height: ref.watch(sizeProvider).height,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(5).copyWith(left: 0),
                    color: Colors.red,
                  )),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.green,
                  )),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(5).copyWith(right: 0),
                    color: Colors.blue,
                  )),
                ],
              ),
            ),
            SizedBox(
              height: !isActionEnabled ? 16 : 48,
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
