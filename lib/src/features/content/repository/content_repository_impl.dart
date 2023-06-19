import 'package:beaverbasketball/src/core/api/url.dart';
import 'package:beaverbasketball/src/features/content/model/coach_model.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:dartz/dartz.dart';

const _apiKey1 = "AIzaSyBYnhuaSpaPXeakbujqOqNIAuKsSNB49Vo";
const _apiKey2 = "AIzaSyAUo0xmh0jiQffKxa8mK6fhxJBXX3uenJw";

//AIzaSyAUo0xmh0jiQffKxa8mK6fhxJBXX3uenJw
class ContentRepositoryImpl extends ContentRepository {
  @override
  Future<List<YoutubeModel>> loadYoutubePost() async {
    final url =
        "https://www.googleapis.com/youtube/v3/search?channelId=UCqQ32OBHgYtWcxCXjT-vRxQ&maxResults=3&key=$_apiKey2&order=date&part=snippet";

    final data = await HttpWrapper.getYoutube(
      url: url,
      fromJson: (p0) =>
          (p0["items"] as List).map((e) => YoutubeModel.fromMap(e)).toList(),
    );

    return data;
  }

  @override
  Future<Either<String, List<CoachModel>>> getListCoach() async {
    try {
      final res = await HttpWrapper.getList(
        url: ApiUrl.getCoach,
        fromJson: (map) => map
            .cast<Map<String, dynamic>>()
            .mapFixed((element, index) => CoachModel.fromMap(element)),
      );
      return Right(res.toList());
    } catch (e) {
      return Left("$e");
    }
  }
}

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepositoryImpl();
});
