import 'package:beaverbasketball/src/features/content/model/achievement_model.dart';
import 'package:beaverbasketball/src/features/content/model/coach_model.dart';
import 'package:beaverbasketball/src/features/content/model/gallery_model.dart';
import 'package:beaverbasketball/src/features/content/model/news_model.dart';
import 'package:beaverbasketball/src/features/content/model/schedule_model.dart';
import 'package:beaverbasketball/src/features/content/model/sponsor_model.dart';
import 'package:beaverbasketball/src/features/content/model/user_model.dart';
import 'package:beaverbasketball/src/features/content/model/youtube_model.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

abstract class ContentRepository {
  Future<List<YoutubeModel>> loadYoutubePost();
  Future<Either<String, List<CoachModel>>> getListCoach();
  Future<Either<String, void>> addCoach({
    required String name,
    required PlatformFile file,
  });
  Future<Either<String, void>> editCoach({
    required String id,
    required String name,
    required PlatformFile file,
  });
  Future<Either<String, void>> deleteCoach(
      {required String id, required String auth});
  Future<Either<String, List<SponsorModel>>> getListSponsor();
  Future<Either<String, void>> addSponsor({
    required PlatformFile file,
  });
  Future<Either<String, void>> editSponsor({
    required String id,
    required PlatformFile file,
  });
  Future<Either<String, void>> deleteSponsor(
      {required String id, required String auth});
  Future<Either<String, List<GalleryModel>>> getListGallery();
  Future<Either<String, void>> addGallery({
    required Map<String, String> bodyString,
    required Map<String, PlatformFile> bodyFile,
  });
  Future<Either<String, void>> editGallery({
    required String id,
    required Map<String, String> bodyString,
    required Map<String, PlatformFile> bodyFile,
  });
  Future<Either<String, void>> deleteGallery(
      {required String id, required String auth});
  Future<Either<String, List<NewsModel>>> getListNews();
  Future<Either<String, void>> addNews({
    required Map<String, String> bodyString,
    required Map<String, PlatformFile> bodyFile,
  });
  Future<Either<String, void>> editNews({
    required String id,
    required Map<String, String> bodyString,
    required Map<String, PlatformFile> bodyFile,
  });
  Future<Either<String, void>> deleteNews(
      {required String id, required String auth});
  Future<Either<String, List<ScheduleModel>>> getListSchedule();
  Future<Either<String, void>> addSchedule({
    required Map<String, String> bodyString,
  });
  Future<Either<String, void>> editSchedule({
    required String id,
    required Map<String, String> bodyString,
  });
  Future<Either<String, void>> deleteSchedule(
      {required String id, required String auth});

  Future<Either<String, List<AchievementModel>>> getListAchievement();
  Future<Either<String, void>> addAchievement({
    required Map<String, String> bodyString,
    required Map<String, PlatformFile> bodyFile,
  });
  Future<Either<String, void>> editAchievement({
    required String id,
    required Map<String, String> bodyString,
    required Map<String, PlatformFile> bodyFile,
  });
  Future<Either<String, void>> deleteAchievement(
      {required String id, required String auth});

  Future<Either<String, List<UserModel>>> getListUser();
}
