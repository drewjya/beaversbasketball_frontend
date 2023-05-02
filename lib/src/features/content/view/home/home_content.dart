// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:beaverbasketball/src/features/content/view/about/about_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:beaverbasketball/src/core/common/constant/asset.dart';
import 'package:beaverbasketball/src/features/content/model/youtube_model.dart';
import 'package:beaverbasketball/src/features/content/providers/content_providers.dart';

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
    useEffect(() {
      if ((ref.watch(youtubeDataProvider).asData?.value ?? []).isNotEmpty) {
        controller.cueVideoById(
            videoId:
                (ref.watch(youtubeDataProvider).asData?.value ?? []).first.id);
      }
      return null;
    }, [ref.watch(youtubeDataProvider)]);

    return ref.watch(youtubeDataProvider).when(data: (data) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "BEAVERS BASKETBALL CLUB",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Demonized',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "STAY TOGETHER AND BE BRAVE",
                  style: TextStyle(
                    fontFamily: 'Demonized',
                  ),
                ),
                YoutubePlayer(
                  controller: controller,
                  aspectRatio: 5.5 / 2,
                ),
              ],
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                final youtube = data[index];

                return Center(
                  child: YoutubeCard(
                    youtube: youtube,
                    onTap: (p0) {
                      controller.loadVideoById(videoId: p0);
                    },
                  ),
                );
              },
              itemCount: (data).length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
