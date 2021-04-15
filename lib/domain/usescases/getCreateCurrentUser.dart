
import 'package:flutter_application_2/domain/domainRepositories/firebaseRepositry.dart';
import 'package:flutter_application_2/domain/entities/userEntity.dart';

class GetCreateCurrentUserUseCase{
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({this.repository});

  Future<void> call(UserEntity user)async{
    return await repository.getCreateCurrentUser(user);
  }
}