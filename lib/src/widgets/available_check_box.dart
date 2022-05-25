import 'package:flutter/material.dart';

class AvailableCheckBox extends StatefulWidget {
  const AvailableCheckBox({
    Key? key,
    required this.name,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  final String name;
  final bool value;
  final Function(bool?) onChanged;

  @override
  // ignore: library_private_types_in_public_api
  _AvailableCheckBoxState createState() => _AvailableCheckBoxState();
}

class _AvailableCheckBoxState extends State<AvailableCheckBox> {
  late bool checked;

  @override
  void initState() {
    checked = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.name),
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      value: checked,
      onChanged: (bool? value) {
        if (value != null) {
          setState(() {
            checked = value;
            widget.onChanged(value);
          });
        }
      },
    );
  }
}
