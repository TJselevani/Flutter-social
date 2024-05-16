import 'package:social/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.uid,
    required super.firstName,
    super.lastName,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
    );
  }

  factory UserModel.fromUserCredential(userCredential) {
    // Get the newly created user's UID
    String uid = userCredential.uid;

    // Extract name and email
    String displayName = userCredential.displayName ?? '';
    List<String> nameParts = displayName.split(' ');
    String firstName = nameParts.isNotEmpty ? nameParts.first : '';
    String lastName = nameParts.length > 1 ? nameParts.last : '';
    String email = userCredential.email ?? '';

    // Create UserModel from extracted data
    return UserModel(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
  }
}
