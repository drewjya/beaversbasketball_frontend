import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

abstract class AuthRepository {
  Future<Either<String, String>> loginAdmin({
    required String email,
    required String password,
  });
  Future<Either<String, void>> logOut({
    required String token,
  });
  Future<Either<String, String>> checkSession({required String token});
  Future<Either<String, void>> registerMember(
      {required String namaLengkap,
      required String tanggalLahir,
      required String tempatLahir,
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
      required PlatformFile akteKelahiran});
}
