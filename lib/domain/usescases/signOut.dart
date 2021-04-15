

import 'package:flutter_application_2/domain/domainRepositories/firebaseRepositry.dart';

class SignOutUseCase{
  final FirebaseRepository repository;

  SignOutUseCase({this.repository});

  Future<void> call()async{
    return await repository.signOut();
  }
}