import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key, required this.name, required this.onChanged, required this.validator}) : super(key: key);

  final String name;
  final Function(DateTime) onChanged;
  final String? Function(String? value)? validator;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        readOnly: true,
        enabled: true,
        validator: widget.validator,
        decoration: inputDecoration(),
        controller: dateController,
        onTap: () {
          _pickDate(context);
        },
      ),
    );
  }

  void _pickDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now().add(const Duration(days: 30)))
        .then((DateTime? pickedDate) {
      if (pickedDate != null) {
        setState(() {
          dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
          widget.onChanged(pickedDate);
        });
      }
    });
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      labelText: widget.name,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.blueAccent,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.lightBlue,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.blueAccent,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
