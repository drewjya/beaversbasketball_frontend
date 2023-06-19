import 'package:beaverbasketball/main.dart';
import 'package:beaverbasketball/src/core/api/url.dart';
import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/features/auth/repository/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthNotifier extends Notifier<ProviderState<String>> {
  @override
  build() {
    final auth = ref.read(sharedPreferencesProvider).getString(PrefConst.auth);
    if (auth == null) {
      return ProviderState.init();
    }
    return ProviderState.success(value: auth);
  }

  login({
    required String email,
    required String password,
  }) async {
    state = ProviderState.loading(value: state.value);

    final res = await ProviderState.guard(
      function: () => ref
          .read(authRepositoryProvider)
          .loginAdmin(email: email, password: password),
    oldValue: state.value,
    );
    if (res.value != null) {
      ref.read(sharedPreferencesProvider).setString(PrefConst.auth, res.value!);
    }
    state = res;
  }

  logOut() async {
    state = ProviderState.loading(value: state.value);
    await ref.read(sharedPreferencesProvider).remove(PrefConst.auth);
    await ref.read(authRepositoryProvider).logOut(token: state.value!);
    state = ProviderState.init();
  }
}

final authProvider =
    NotifierProvider<AuthNotifier, ProviderState<String>>(AuthNotifier.new);
