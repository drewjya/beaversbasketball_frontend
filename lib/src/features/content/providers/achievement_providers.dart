import 'dart:developer';

import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/features/content/model/achievement_model.dart';
import 'package:beaverbasketball/src/features/content/providers/coach_providers.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

String formatDateWithMonthName(String date, {bool isChanged = false}) {
  log(date);
  if (isChanged) {
    final dTime = DateTime.parse(date);
    final format = DateFormat("dd MMMM yyyy");
    return format.format(dTime);
  }
  final formatParse = DateFormat("dd-MM-yyyy");
  final dateInfo = formatParse.parseLoose(date);
  final format = DateFormat("dd MMMM yyyy");
  return format.format(dateInfo);
}

String formatDateWithMonthNameToDate(String date) {
  log(date);

  final format = DateFormat("dd MMMM yyyy");
  final dateInfo = format.parseLoose(date);
  final formatParse = DateFormat("yyyy-MM-dd");
  return formatParse.format(dateInfo);
}

class AchievementNotifier extends ProviderNotifier<List<AchievementModel>> {
  AchievementNotifier({required super.ref}) {
    loadAchievement();
  }

  loadAchievement() async {
    state = ProviderState.loading(value: state.value);
    state = await ProviderState.guard(
      function: () => ref.read(contentRepositoryProvider).getListAchievement(),
    );
    state = state.copyWith(
        value: state.value
            ?.map(
                (e) => e.copyWith(tanggal: formatDateWithMonthName(e.tanggal)))
            .toList());
  }

  deleteAchievement({required String id, required String auth}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref
          .read(contentRepositoryProvider)
          .deleteAchievement(id: id, auth: auth),
    );

    loadAchievement();
  }

  insertAchievement(
      {required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref
          .read(contentRepositoryProvider)
          .addAchievement(bodyString: bodyString, bodyFile: bodyFile),
    );

    loadAchievement();
  }

  editAchievement(
      {required String id,
      required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref
          .read(contentRepositoryProvider)
          .editAchievement(id: id, bodyString: bodyString, bodyFile: bodyFile),
    );

    loadAchievement();
  }
}

final achievementProvider =
    ProviderNotifierProvider<AchievementNotifier, List<AchievementModel>>(
        (ref) => AchievementNotifier(ref: ref));
