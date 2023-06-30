import 'dart:developer';

import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/features/content/model/user_model.dart';
import 'package:beaverbasketball/src/features/content/providers/coach_providers.dart';
import 'package:beaverbasketball/src/features/content/repository/content_repository_impl.dart';

class PendaftarNotifier extends ProviderNotifier<List<UserModel>> {
  PendaftarNotifier({required super.ref}) {
    loadData();
  }

  loadData() async {
    state = ProviderState.loading();
    state = await ProviderState.guard(
      function: () => ref.read(contentRepositoryProvider).getListUser(),
    );
    log("$state");
  }
}

final pendaftarProvider =
    ProviderNotifierProvider<PendaftarNotifier, List<UserModel>>((ref) {
  return PendaftarNotifier(ref: ref);
});
