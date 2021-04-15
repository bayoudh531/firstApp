import 'dart:io';

import 'package:flutter_application_2/domain/entities/userEntity.dart';
import 'package:flutter_application_2/domain/usescases/getCreateCurrentUser.dart';
import 'package:flutter_application_2/domain/usescases/signInWithPhoneNumber.dart';
import 'package:flutter_application_2/domain/usescases/verifyPhoneNumber.dart';
import 'package:flutter_application_2/presentation/bloc/phoneAuth/phoneAuthState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final SignInWithPhoneNumberUseCase signInWithPhoneNumberUseCase;
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;

  PhoneAuthCubit({
    this.signInWithPhoneNumberUseCase,
    this.verifyPhoneNumberUseCase,
    this.getCreateCurrentUserUseCase,
  }) : super(PhoneAuthInitial());

  Future<void> submitVerifyPhoneNumber({String phoneNumber}) async {
    emit(PhoneAuthLoading());
    try {
      await verifyPhoneNumberUseCase.call(phoneNumber);
      emit(PhoneAuthSmsCodeReceived());
    } on SocketException catch (_) {
      emit(PhoneAuthFailure());
    } catch (_) {
      emit(PhoneAuthFailure());
    }
  }

  Future<void> submitSmsCode({String smsCode}) async {
    emit(PhoneAuthLoading());
    try {
      await signInWithPhoneNumberUseCase.call(smsCode);
      emit(PhoneAuthProfileInfo());
    } on SocketException catch (_) {
      emit(PhoneAuthFailure());
    } catch (_) {
      emit(PhoneAuthFailure());
    }
  }

  Future<void> submitProfileInfo({
    String name,
    String profileUrl,
    String phoneNumber,
  }) async {
    try {
      await getCreateCurrentUserUseCase.call(UserEntity(
        uid: "",
        name: name,
        email: "",
        phoneNumber: phoneNumber,
        isOnline: true,
        profileUrl: profileUrl,
        status: ""
      ));
      emit(PhoneAuthSuccess());
    } on SocketException catch (_) {
      emit(PhoneAuthFailure());
    } catch (_) {
      emit(PhoneAuthFailure());
    }
  }
}