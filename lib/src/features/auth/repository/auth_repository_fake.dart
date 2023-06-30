import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import 'auth_repository.dart';

class AuthRepositoryFake extends AuthRepository {
  @override
  Future<Either<String, String>> loginAdmin(
      {required String email, required String password}) {
    // TODO: implement loginAdmin
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> logOut({required String token}) {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
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
      required PlatformFile akteKelahiran}) {
    // TODO: implement registerMember
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> checkSession({required String token}) {
    // TODO: implement checkSession
    throw UnimplementedError();
  }
  // TODO add your methods here
}
