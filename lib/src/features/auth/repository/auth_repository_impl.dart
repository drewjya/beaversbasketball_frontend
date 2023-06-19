import 'dart:developer';

import 'package:beaverbasketball/src/core/api/url.dart';
import 'package:beaverbasketball/src/core/core.dart';
import 'package:dartz/dartz.dart';
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
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
