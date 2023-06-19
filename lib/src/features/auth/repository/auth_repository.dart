import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, String>> loginAdmin({
    required String email,
    required String password,
  });
  Future<Either<String, void>> logOut({
    required String token,
  });
}
