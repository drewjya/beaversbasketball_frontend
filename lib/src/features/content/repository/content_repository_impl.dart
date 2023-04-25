import 'package:beaverbasketball/src/core/http/http_wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'content_repository.dart';

class ContentRepositoryImpl extends ContentRepository {
  @override
  Future<List<String>?> loadYoutubePost() async {
    final url =
        "https://www.googleapis.com/youtube/v3/search?channelId=UCqQ32OBHgYtWcxCXjT-vRxQ&maxResults=6&key=AIzaSyAUo0xmh0jiQffKxa8mK6fhxJBXX3uenJw&order=date&part=snippet";
    final data = await HttpWrapper.get(
      url: url,
      fromJson: (p0) => (p0["items"] as List)
          .map((e) => (e["id"]["videoId"] ?? "") as String)
          .toList(),
    );
    return data;
  }
}

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepositoryImpl();
});
