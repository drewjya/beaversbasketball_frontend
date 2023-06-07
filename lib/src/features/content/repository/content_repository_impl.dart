import 'package:beaverbasketball/src/src.dart';

const _apiKey1 = "AIzaSyBYnhuaSpaPXeakbujqOqNIAuKsSNB49Vo";
const _apiKey2 = "AIzaSyAUo0xmh0jiQffKxa8mK6fhxJBXX3uenJw";

//AIzaSyAUo0xmh0jiQffKxa8mK6fhxJBXX3uenJw
class ContentRepositoryImpl extends ContentRepository {
  @override
  Future<List<YoutubeModel>> loadYoutubePost() async {
    final url =
        "https://www.googleapis.com/youtube/v3/search?channelId=UCqQ32OBHgYtWcxCXjT-vRxQ&maxResults=3&key=$_apiKey2&order=date&part=snippet";

    final data = await HttpWrapper.get(
      url: url,
      fromJson: (p0) =>
          (p0["items"] as List).map((e) => YoutubeModel.fromMap(e)).toList(),
    );

    return data ?? [];
  }
}

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepositoryImpl();
});
