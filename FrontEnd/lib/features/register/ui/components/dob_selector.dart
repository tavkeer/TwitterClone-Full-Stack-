import 'package:intl/intl.dart';
import 'package:twitterclone/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:twitterclone/features/register/bloc/register_bloc.dart';

class DOBSelector extends StatelessWidget {
  final TextEditingController dob;
  final RegisterBloc registerBlocForDOB;
  final RegisterBloc registerBlocForNextButton;
  final void Function() next;
  final bool? showForgotPass;
  const DOBSelector({
    super.key,
    required this.dob,
    required this.registerBlocForDOB,
    required this.registerBlocForNextButton,
    required this.next,
    this.showForgotPass,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Divider(thickness: 1.2, color: Colors.grey[900]),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),

          //next button section
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (showForgotPass ?? false)
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              // const SizedBox(),
              BlocBuilder<RegisterBloc, RegisterState>(
                bloc: registerBlocForNextButton,
                buildWhen: (previous, current) =>
                    current is RegisterActionableState,
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      registerBlocForDOB.add(CloseDatePickerEvent());
                      next();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (state is NextButtonEnableActionState) {
                            return Colors.white;
                          } else {
                            return Colors.grey;
                          }
                        },
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        BlocBuilder<RegisterBloc, RegisterState>(
          bloc: registerBlocForDOB,
          buildWhen: (previous, current) => current is RegisterActionableState,
          builder: (context, state) {
            if (state is OpenDatePickerActionState) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 20),
                child: DatePickerWidget(
                  dateFormat: "dd/MMM/yyyy",
                  looping: true,
                  firstDate: DateTime(1990),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  onChange: (dateTime, selectedIndex) {
                    dob.text = DateFormat('dd MMMM yyyy').format(dateTime);
                  },
                  pickerTheme: const DateTimePickerTheme(
                    backgroundColor: Colors.black,
                    itemTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    dividerColor: Colors.white,
                    itemHeight: 60,
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
