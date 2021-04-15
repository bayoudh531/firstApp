
import 'package:flutter_application_2/domain/domainRepositories/firebaseRepositry.dart';

class SignInWithPhoneNumberUseCase{
  final FirebaseRepository repository;

  SignInWithPhoneNumberUseCase({this.repository});

  Future<void> call(String smsPinCode)async{
    return await repository.signInWithPhoneNumber(smsPinCode);
  }
}