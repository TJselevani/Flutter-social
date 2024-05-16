import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:fpdart/fpdart.dart';
import 'package:social/core/error/exceptions.dart';
import 'package:social/core/error/failures.dart';
import 'package:social/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:social/features/auth/domain/entities/user.dart';
import 'package:social/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on fb.FirebaseAuthException catch (e) {
      return left(Failure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.logInWithEmailPassword(
        email: email,
        password: password,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on fb.FirebaseAuthException catch (e) {
      return left(Failure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithOTP({
    required String phoneNumber,
    required String code,
  }) {
    // TODO: implement signInWithOTP
    throw UnimplementedError();
  }

  // Future<Either<Failure, User>> _getUser(
  //   Future<User> Function() fn,
  // ) async {
  //   try {
  //     final user = await fn;
  //     return right(user as User);
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message));
  //   } on fb.FirebaseAuthException catch (e) {
  //     return left(Failure(e.message.toString()));
  //   }
  // }
}
