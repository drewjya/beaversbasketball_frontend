import 'package:beaverbasketball/src/core/api/url.dart';
import 'package:beaverbasketball/src/features/content/model/achievement_model.dart';
import 'package:beaverbasketball/src/features/content/model/coach_model.dart';
import 'package:beaverbasketball/src/features/content/model/gallery_model.dart';
import 'package:beaverbasketball/src/features/content/model/news_model.dart';
import 'package:beaverbasketball/src/features/content/model/schedule_model.dart';
import 'package:beaverbasketball/src/features/content/model/sponsor_model.dart';
import 'package:beaverbasketball/src/features/content/model/user_model.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:http/http.dart' as http;

const _apiKey1 = "AIzaSyBYnhuaSpaPXeakbujqOqNIAuKsSNB49Vo";
const _apiKey2 = "AIzaSyAUo0xmh0jiQffKxa8mK6fhxJBXX3uenJw";

//AIzaSyAUo0xmh0jiQffKxa8mK6fhxJBXX3uenJw
class ContentRepositoryImpl extends ContentRepository {
  @override
  Future<List<YoutubeModel>> loadYoutubePost() async {
    final apiKeys = [_apiKey1, _apiKey2];
    List<YoutubeModel> data = [];
    for (var i = 0; i < apiKeys.length; i++) {
      try {
        final url =
            "https://www.googleapis.com/youtube/v3/search?channelId=UCqQ32OBHgYtWcxCXjT-vRxQ&maxResults=3&key=${apiKeys[i]}&order=date&part=snippet";

        data = await HttpWrapper.getYoutube(
          url: url,
          fromJson: (p0) => (p0["items"] as List)
              .map((e) => YoutubeModel.fromMap(e))
              .toList(),
        );
        break;
      } catch (e) {
        if (i == (apiKeys.length - 1)) {
          throw e;
        }
      }
    }

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

  @override
  Future<Either<String, void>> deleteCoach(
      {required String id, required String auth}) async {
    try {
      await http.get(Uri.parse(ApiUrl.getTokenSanctum));
      final ayam =
          await HttpWrapper.post(url: "${ApiUrl.getCoach + "/$id"}", headers: {
        "Authorization": auth,
      });

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> addCoach(
      {required String name, required PlatformFile file}) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.getCoach}",
        fromJson: (map) => map,
        bodyFile: {
          "image": file,
        },
        requestFields: (fields) {
          fields.fields["nama"] = name;
          fields.fields["keterangan_coach"] = "test";
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> editCoach(
      {required String id,
      required String name,
      required PlatformFile file}) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.postEditCoach}/$id",
        fromJson: (map) => map,
        bodyFile: {
          "image": file,
        },
        requestFields: (fields) {
          fields.fields["nama"] = name;
          fields.fields["keterangan_coach"] = "test";
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> addSponsor({required PlatformFile file}) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.getSponsor}",
        fromJson: (map) => map,
        bodyFile: {
          "image": file,
        },
        requestFields: (fields) {
          fields.fields["nama_sponsor"] = "tes";
          fields.fields["description"] = "test";
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> deleteSponsor(
      {required String id, required String auth}) async {
    try {
      await http.get(Uri.parse(ApiUrl.getTokenSanctum));
      final ayam = await HttpWrapper.post(
          url: "${ApiUrl.getSponsor + "/$id"}",
          headers: {
            "Authorization": auth,
          });

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> editSponsor(
      {required String id, required PlatformFile file}) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.postEditSponsor}/$id",
        fromJson: (map) => map,
        bodyFile: {
          "image": file,
        },
        requestFields: (fields) {
          fields.fields["nama_sponsor"] = "tes";
          fields.fields["description"] = "test";
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<SponsorModel>>> getListSponsor() async {
    try {
      final res = await HttpWrapper.getList(
        url: ApiUrl.getSponsor,
        fromJson: (map) => map
            .cast<Map<String, dynamic>>()
            .mapFixed((element, index) => SponsorModel.fromMap(element)),
      );
      return Right(res.toList());
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> addGallery(
      {required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.getGallery}",
        fromJson: (map) => map,
        bodyFile: bodyFile,
        requestFields: (fields) {
          final entries = bodyString.entries;
          for (var i = 0; i < entries.length; i++) {
            fields.fields[entries.elementAt(i).key] =
                entries.elementAt(i).value;
          }
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> deleteGallery(
      {required String id, required String auth}) async {
    try {
      await http.get(Uri.parse(ApiUrl.getTokenSanctum));
      final ayam = await HttpWrapper.post(
          url: "${ApiUrl.getGallery + "/$id"}",
          headers: {
            "Authorization": auth,
          });

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> editGallery(
      {required String id,
      required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.postUpdateGallery}/$id",
        fromJson: (map) => map,
        bodyFile: bodyFile,
        requestFields: (fields) {
          final entries = bodyString.entries;
          for (var i = 0; i < entries.length; i++) {
            fields.fields[entries.elementAt(i).key] =
                entries.elementAt(i).value;
          }
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<GalleryModel>>> getListGallery() async {
    try {
      final res = await HttpWrapper.getList(
        url: ApiUrl.getGallery,
        fromJson: (map) => map
            .cast<Map<String, dynamic>>()
            .mapFixed((element, index) => GalleryModel.fromMap(element)),
      );
      return Right(res.toList());
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> addNews(
      {required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.getNews}",
        fromJson: (map) => map,
        bodyFile: bodyFile,
        requestFields: (fields) {
          final entries = bodyString.entries;
          for (var i = 0; i < entries.length; i++) {
            fields.fields[entries.elementAt(i).key] =
                entries.elementAt(i).value;
          }
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> deleteNews(
      {required String id, required String auth}) async {
    try {
      await http.get(Uri.parse(ApiUrl.getTokenSanctum));
      final ayam =
          await HttpWrapper.post(url: "${ApiUrl.getNews + "/$id"}", headers: {
        "Authorization": auth,
      });

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> editNews(
      {required String id,
      required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.postNews}/$id",
        fromJson: (map) => map,
        bodyFile: bodyFile,
        requestFields: (fields) {
          final entries = bodyString.entries;
          for (var i = 0; i < entries.length; i++) {
            fields.fields[entries.elementAt(i).key] =
                entries.elementAt(i).value;
          }
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<NewsModel>>> getListNews() async {
    try {
      final res = await HttpWrapper.getList(
        url: ApiUrl.getNews,
        fromJson: (map) => map
            .cast<Map<String, dynamic>>()
            .mapFixed((element, index) => NewsModel.fromMap(element)),
      );
      return Right(res.toList());
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> addSchedule({
    required Map<String, String> bodyString,
  }) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.getSchedule}",
        fromJson: (map) => map,
        requestFields: (fields) {
          final entries = bodyString.entries;
          for (var i = 0; i < entries.length; i++) {
            fields.fields[entries.elementAt(i).key] =
                entries.elementAt(i).value;
          }
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> deleteSchedule(
      {required String id, required String auth}) async {
    try {
      await http.get(Uri.parse(ApiUrl.getTokenSanctum));
      final ayam = await HttpWrapper.post(
          url: "${ApiUrl.getSchedule + "/$id"}",
          headers: {
            "Authorization": auth,
          });

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> editSchedule({
    required String id,
    required Map<String, String> bodyString,
  }) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.postSchedule}/$id",
        fromJson: (map) => map,
        requestFields: (fields) {
          final entries = bodyString.entries;
          for (var i = 0; i < entries.length; i++) {
            fields.fields[entries.elementAt(i).key] =
                entries.elementAt(i).value;
          }
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<ScheduleModel>>> getListSchedule() async {
    try {
      final res = await HttpWrapper.getList(
        url: ApiUrl.getSchedule,
        fromJson: (map) => map
            .cast<Map<String, dynamic>>()
            .mapFixed((element, index) => ScheduleModel.fromMap(element)),
      );
      return Right(res.toList());
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> addAchievement(
      {required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.getAchievement}",
        fromJson: (map) => map,
        bodyFile: bodyFile,
        requestFields: (fields) {
          final entries = bodyString.entries;
          for (var i = 0; i < entries.length; i++) {
            fields.fields[entries.elementAt(i).key] =
                entries.elementAt(i).value;
          }
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> deleteAchievement(
      {required String id, required String auth}) async {
    try {
      await http.get(Uri.parse(ApiUrl.getTokenSanctum));
      final ayam = await HttpWrapper.post(
          url: "${ApiUrl.getAchievement + "/$id"}",
          headers: {
            "Authorization": auth,
          });

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> editAchievement(
      {required String id,
      required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    try {
      final ayam = await HttpWrapper.postFileMultiPart(
        url: "${ApiUrl.postAchievement}/$id",
        fromJson: (map) => map,
        bodyFile: bodyFile,
        requestFields: (fields) {
          final entries = bodyString.entries;
          for (var i = 0; i < entries.length; i++) {
            fields.fields[entries.elementAt(i).key] =
                entries.elementAt(i).value;
          }
        },
      );

      return Right(null);
    } catch (e) {
      print("DATA $e");
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<AchievementModel>>> getListAchievement() async {
    try {
      final res = await HttpWrapper.getList(
        url: ApiUrl.getAchievement,
        fromJson: (map) => map
            .cast<Map<String, dynamic>>()
            .mapFixed((element, index) => AchievementModel.fromMap(element)),
      );
      return Right(res.toList());
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<UserModel>>> getListUser() async {
    try {
      final res = await HttpWrapper.getList(
        url: ApiUrl.getAllUser,
        fromJson: (map) => map
            .cast<Map<String, dynamic>>()
            .mapFixed((element, index) => UserModel.fromMap(element)),
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
