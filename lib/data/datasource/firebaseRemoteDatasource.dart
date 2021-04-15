import 'package:flutter_application_2/domain/entities/userEntity.dart';

abstract class FirebaseRemoteDataSource{
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<void> signInWithPhoneNumber(String smsPinCode);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<String> getCurrentUID();
  Future<void> getCreateCurrentUser(UserEntity user);
}