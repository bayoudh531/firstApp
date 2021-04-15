
import 'package:flutter_application_2/domain/domainRepositories/firebaseRepositry.dart';

class VerifyPhoneNumberUseCase{

  final FirebaseRepository repository;

  VerifyPhoneNumberUseCase({this.repository});

  Future<void> call(String phoneNumber)async{
    return await repository.verifyPhoneNumber(phoneNumber);
  }
}