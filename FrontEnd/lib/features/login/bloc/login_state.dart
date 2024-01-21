part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadingSuccessState extends LoginState {}

class LoginLoadingErrorState extends LoginState {}
