import 'package:flutter/material.dart';

class TextfieldLogin extends StatefulWidget {
  final String aboveText;
  final String hintText;
  final TextInputType textInputType;
  final ValueChanged<String> onChange;
  final bool obscureText;
  final bool isPassword;
  final String initailValue;
  const TextfieldLogin({
    super.key,
    required this.aboveText,
    required this.hintText,
    required this.textInputType,
    required this.onChange,
    this.obscureText = false,
    this.isPassword = false,
    required this.initailValue,
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
  void initState() {
    super.initState();
    _controller.text = widget.initailValue;
  }

  bool _obscureText = false;

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
          obscureText: _obscureText,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
              hintText: widget.hintText,
              filled: true,
              fillColor: Colors.white,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      child: _obscureText
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Color.fromRGBO(225, 25, 109, 1),
                            ),
                    )
                  : null,
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
