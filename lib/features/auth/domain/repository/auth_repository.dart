import 'package:fpdart/fpdart.dart';
import 'package:social/core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> logInWithEmailPassword({
    required String email,
    required String password,
  });
  
  Future<Either<Failure, String>> signInWithOTP({
    required String phoneNumber,
    required String code,
  });
}
