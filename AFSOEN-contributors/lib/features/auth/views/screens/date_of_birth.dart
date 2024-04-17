// import 'package:afsoen/old_arch/providers/auth_provider.dart';
import 'package:afsoen/features/auth/views/screens/gender.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:afsoen/features/auth/views/widgets/app_input.dart';
import 'package:afsoen/features/auth/views/widgets/reg_icon_text.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class DateOfBirth extends ConsumerStatefulWidget {
  const DateOfBirth({super.key});

  static const routeName = '/date-of-birth';

  @override
  ConsumerState<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends ConsumerState<DateOfBirth> {
  String _dateInput = 'Click to enter your birth-date';

  Future<void> _selectDate(BuildContext context) async {
    Logger().i("hello date");

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      String formattedDate = '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
      setState(() {
        _dateInput = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.07),
          child: Column(
            children: [
              RegistrationTitle(navigateTo: () => context.pop(), regTitle: "When is your birthday?"),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: deviceWidth(context) * 0.9,
                height: deviceHeight(context) * 0.4,
                child: Column(
                  children: [
                    DateInput(
                      title: 'Birth Date',
                      date: _dateInput,
                      pickDate: () async => _selectDate(context),
                    )
                  ],
                ),
              ),
              AppButton(
                onTap: () {
                  // ref.read(authProivder).getUserDob(dob: _dateInput);
                  context.push(ChooseGender.routeName);
                },
                placeholder: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
