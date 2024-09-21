import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/user_model.dart';

abstract class AuthRepository {
  Future<Either<ServerException, UserModel>> signUp({
    required String email,
    required String password,
    required String phone,
    required String name,
  });

  Future<Either<ServerException, UserModel>> signIn({
    required String email,
    required String password,
  });
}
