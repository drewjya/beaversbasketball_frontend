import 'package:beaverbasketball/src/features/content/model/coach_model.dart';
import 'package:beaverbasketball/src/features/content/model/youtube_model.dart';
import 'package:dartz/dartz.dart';

abstract class ContentRepository {
  Future<List<YoutubeModel>> loadYoutubePost();
  Future<Either<String,List<CoachModel>>> getListCoach();
}
