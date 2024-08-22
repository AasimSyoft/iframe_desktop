import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.textEditingController,
    this.hintText = '',
    this.prefixIcon,
    this.prefix,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isReadOnly = false,
    this.inputFormatter,
    this.maxLength,
    this.maxLine,
    this.minLines = 1,
    this.onTap,
    this.label,
  });

  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final List<TextInputFormatter>? inputFormatter;
  final bool isReadOnly;
  final TextInputType keyboardType;
  final String? label;
  final int? maxLength;
  final int? maxLine;
  final int minLines;
  final VoidCallback? onTap;
  final Widget? prefix;
  final IconData? prefixIcon;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: textEditingController,
        maxLines: maxLine,
        minLines: minLines,
        keyboardType: keyboardType,
        readOnly: isReadOnly,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        inputFormatters: inputFormatter,
        maxLength: maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          suffixIcon: prefixIcon != null ? Icon(prefixIcon, size: 16) : null,
          counter: const SizedBox.shrink(),
          prefixIcon: prefix,
        ),
      ),
    );
  }
}
