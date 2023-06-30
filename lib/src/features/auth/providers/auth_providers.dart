import 'dart:developer';

import 'package:beaverbasketball/main.dart';
import 'package:beaverbasketball/src/core/api/url.dart';
import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/features/auth/repository/auth_repository_impl.dart';
import 'package:beaverbasketball/src/features/content/providers/coach_providers.dart';

class AuthNotifier extends ProviderNotifier<String> {
  AuthNotifier({required super.ref}) {
    initBuild();
  }

  initBuild() async {
    final auth = ref.read(sharedPreferencesProvider).getString(PrefConst.auth);
    log("${auth} AUTHOTENTICATION");
    if (auth == null) {
      state = ProviderState.init();
      return;
    }
    final checkSession =
        await ref.read(authRepositoryProvider).checkSession(token: auth);

    checkSession.fold((l) async {
      log(l + "AUTH AYAm");
      await ref.read(sharedPreferencesProvider).remove(PrefConst.auth);
      state = ProviderState.init();
    }, (r) {
      log(r + "AUTH AYAm");
      state = ProviderState.success(value: auth);
    });
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
    // await ref.read(authRepositoryProvider).logOut(token: state.value!);

    state = ProviderState.init();
    print(state);
  }
}

final authProvider = ProviderNotifierProvider<AuthNotifier, String>(
  (ref) => AuthNotifier(ref: ref),
);
