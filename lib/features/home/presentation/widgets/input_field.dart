import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.widget,
      this.txtController})
      : super(key: key);
  final String title;
  final String hint;
  Widget? widget;
  TextEditingController? txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextFormField(
          textAlignVertical: TextAlignVertical.top,
          controller: txtController,
          autofocus: widget == null ? false : true,
          readOnly: widget == null ? false : true,
          decoration: InputDecoration(
            contentPadding: widget == null
                ? const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                : const EdgeInsets.fromLTRB(10, 0, 10, 0),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            suffix: widget,
          ),
        )
      ],
    );
  }
}
