// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextfieldLogin extends StatefulWidget {
  final String aboveText;
  final String hintText;
  final TextInputType textInputType;
  final ValueChanged onChange;
  const TextfieldLogin({
    super.key,
    required this.aboveText,
    required this.hintText,
    required this.textInputType,
    required this.onChange,
  });

  @override
  State<TextfieldLogin> createState() => _TextfieldLoginState();
}

class _TextfieldLoginState extends State<TextfieldLogin> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          widget.aboveText,
          style: const TextStyle(color: Colors.white),
        ),
        TextField(
          onChanged: widget.onChange,
          controller: _controller,
          decoration: InputDecoration(
              hintText: widget.hintText,
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF9346B7), width: 1)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF9346B7), width: 1))),
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 15 * 4),
        )
      ],
    );
  }
}
