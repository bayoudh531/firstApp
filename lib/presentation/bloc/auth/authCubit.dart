import 'package:flutter_application_2/domain/usescases/getCurrentUid.dart';
import 'package:flutter_application_2/domain/usescases/isSignIn.dart';
import 'package:flutter_application_2/domain/usescases/signOut.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authState.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit({
    this.isSignInUseCase,
    this.signOutUseCase,
    this.getCurrentUidUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted() async{
    try{
      bool isSignIn=await isSignInUseCase.call();

      if (isSignIn){
        final uid=await getCurrentUidUseCase.call();
        emit(Authenticated(uid: uid));
      }else
        emit(UnAuthenticated());

    }catch(_){
      emit(UnAuthenticated());
    }
  }
  Future<void> loggedIn() async{
    try{
      final uid= await getCurrentUidUseCase.call();
      emit(Authenticated(uid: uid));
    }catch(_){

    }
  }
  Future<void> loggedOut() async{
    try{
      await signOutUseCase.call();
      emit(UnAuthenticated());
    }catch(_){}

  }
}