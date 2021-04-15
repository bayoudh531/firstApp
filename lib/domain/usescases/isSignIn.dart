
import 'package:flutter_application_2/domain/domainRepositories/firebaseRepositry.dart';

class IsSignInUseCase{
  final FirebaseRepository repository;

  IsSignInUseCase({this.repository});

  Future<bool> call() async{
    return await repository.isSignIn();
  }
}