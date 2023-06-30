import 'dart:developer';

import 'package:beaverbasketball/src/core/api/url.dart';
import 'package:beaverbasketball/src/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<String, String>> loginAdmin(
      {required String email, required String password}) async {
    try {
      await http.get(Uri.parse(ApiUrl.getTokenSanctum));

      final res = await HttpWrapper.post<String>(
          url: ApiUrl.postLogin,
          body: {
            "email": email,
            "password": password,
          },
          fromJson: (map) => map["authorization"],
          headers: {
            "Accept": "application/json",
          });

      return Right(res);
    } catch (e) {
      log("$e");
      if (e is String) {
        return Left("$e");
      }
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> logOut({required String token}) async {
    final res = await HttpWrapper.get<dynamic>(
      url: ApiUrl.getLogout,
      headers: {"Authorization": "Bearer $token"},
      fromJson: (map) => map,
    );
    return Right(res);
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
      required PlatformFile akteKelahiran}) async {
    try {
      final res = await HttpWrapper.postFileMultiPart<dynamic>(
        url: ApiUrl.postRegisterMember,
        fromJson: (map) => map,
        bodyFile: {
          "dokumen_akta": akteKelahiran,
          "dokumen_kk": dokumenKK,
        },
        requestFields: (request) {
          request.fields["nama_lengkap"] = namaLengkap;
          request.fields["tanggal_lahir"] = tanggalLahir;
          request.fields["tempat_lahir"] = tempatLahir;
          request.fields["jenis_kelamin"] = jenisKelamin;
          request.fields["alamat"] = alamatTempatTinggal;
          request.fields["nomor_wa"] = nomorWhatsappAktif;
          request.fields["nama_bpk"] = namaBapak;
          request.fields["nomor_bpk"] = noHpBapak;
          request.fields["asal_sekolah"] = asalSekolah;
          request.fields["nama_ibu"] = namaIbu;
          request.fields["nomor_ibu"] = noHpIbu;
          request.fields["ukuran_jersey"] = ukuranJersey;
          request.fields["cabang_daftar"] = cabangPendaftaran;
        },
      );

      return Right(res);
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, String>> checkSession({required String token}) async {
    try {
      final res = await HttpWrapper.get<dynamic>(
        url: ApiUrl.getCheckSession,
        headers: {"Authorization": "Bearer $token"},
        fromJson: (map) => map,
      );
      return Right("$res");
    } catch (e) {
      return Left("$e");
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
