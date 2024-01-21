part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class OpenDatePickerEvent extends RegisterEvent {}

class CloseDatePickerEvent extends RegisterEvent {}

class SignUpButtonPressedEvent extends RegisterEvent {}

class NextButtonEnablEvent extends RegisterEvent {}

class NextButtonDisableEvent extends RegisterEvent {}

class NameCheckedEvent extends RegisterEvent {
  final String userName;
  NameCheckedEvent({required this.userName});
}

class EmailCheckedEvent extends RegisterEvent {
  final String email;
  EmailCheckedEvent({required this.email});
}

class TextFieldErrorBorderEvent extends RegisterEvent {}

class LoadingEvent extends RegisterEvent {}

class ShowPasswordEvent extends RegisterEvent {}

class RegisterUserEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String dob;

  RegisterUserEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.dob,
  });
}
