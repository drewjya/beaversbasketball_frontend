import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/features/content/model/sponsor_model.dart';
import 'package:beaverbasketball/src/features/content/providers/coach_providers.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/file_picker.dart';

class SponsorNotifer extends ProviderNotifier<List<SponsorModel>> {
  SponsorNotifer({required super.ref}) {
    loadSponsor();
  }

  loadSponsor() async {
    state = ProviderState.loading(value: state.value);
    state = await ProviderState.guard(
      function: () => ref.read(contentRepositoryProvider).getListSponsor(),
    );
  }

  deleteSponsor({required String id, required String auth}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () =>
          ref.read(contentRepositoryProvider).deleteSponsor(id: id, auth: auth),
    );

    loadSponsor();
  }

  insertSponsor({required PlatformFile file}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () =>
          ref.read(contentRepositoryProvider).addSponsor(file: file),
    );

    loadSponsor();
  }

  editSponsor(
      {required String id,
      required String nama,
      required PlatformFile file}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref.read(contentRepositoryProvider).editSponsor(
            id: id,
            file: file,
          ),
    );

    loadSponsor();
  }
}

final sponsorProvider =
    ProviderNotifierProvider<SponsorNotifer, List<SponsorModel>>(
  (ref) => SponsorNotifer(ref: ref),
);
