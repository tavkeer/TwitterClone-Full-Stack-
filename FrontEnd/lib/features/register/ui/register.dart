import 'package:flutter/material.dart';
import 'package:twitterclone/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterclone/widgets/appbar.dart';
import 'package:twitterclone/features/register/bloc/register_bloc.dart';
import 'package:twitterclone/features/register/ui/components/decleration.dart';
import 'package:twitterclone/features/register/ui/components/register_form.dart';
import 'package:twitterclone/features/register/ui/components/dob_selector.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //controllers
    final TextEditingController dob = TextEditingController();
    final TextEditingController name = TextEditingController();
    final TextEditingController email = TextEditingController();

    //bloc instance
    final RegisterBloc registerBlocForDOB = RegisterBloc();
    final RegisterBloc registerBlocForNextButton = RegisterBloc();
    final RegisterBloc nameConfirm = RegisterBloc();
    final RegisterBloc emailConfirm = RegisterBloc();
    final RegisterBloc dobConfirm = RegisterBloc();

    //functions
    void openDatePicker() {
      if (registerBlocForDOB.state is OpenDatePickerActionState) {
        registerBlocForDOB.add(CloseDatePickerEvent());
      } else {
        registerBlocForDOB.add(OpenDatePickerEvent());
      }
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 30),
        child: BasicAppBar(),
      ),
      bottomNavigationBar: DOBSelector(
        next: () {
          if (registerBlocForDOB.state is! NextButtonEnableActionState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DecleartionPage(
                  dob: dob,
                  name: name,
                  email: email,
                  registerBlocForDOB: registerBlocForDOB,
                  registerBlocForNextButton: registerBlocForNextButton,
                ),
              ),
            );
          }
        },
        dob: dob,
        registerBlocForDOB: registerBlocForDOB,
        registerBlocForNextButton: registerBlocForNextButton,
      ),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create your account',
                  style: boldStyle,
                ),
                const SizedBox(
                  height: 100,
                ),
                RegisterForm(
                  dob: dob,
                  name: name,
                  email: email,
                  dobConfirm: dobConfirm,
                  nameConfirm: nameConfirm,
                  emailConfirm: emailConfirm,
                  openDatePicker: openDatePicker,
                  registerBlocForDOB: registerBlocForDOB,
                  registerBlocForNextButton: registerBlocForNextButton,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    registerText,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
