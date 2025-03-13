import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid; // Firebase User ID
  final String? email;
  final String? name;
  final String userToken;

  UserModel({
    required this.uid,
    this.email,
    this.name,
    required this.userToken,
  });

  // Convert Firebase User to UserModel
  factory UserModel.fromFirebaseUser(User user, String idToken) {
    return UserModel(
      userToken: idToken,
      uid: user.uid,
      email: user.email,
      name: user.displayName,
    );
  }

  // Convert to Map (for saving in SharedPreferences or Firestore)
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'name': name};
  }
}
