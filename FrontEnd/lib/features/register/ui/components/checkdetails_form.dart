import 'package:flutter/material.dart';
import 'package:twitterclone/widgets/text_widget.dart';

class CheckDetailsForm extends StatelessWidget {
  //controllers
  final TextEditingController dob;
  final TextEditingController name;
  final TextEditingController email;

  const CheckDetailsForm({
    super.key,
    required this.dob,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Name Field
        TextWidget(
          hintText: "Name",
          controller: name,
          readonly: false,
          onchanged: (value) {},
          ontap: () {},
          trailing: Container(
            margin: const EdgeInsets.all(13),
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.done, size: 20),
          ),
        ),
        const SizedBox(height: 20),

        //Email Field
        TextWidget(
          hintText: "Email",
          controller: email,
          readonly: true,
          onchanged: (value) {},
          ontap: () {},
          trailing: Container(
            margin: const EdgeInsets.all(13),
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.done, size: 20),
          ),
        ),
        const SizedBox(height: 20),

        //DOB Field
        TextWidget(
          hintText: "Date of birth",
          controller: dob,
          onchanged: (value) {
            dob.text = value;
          },
          readonly: true,
          ontap: () {},
          trailing: Container(
            margin: const EdgeInsets.all(13),
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.done, size: 20),
          ),
        ),
      ],
    );
  }
}
