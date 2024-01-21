import 'package:flutter/material.dart';
import 'package:twitterclone/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitterclone/features/register/ui/components/password.dart';
import 'package:twitterclone/widgets/appbar.dart';
import 'package:twitterclone/features/register/ui/components/checkdetails_form.dart';

class CheckDetailsPage extends StatelessWidget {
  const CheckDetailsPage({
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
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 30),
          child: BasicAppBar(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create your account',
                style: boldStyle,
              ),
              const SizedBox(height: 35),
              CheckDetailsForm(
                dob: dob,
                name: name,
                email: email,
              ),
              const SizedBox(height: 100),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms, Privacy Policy, ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    TextSpan(
                      text: 'Cookie Use. ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text:
                          'X may use your contact information, including your email addresss and phone number for purposed outlined in our Privacy Policy,',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    TextSpan(
                      text: ' Learn more',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' Others will be able to find you by ea=mail or phone number, when provided, unless you choose otherwise ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    TextSpan(
                      text: ' here.',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PasswordPage(dob: dob, name: name, email: email),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 55),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return Colors.blue;
                      },
                    ),
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
