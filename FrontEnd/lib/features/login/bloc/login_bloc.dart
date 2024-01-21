import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:twitterclone/exports.dart';
import 'package:twitterclone/features/register/data/login_api.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginLoadingEvent>(loadingState);
    on<LoginUserEvent>(loginUserState);
  }

  FutureOr<void> loadingState(
      LoginLoadingEvent event, Emitter<LoginState> emit) {}

  FutureOr<void> loginUserState(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    final String email = event.email;
    final String password = event.password;
    String jwt = "";
    var box = Hive.box('token');
    try {
      jwt = await LoginServicesApi.loginUserAccount(
        email: email,
        password: password,
      );

      if (jwt != "") {
        emit(LoginLoadingSuccessState());
        debugPrint("Login Success");
      } else if (jwt == "") {
        debugPrint("Login Failed");
        emit(LoginLoadingErrorState());
      }
    } catch (err) {
      debugPrint("UserName checking error in Event: $err");
      emit(LoginLoadingErrorState());
    }
    box.put('token', jwt);
  }
}
