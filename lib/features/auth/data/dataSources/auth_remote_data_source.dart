import 'package:firebase_auth/firebase_auth.dart';
import 'package:social/core/error/exceptions.dart';
import 'package:social/core/logger/logger.dart';
import 'package:social/features/auth/data/models/user.model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signInWithOTP({
    required String phoneNumber,
    required String code,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final log = logger(AuthRemoteDataSourceImpl);
  final FirebaseAuth firebaseAuth;
  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(name);
      if (userCredential.user == null) {
        log.e('User is null');
        throw ServerException(message: 'User is null');
      }
      log.i('User successfully signed up: ${userCredential.user}');
      return UserModel.fromUserCredential(userCredential.user);
    } catch (e) {
      log.e(e.toString());
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        log.e('User does not exist');
        throw ServerException(message: 'Incorrect email or password, User does not Exist!');
      }
      log.i('User successfully signed In: ${userCredential.user}');
      return UserModel.fromUserCredential(userCredential.user);
    } catch (e) {
      log.e(e.toString());
      throw ServerException(message: e.toString());
    }
    
  }

  @override
  Future<UserModel> signInWithOTP({
    required String phoneNumber,
    required String code,
  }) {
    // TODO: implement signInWithOTP
    throw UnimplementedError();
  }
}
