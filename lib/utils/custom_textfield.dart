import 'package:flutter/material.dart';
import 'package:market_stock/exports.dart';

class CustomTextField extends StatelessWidget {
  Icon? icon;
  TextInputType? textInputType;
  TextInputType? keyboardType;
  String labelText;
  EdgeInsetsGeometry? contentPadding;
  final TextEditingController textController;
  final bool autoFocus;
  // FormFieldValidator<String>? validate;
  String? Function(String?)? validate;
  bool isPassword;
  String? hintText;
  Widget? suffixIcon;
  final bool obscureText;
  final TextInputAction textInputAction;
  int? maxLines;
  double? minLines;
  double? height;
  FocusNode? onFocus;
  FormFieldSetter<String>? onSaved;
  FormFieldSetter<String>? onChanged;
  ValueChanged<String>? onFieldSubmitted;
  List<TextInputFormatter>? inputFormatters;
  TextCapitalization? capitalization;

  CustomTextField(
      {Key? key,
      this.icon,
      this.onFocus,
      this.isPassword = false,
      this.onFieldSubmitted,
      this.contentPadding,
      this.textInputType,
      this.labelText = '',
      this.capitalization = TextCapitalization.words,
      required this.textController,
      required this.autoFocus,
      this.validate,
      this.onSaved,
      this.onChanged,
      this.maxLines,
      this.minLines,
      this.height,
      this.hintText,
      this.suffixIcon,
      this.keyboardType,
      this.inputFormatters,
      this.obscureText = false,
      required this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(text: labelText),
          8.vSpace,
          Center(
            child: Expanded(
              child: SizedBox(
                // height: 52,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  maxLines: obscureText == true ? 1 : maxLines,
                  controller: textController,
                  textCapitalization: capitalization!,
                  validator: validate,
                  onSaved: onSaved,
                  onChanged: onChanged,
                  cursorColor: Colors.white,
                  textInputAction: textInputAction,
                  inputFormatters: inputFormatters,
                  keyboardType: textInputType,
                  obscureText: obscureText,
                  focusNode: onFocus,
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                          // fontSize: 0,
                          //   color: Colors.transparent,
                          height: 0.7),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 16),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.9),
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.9),
                          borderRadius: BorderRadius.circular(12)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(width: 0.9),
                      ),
                      filled: true,
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        height: 1,
                        color: Colors.grey,
                      ),
                      fillColor: Colors.white.withOpacity(0.0),
                      suffixIcon: suffixIcon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
