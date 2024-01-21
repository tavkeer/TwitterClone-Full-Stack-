import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:twitterclone/exports.dart';
import 'package:twitterclone/features/register/data/register_api.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<OpenDatePickerEvent>(openDatePickerEvent);
    on<CloseDatePickerEvent>(closeDatePickerEvent);
    on<SignUpButtonPressedEvent>(signUpButtonPressedEvent);
    on<NextButtonEnablEvent>(nextButtonEnableActionState);
    on<NextButtonDisableEvent>(nextButtondisableActionState);
    on<NameCheckedEvent>(nameCheckActionState);
    on<EmailCheckedEvent>(emailCheckActionState);
    on<TextFieldErrorBorderEvent>(textFieldErrorBorderState);
    on<LoadingEvent>(loadingState);
    on<RegisterUserEvent>(registerUser);
  }

  FutureOr<void> openDatePickerEvent(
      OpenDatePickerEvent event, Emitter<RegisterState> emit) {
    debugPrint("Date Picker Opened");
    emit(OpenDatePickerActionState());
  }

  FutureOr<void> closeDatePickerEvent(
      CloseDatePickerEvent event, Emitter<RegisterState> emit) {
    debugPrint("Date Picker Closed");
    emit(CloseDatePickerActionState());
  }

  FutureOr<void> signUpButtonPressedEvent(
      SignUpButtonPressedEvent event, Emitter<RegisterState> emit) {}

  FutureOr<void> nextButtonEnableActionState(
      NextButtonEnablEvent event, Emitter<RegisterState> emit) {
    debugPrint("NextButton Enable");
    emit(NextButtonEnableActionState());
  }

  FutureOr<void> nextButtondisableActionState(
      NextButtonDisableEvent event, Emitter<RegisterState> emit) {
    emit(NextButtonDisableActionState());
  }

  // send API call and retrieve if the user exists and
  //if the user did not exists then the state is error
  FutureOr<void> nameCheckActionState(
      NameCheckedEvent event, Emitter<RegisterState> emit) async {
    final String userName = event.userName;
    try {
      final responseCode = await RegistrationServiceApi.checkUserName(userName);

      if (responseCode == 200) {
        emit(NameCheckSuccessState());
        debugPrint("UserName checking Success in Event");
      } else if (responseCode == 400) {
        debugPrint("UserName checking error in Event");
        emit(NameCheckErrorState());
      }
      debugPrint(responseCode.toString());
    } catch (err) {
      debugPrint("UserName checking error in Event: $err");
      emit(NameCheckErrorState());
    }
  }

  FutureOr<void> emailCheckActionState(
      EmailCheckedEvent event, Emitter<RegisterState> emit) async {
    final String email = event.email;
    try {
      final responseCode = await RegistrationServiceApi.checkUserEmail(email);
      if (responseCode == 200) {
        debugPrint("Email checking Success in Event:");
        emit(EmailCheckSuccessState());
      } else if (responseCode == 400) {
        debugPrint("Email checking error in Event");
        emit(EmailCheckErrorState());
      }
      debugPrint(responseCode.toString());
    } catch (err) {
      debugPrint("Email checking error in Event: $err");
      emit(EmailCheckErrorState());
    }
  }

  FutureOr<void> textFieldErrorBorderState(
      TextFieldErrorBorderEvent event, Emitter<RegisterState> emit) {
    emit(TextFieldErrorBorderState());
  }

  FutureOr<void> loadingState(
      LoadingEvent event, Emitter<RegisterState> emit) async {
    emit(LoadingState());
  }

  FutureOr<void> registerUser(
      RegisterUserEvent event, Emitter<RegisterState> emit) async {
    emit(LoadingState());
    final String email = event.email;
    final String name = event.name;
    final String password = event.password;
    try {
      final responseCode = await RegistrationServiceApi.registerUserAccount(
        email: email,
        password: password,
        userName: name,
      );
      if (responseCode == 200) {
        debugPrint("Email checking Success in Event:");
        emit(EmailCheckSuccessState());
      } else if (responseCode == 400) {
        debugPrint("Email checking error in Event");
        emit(EmailCheckErrorState());
      }
      debugPrint(responseCode.toString());
      emit(LoadingSuccessState());
    } catch (err) {
      debugPrint("Failed to create the user: $err");
      emit(LoadingErrorState());
    }
  }
}
