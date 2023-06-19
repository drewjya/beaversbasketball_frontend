import 'package:dartz/dartz.dart';

import 'auth_repository.dart';

class AuthRepositoryFake extends AuthRepository {
  @override
  Future<Either<String, String>> loginAdmin({required String email, required String password}) {
    // TODO: implement loginAdmin
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> logOut({required String token}) {
    // TODO: implement logOut
    throw UnimplementedError();
  }
  // TODO add your methods here
}
