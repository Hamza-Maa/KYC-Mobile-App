import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/input_decoration.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class DateOfBirthField extends StatefulWidget {
  const DateOfBirthField({super.key});

  @override
  _DateOfBirthFieldState createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  // Local state to store the selected date
  DateTime? _selectedDate;

  // Create a masked text controller with the desired date format
  final MaskedTextController _controller = MaskedTextController(
    mask: '00/00/0000',
  );

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    // Initialize the text controller with the formatted date if a date is selected
    if (_selectedDate != null) {
      _controller.text = _dateFormat.format(_selectedDate!);
    }
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: inputDecoration(
        text: 'Select your birthdate',
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          color: Repository.iconColor(context),
          onPressed: () async {
            // Show the date picker dialog when the calendar icon is pressed
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDate ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            // If a date is picked, update the local state and text controller
            if (pickedDate != null) {
              setState(() {
                _selectedDate = pickedDate;
                _controller.text = _dateFormat.format(_selectedDate!);
              });
            }
          },
        ),
        context: context,
      ),
      keyboardType: TextInputType.datetime,
      onChanged: (value) {
        // Update the selected date based on user input
        try {
          DateTime? parsedDate = _dateFormat.parse(value);
          setState(() {
            _selectedDate = parsedDate;
          });
        } catch (e) {
          // Handle parsing error, if any
          _selectedDate = null;
        }
      },
    );
  }
}
