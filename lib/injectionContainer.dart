import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/presentation/bloc/auth/authCubit.dart';
import 'package:flutter_application_2/presentation/bloc/phoneAuth/phoneAuthCubit.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/firebaseRemoteDatasource.dart';
import 'data/datasource/firebaseRemoteDatasourceImpl.dart';
import 'data/repositories/firebaseRepository.dart';
import 'domain/domainRepositories/firebaseRepositry.dart';
import 'domain/usescases/getCreateCurrentUser.dart';
import 'domain/usescases/getCurrentUid.dart';
import 'domain/usescases/isSignIn.dart';
import 'domain/usescases/signInWithPhoneNumber.dart';
import 'domain/usescases/signOut.dart';
import 'domain/usescases/verifyPhoneNumber.dart';

final sl = GetIt.instance;

Future<void> init() async {

//Futures bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
        signOutUseCase: sl.call(),
        isSignInUseCase: sl.call(),
        getCurrentUidUseCase: sl.call(),
      ));
  sl.registerFactory<PhoneAuthCubit>(() => PhoneAuthCubit(
        getCreateCurrentUserUseCase: sl.call(),
        signInWithPhoneNumberUseCase: sl.call(),
        verifyPhoneNumberUseCase: sl.call(),
      ));

//useCase
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInWithPhoneNumberUseCase>(
      () => SignInWithPhoneNumberUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<VerifyPhoneNumberUseCase>(
      () => VerifyPhoneNumberUseCase(repository: sl.call()));

//repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

//remote data
sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl(
            auth: sl.call(),
            fireStore: sl.call(),
          ));

 //External
 final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
            
}