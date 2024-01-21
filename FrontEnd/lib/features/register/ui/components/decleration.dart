import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitterclone/constants.dart';
import 'package:twitterclone/features/register/ui/components/check_details.dart';
import 'package:twitterclone/widgets/appbar.dart';
import 'package:twitterclone/features/register/bloc/register_bloc.dart';
import 'package:twitterclone/features/register/ui/components/dob_selector.dart';

class DecleartionPage extends StatelessWidget {
  const DecleartionPage({
    super.key,
    required this.dob,
    required this.registerBlocForDOB,
    required this.registerBlocForNextButton,
    required this.name,
    required this.email,
  });

  final TextEditingController dob;
  final TextEditingController name;
  final TextEditingController email;
  final RegisterBloc registerBlocForDOB;
  final RegisterBloc registerBlocForNextButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 30),
        child: BasicAppBar(),
      ),
      bottomNavigationBar: DOBSelector(
        next: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CheckDetailsPage(
                dob: dob,
                name: name,
                email: email,
              ),
            ),
          );
        },
        dob: dob,
        registerBlocForDOB: registerBlocForDOB,
        registerBlocForNextButton: registerBlocForNextButton,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        children: [
          Text(
            'Create your account',
            style: boldStyle.copyWith(fontSize: 27),
          ),
          const SizedBox(height: 20),
          Text(
            'Track where you see X content acress the web',
            style: boldStyle.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'X uses this data to personalize your experience. This web brwosing history will never be stored with you  name, email, or phone number.',
              style: boldStyle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Checkbox(
              value: true,
              activeColor: Colors.blue,
              checkColor: Colors.black,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'By signing up, you agree to our',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: 'Terms, Privacy Policy, ',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: 'and ',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: 'Cookie User. ',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text:
                      'X may user your contact information, including your email addresss and phone number for purposed outlined in our Privacy Policy,',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: ' Learn more',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
