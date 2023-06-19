// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: invalid_use_of_internal_member

import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/core/core.dart';
import 'package:beaverbasketball/src/features/content/model/coach_model.dart';
import 'package:beaverbasketball/src/features/content/repository/content_repository_impl.dart';

// abstract class ProviderNotifier<T> extends Notifier<ProviderState<T>> {}

// class CoachNotifier extends ProviderNotifier<List<CoachModel>> {
//   @override
//   build(){

//     return ProviderState.init();
//   }

// }

// typedef ProviderNotifierProvider<NotifierT extends Notifier<ProviderState<T>>,
//         T>
//     = NotifierProviderImpl<NotifierT, ProviderState<T>>;

// final coachProvider = (ProviderNotifierProvider<CoachNotifier, List<CoachModel>>(
//     CoachNotifier.new));

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
}

final coachProvider =
    ProviderNotifierProvider<CoachNotifier, List<CoachModel>>((ref) {
  return CoachNotifier(ref: ref);
});
