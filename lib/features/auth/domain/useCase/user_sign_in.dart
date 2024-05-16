import 'package:fpdart/fpdart.dart';
import 'package:social/core/error/failures.dart';
import 'package:social/core/useCase/useCase.dart';
import 'package:social/features/auth/domain/entities/user.dart';
import 'package:social/features/auth/domain/repository/auth_repository.dart';

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({
    required this.email,
    required this.password,
  });
}

class UserSignIn implements UseCase<User, UserSignInParams> {
  final AuthRepository authRepository;
  const UserSignIn({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(UserSignInParams params) async {
    return await authRepository.logInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}
