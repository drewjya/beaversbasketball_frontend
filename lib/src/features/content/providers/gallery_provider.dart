import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/features/content/model/gallery_model.dart';
import 'package:beaverbasketball/src/features/content/providers/coach_providers.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/file_picker.dart';

class GalleryNotifier extends ProviderNotifier<List<GalleryModel>> {
  GalleryNotifier({required super.ref}) {
    loadGallery();
  }

  loadGallery() async {
    state = ProviderState.loading(value: state.value);
    state = await ProviderState.guard(
      function: () => ref.read(contentRepositoryProvider).getListGallery(),
    );
  }

  deleteGallery({required String id, required String auth}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () =>
          ref.read(contentRepositoryProvider).deleteGallery(id: id, auth: auth),
    );

    loadGallery();
  }

  insertGallery(
      {required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref
          .read(contentRepositoryProvider)
          .addGallery(bodyString: bodyString, bodyFile: bodyFile),
    );

    loadGallery();
  }

  editGallery(
      {required String id,
      required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref
          .read(contentRepositoryProvider)
          .editGallery(id: id, bodyString: bodyString, bodyFile: bodyFile),
    );

    loadGallery();
  }
}

final galleryProvider =
    ProviderNotifierProvider<GalleryNotifier, List<GalleryModel>>((ref) {
  return GalleryNotifier(ref: ref);
});
