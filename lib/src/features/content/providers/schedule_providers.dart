import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/features/content/model/schedule_model.dart';
import 'package:beaverbasketball/src/features/content/providers/coach_providers.dart';
import 'package:beaverbasketball/src/src.dart';

class ScheduleNotifier extends ProviderNotifier<List<ScheduleModel>> {
  ScheduleNotifier({required super.ref}) {
    loadSchedule();
  }

  loadSchedule() async {
    state = ProviderState.loading(value: state.value);
    state = await ProviderState.guard(
      function: () => ref.read(contentRepositoryProvider).getListSchedule(),
    );
  }

  deleteSchedule({required String id, required String auth}) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref
          .read(contentRepositoryProvider)
          .deleteSchedule(id: id, auth: auth),
    );

    loadSchedule();
  }

  insertSchedule({
    required Map<String, String> bodyString,
  }) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref.read(contentRepositoryProvider).addSchedule(
            bodyString: bodyString,
          ),
    );

    loadSchedule();
  }

  editSchedule({
    required String id,
    required Map<String, String> bodyString,
  }) async {
    state = ProviderState.loading(value: state.value);
    final val = await ProviderState.guard(
      function: () => ref.read(contentRepositoryProvider).editSchedule(
            id: id,
            bodyString: bodyString,
          ),
    );

    loadSchedule();
  }
}

final scheduleProvider =
    ProviderNotifierProvider<ScheduleNotifier, List<ScheduleModel>>((ref) {
  return ScheduleNotifier(ref: ref);
});
