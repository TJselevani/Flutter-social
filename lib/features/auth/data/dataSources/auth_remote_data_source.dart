import 'package:firebase_auth/firebase_auth.dart';
import 'package:social/core/error/exceptions.dart';
import 'package:social/core/logger/logger.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<String> signInWithOTP({
    required String phoneNumber,
    required String code,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final log = logger(AuthRemoteDataSourceImpl);
  final FirebaseAuth firebaseAuth;
  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<String> signUpWithEmailPassword({
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
      log.i('User signed up: ${userCredential.user}');
      return userCredential.user!.uid;
    } catch (e) {
      log.e(e.toString());
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement logInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signInWithOTP({
    required String phoneNumber,
    required String code,
  }) {
    // TODO: implement signInWithOTP
    throw UnimplementedError();
  }
}
