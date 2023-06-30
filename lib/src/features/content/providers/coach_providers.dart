// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: invalid_use_of_internal_member

import 'dart:developer';

import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/core/core.dart';
import 'package:beaverbasketball/src/features/content/model/coach_model.dart';
import 'package:beaverbasketball/src/features/content/repository/content_repository_impl.dart';
import 'package:file_picker/file_picker.dart';

abstract class ProviderNotifier<T> extends StateNotifier<ProviderState<T>> {
  final Ref ref;

  ProviderNotifier({
    required this.ref,
  }) : super(ProviderState.init<T>());
}

typedef ProviderNotifierProvider<
        NotifierT extends StateNotifier<ProviderState<T>>, T>
    = StateNotifierProvider<NotifierT, ProviderState<T>>;

class CoachNotifier extends ProviderNotifier<List<CoachModel>> {
  CoachNotifier({required super.ref}) {
    loadCoach();
  }

  loadCoach() async {
    state = ProviderState.loading(value: state.value);
    state = await ProviderState.guard(
      function: () => ref.read(contentRepositoryProvider).getListCoach(),
    );
  }

  deleteCoach({required String id, required String auth}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () =>
          ref.read(contentRepositoryProvider).deleteCoach(id: id, auth: auth),
    );
    log("DATA $val");
    loadCoach();
  }

  insertCoach({required String nama, required PlatformFile file}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () =>
          ref.read(contentRepositoryProvider).addCoach(file: file, name: nama),
    );
    log("DATA $val");
    loadCoach();
  }

  editCoach(
      {required String id,
      required String nama,
      required PlatformFile file}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref
          .read(contentRepositoryProvider)
          .editCoach(id: id, file: file, name: nama),
    );
    log("DATA $val");
    loadCoach();
  }
}

final coachProvider =
    ProviderNotifierProvider<CoachNotifier, List<CoachModel>>((ref) {
  return CoachNotifier(ref: ref);
});
