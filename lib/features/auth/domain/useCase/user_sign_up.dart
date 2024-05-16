import 'package:fpdart/fpdart.dart';
import 'package:social/core/error/failures.dart';
import 'package:social/core/useCase/useCase.dart';
import 'package:social/features/auth/domain/entities/user.dart';
import 'package:social/features/auth/domain/repository/auth_repository.dart';

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}
