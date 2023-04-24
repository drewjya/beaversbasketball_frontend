import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
class Authorization extends _$Authorization {
  @override
  FutureOr<String> build() {
    throw UnimplementedError();
  }

  loadAuth() {
    state = AsyncValue.data("value");
  }
}
