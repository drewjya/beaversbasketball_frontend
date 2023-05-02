import 'package:beaverbasketball/src/features/content/model/youtube_model.dart';

abstract class ContentRepository {
  Future<List<YoutubeModel>> loadYoutubePost();
}
