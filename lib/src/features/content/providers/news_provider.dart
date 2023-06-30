import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/features/content/model/news_model.dart';
import 'package:beaverbasketball/src/features/content/providers/coach_providers.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/file_picker.dart';

class NewsNotifier extends ProviderNotifier<List<NewsModel>> {
  NewsNotifier({required super.ref}) {
    loadNews();
  }

  loadNews() async {
    state = ProviderState.loading(value: state.value);
    final data = await ProviderState.guard(
      function: () => ref.read(contentRepositoryProvider).getListNews(),
    );
    state = data.when(
      onInit: () => ProviderState.init(),
      onLoading: (value) {
        value?.sort(
          (a, b) {
            return b.date.compareTo(a.date);
          },
        );
        return ProviderState.loading(value: value);
      },
      onSuccess: (value) {
        value.sort(
          (a, b) {
            return b.date.compareTo(a.date);
          },
        );
        return ProviderState.success(value: value);
      },
      onError: (value, error) {
        value?.sort(
          (a, b) {
            return b.date.compareTo(a.date);
          },
        );
        return ProviderState.erroR(error: error, value: value);
      },
    );
  }

  deleteNews({required String id, required String auth}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () =>
          ref.read(contentRepositoryProvider).deleteNews(id: id, auth: auth),
    );

    loadNews();
  }

  insertNews(
      {required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref
          .read(contentRepositoryProvider)
          .addNews(bodyString: bodyString, bodyFile: bodyFile),
    );

    loadNews();
  }

  editNews(
      {required String id,
      required Map<String, String> bodyString,
      required Map<String, PlatformFile> bodyFile}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref
          .read(contentRepositoryProvider)
          .editNews(id: id, bodyString: bodyString, bodyFile: bodyFile),
    );

    loadNews();
  }
}

final newsProvider =
    ProviderNotifierProvider<NewsNotifier, List<NewsModel>>((ref) {
  return NewsNotifier(ref: ref);
});
