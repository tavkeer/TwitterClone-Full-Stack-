import 'package:flutter/material.dart';
import 'package:twitterclone/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterclone/widgets/appbar.dart';
import 'package:twitterclone/widgets/loading.dart';
import 'package:twitterclone/widgets/text_widget.dart';
import 'package:twitterclone/features/home/ui/home.dart';
import 'package:twitterclone/features/login/bloc/login_bloc.dart';
import 'package:twitterclone/features/register/bloc/register_bloc.dart';
import 'package:twitterclone/features/register/ui/components/dob_selector.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //initializers

    final TextEditingController email = TextEditingController();

    final TextEditingController password = TextEditingController();

    final RegisterBloc nextButtonBloc = RegisterBloc();

    final LoginBloc loginBloc = LoginBloc();

    enableButtton() {
      if (email.text.length > 8 && password.text.length > 6) {
        nextButtonBloc.add(NextButtonEnablEvent());
      }
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 30),
        child: BasicAppBar(),
      ),
      bottomNavigationBar: DOBSelector(
        next: () {
          if (nextButtonBloc.state is NextButtonEnableActionState) {
            loginBloc.add(LoginUserEvent(
              email: email.text.trim(),
              password: password.text.trim(),
            ));
          }
        },
        showForgotPass: true,
        dob: TextEditingController(),
        registerBlocForDOB: RegisterBloc(),
        registerBlocForNextButton: nextButtonBloc,
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
        listener: (context, state) {
          if (state is LoginLoadingSuccessState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        buildWhen: (previous, current) => State is LoginState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoginLoadingState:
              return const Loading();
            //if the bloc doesn't emit any state
            default:
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      "To get started, first enter your phone, email, or @username",
                      style: boldStyle.copyWith(
                        fontSize: 25,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextWidget(
                      ontap: () {},
                      readonly: false,
                      hintText: "Email",
                      controller: email,
                      onchanged: (value) => enableButtton(),
                    ),
                    const SizedBox(height: 30),
                    TextWidget(
                      ontap: () {},
                      readonly: false,
                      hintText: "Password",
                      controller: password,
                      onchanged: (value) => enableButtton(),
                      trailing: const Icon(Icons.visibility),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
