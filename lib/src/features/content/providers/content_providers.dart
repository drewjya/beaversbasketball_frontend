import 'package:beaverbasketball/src/features/content/repository/content_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'content_providers.g.dart';

@Riverpod(keepAlive: true)
class AboutPotition extends _$AboutPotition {
  @override
  Map<String, double> build() {
    return {};
  }

  addValue(MapEntry<String, double> value) {
    final oldState = state;
    if (oldState.containsKey(value.key)) {
      oldState[value.key] = oldState[value.key]! + value.value;
    } else {
      oldState[value.key] = value.value;
    }
    state = oldState;
  }
}

@riverpod
class CurrentIndexAbout extends _$CurrentIndexAbout {
  @override
  int build() {
    return 0;
  }

  changeindex(int val) {
    state = val;
  }
}



@Riverpod(keepAlive: true)
class YoutubeData extends _$YoutubeData {
  @override
  FutureOr<List<String>?> build() async{
    return ContentRepositoryImpl().loadYoutubePost();
  }
}