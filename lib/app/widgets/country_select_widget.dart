import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/utils/repository.dart';

class CountrySelectWidget extends StatefulWidget {
  final ValueChanged<String> onCountrySelected;

  const CountrySelectWidget({super.key, required this.onCountrySelected});

  @override
  _CountrySelectWidgetState createState() => _CountrySelectWidgetState();
}

class _CountrySelectWidgetState extends State<CountrySelectWidget> {
  String? selectedCountry;
  final List<String> countries = [
    'Germany',
    'France',
    'Italy',
    'United States',
    'Canada',
    'Belgium',
    'Spain',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCountry,
      hint: Text(
        'Select your country',
        style: TextStyle(color: Repository.hintColor(context)),
      ),
      icon: Icon(Icons.keyboard_arrow_down_rounded,
          color: Repository.iconColor(context)),
      decoration: InputDecoration(
        prefixIcon:
            Icon(Icons.public_sharp, color: Repository.iconColor(context)),
        filled: true,
        fillColor: Repository.fieldColor(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      items: countries.map((country) {
        return DropdownMenuItem<String>(
          value: country,
          child: Text(country),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCountry = value;
          widget.onCountrySelected(selectedCountry!);
        });
      },
    );
  }
}
