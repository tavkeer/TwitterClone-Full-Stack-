import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterclone/widgets/text_widget.dart';
import 'package:twitterclone/features/register/bloc/register_bloc.dart';

class RegisterForm extends StatelessWidget {
  //controllers
  final TextEditingController dob;
  final TextEditingController name;
  final TextEditingController email;
  final void Function() openDatePicker;

  //bloc instance
  final RegisterBloc registerBlocForDOB;
  final RegisterBloc registerBlocForNextButton;
  final RegisterBloc nameConfirm;
  final RegisterBloc emailConfirm;
  final RegisterBloc dobConfirm;

  const RegisterForm({
    super.key,
    required this.dob,
    required this.name,
    required this.email,
    required this.dobConfirm,
    required this.nameConfirm,
    required this.emailConfirm,
    required this.openDatePicker,
    required this.registerBlocForDOB,
    required this.registerBlocForNextButton,
  });

  @override
  Widget build(BuildContext context) {
    void enableNextButton() {
      if (nameConfirm.state is NameCheckSuccessState &&
          emailConfirm.state is EmailCheckSuccessState) {
        registerBlocForNextButton.add(NextButtonEnablEvent());
      } else if (nameConfirm.state is NameCheckErrorState ||
          emailConfirm.state is EmailCheckErrorState) {
        registerBlocForNextButton.add(NextButtonDisableEvent());
      }
    }

    return Column(
      children: [
        //Name Field
        TextWidget(
          hintText: "Name",
          controller: name,
          readonly: false,
          onchanged: (value) {
            name.text = value;
            nameConfirm.add(NameCheckedEvent(userName: name.text.trim()));
          },
          ontap: () {
            enableNextButton();
            registerBlocForDOB.add(CloseDatePickerEvent());
          },
          trailing: BlocBuilder<RegisterBloc, RegisterState>(
            bloc: nameConfirm,
            builder: (context, state) {
              if (state is NameCheckSuccessState) {
                return Container(
                  margin: const EdgeInsets.all(13),
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.done, size: 20),
                );
              } else if (state is NameCheckErrorState) {
                return const Icon(
                  Icons.error,
                  size: 30,
                  color: Colors.red,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
        const SizedBox(height: 20),

        //Email Field
        TextWidget(
          hintText: "Email",
          controller: email,
          readonly: false,
          onchanged: (value) {
            email.text = value;
            enableNextButton();
            emailConfirm.add(EmailCheckedEvent(email: email.text.trim()));
          },
          ontap: () {
            registerBlocForDOB.add(CloseDatePickerEvent());
          },
          trailing: BlocBuilder<RegisterBloc, RegisterState>(
            bloc: emailConfirm,
            builder: (context, state) {
              if (state is EmailCheckSuccessState) {
                return Container(
                  margin: const EdgeInsets.all(13),
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.done, size: 20),
                );
              } else if (state is EmailCheckErrorState) {
                return const Icon(
                  Icons.error,
                  size: 30,
                  color: Colors.red,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
        const SizedBox(height: 20),

        //DOB Field
        TextWidget(
          hintText: "Date of birth",
          controller: dob,
          onchanged: (value) {
            enableNextButton();
            dob.text = value;
          },
          readonly: true,
          ontap: openDatePicker,
        ),
      ],
    );
  }
}
