import 'package:beaverbasketball/src/core/common/provider_state.dart';
import 'package:beaverbasketball/src/features/auth/repository/auth_repository_impl.dart';
import 'package:beaverbasketball/src/features/content/providers/coach_providers.dart';
import 'package:file_picker/file_picker.dart';

class RegisterNotifier extends ProviderNotifier<void> {
  RegisterNotifier({required super.ref});

  register({
    required String namaLengkap,
    required String tempatLahir,
    required String tanggalLahir,
    required String jenisKelamin,
    required String cabangPendaftaran,
    required String alamatTempatTinggal,
    required String asalSekolah,
    required String nomorWhatsappAktif,
    required String namaBapak,
    required String noHpBapak,
    required String namaIbu,
    required String noHpIbu,
    required String ukuranJersey,
    required PlatformFile dokumenKK,
    required PlatformFile akteKelahiran,
  }) async {
    state = ProviderState.loading();
    state = await ProviderState.guard(
      function: () => ref.read(authRepositoryProvider).registerMember(
          namaLengkap: namaLengkap,
          tempatLahir: tempatLahir,
          tanggalLahir: tanggalLahir,
          jenisKelamin: jenisKelamin,
          cabangPendaftaran: cabangPendaftaran,
          alamatTempatTinggal: alamatTempatTinggal,
          asalSekolah: asalSekolah,
          nomorWhatsappAktif: nomorWhatsappAktif,
          namaBapak: namaBapak,
          noHpBapak: noHpBapak,
          namaIbu: namaIbu,
          noHpIbu: noHpIbu,
          ukuranJersey: ukuranJersey,
          dokumenKK: dokumenKK,
          akteKelahiran: akteKelahiran),
    );
  }
}

final registerProvider =
    ProviderNotifierProvider.autoDispose<RegisterNotifier, ProviderState<void>>(
  (ref) => RegisterNotifier(ref: ref),
);
