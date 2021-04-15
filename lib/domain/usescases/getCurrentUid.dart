
import 'package:flutter_application_2/domain/domainRepositories/firebaseRepositry.dart';

class GetCurrentUidUseCase{
  final FirebaseRepository repository;

  GetCurrentUidUseCase({this.repository});

  Future<String> call()async{
    return await repository.getCurrentUID();
  }
}