part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

sealed class RegisterActionableState extends RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterActionableState {}

class RegisterNavigateToHomeActionState extends RegisterActionableState {}

class OpenDatePickerActionState extends RegisterActionableState {}

class CloseDatePickerActionState extends RegisterActionableState {}

class NextButtonDisableActionState extends RegisterActionableState {}

class NextButtonEnableActionState extends RegisterActionableState {}

class NameCheckSuccessState extends RegisterActionableState {}

class EmailCheckSuccessState extends RegisterActionableState {}

class DOBCheckSuccessState extends RegisterActionableState {}

class NameCheckErrorState extends RegisterActionableState {}

class EmailCheckErrorState extends RegisterActionableState {}

class TextFieldErrorBorderState extends RegisterActionableState {}

class LoadingState extends RegisterActionableState {}

class LoadingSuccessState extends RegisterActionableState {}

class LoadingErrorState extends RegisterActionableState {}

class ShowPasswordState extends RegisterActionableState {}
