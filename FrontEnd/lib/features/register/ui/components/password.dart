import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitterclone/constants.dart';
import 'package:twitterclone/features/home/ui/home.dart';
import 'package:twitterclone/features/register/ui/components/dob_selector.dart';
import 'package:twitterclone/widgets/appbar.dart';
import 'package:twitterclone/features/register/bloc/register_bloc.dart';
import 'package:twitterclone/widgets/loading.dart';
import 'package:twitterclone/widgets/text_widget.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({
    super.key,
    required this.dob,
    required this.name,
    required this.email,
  });

  final TextEditingController dob;
  final TextEditingController name;
  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    final TextEditingController password = TextEditingController();
    final RegisterBloc registerBloc = RegisterBloc();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 30),
        child: BasicAppBar(),
      ),
      bottomNavigationBar: DOBSelector(
        dob: dob,
        registerBlocForDOB: RegisterBloc(),
        registerBlocForNextButton: registerBloc,
        next: () {
          (registerBloc.state is NextButtonEnableActionState)
              ? registerBloc.add(
                  RegisterUserEvent(
                    name: name.text.trim(),
                    email: email.text.trim(),
                    password: password.text.trim(),
                    dob: dob.text.trim(),
                  ),
                )
              : null;
        },
      ),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        bloc: registerBloc,
        listener: (context, state) {
          if (state is LoadingSuccessState) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return const Loading();

            default:
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You'll need a password",
                      style: boldStyle.copyWith(
                        fontSize: 25,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Make sure it's 8 character or more",
                      style: boldStyle.copyWith(
                        fontSize: 20,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.normal,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextWidget(
                      controller: password,
                      readonly: false,
                      hintText: "Password",
                      obsecureText: true,
                      ontap: () {},
                      onchanged: (value) {
                        password.text = value;
                        (value.length > 8)
                            ? registerBloc.add(NextButtonEnablEvent())
                            : null;
                      },
                      trailing: const Icon(Icons.visibility),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
