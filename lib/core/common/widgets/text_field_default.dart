import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod_best_practices/core/constants/app_colors.dart';
import 'package:flutter_riverpod_best_practices/core/constants/app_text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TextFieldDefault extends HookConsumerWidget {
  final GlobalKey? formKey;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? hint;
  final Function(String? text)? onChanged;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const TextFieldDefault({
    super.key,
    this.formKey,
    this.focusNode,
    this.controller,
    this.hint,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscure = useState(true);
    return TextFormField(
      key: formKey,
      focusNode: focusNode,
      controller: controller,
      validator: validator,

      obscureText:
          keyboardType != null &&
          keyboardType == TextInputType.visiblePassword &&
          isObscure.value,
      style: AppTextStyles.hintTS.copyWith(color: AppColors.textColor),
      onChanged: (text) => onChanged,
      keyboardType: keyboardType,
      minLines:
          keyboardType != null && keyboardType == TextInputType.multiline
              ? null
              : 1,
      maxLines:
          keyboardType != null && keyboardType == TextInputType.multiline
              ? null
              : 1,
      textInputAction:
          keyboardType != null && keyboardType == TextInputType.multiline
              ? TextInputAction.newline
              : TextInputAction.next,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.hintTS,

        prefixIcon:
            prefixIcon == null
                ? null
                : Icon(prefixIcon, color: AppColors.activeIconColor, size: 24),

        suffixIcon:
            keyboardType != null &&
                    keyboardType == TextInputType.visiblePassword
                ? IconButton(
                  icon: Icon(
                    isObscure.value ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    isObscure.value = !isObscure.value;
                  },
                )
                : null,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.border, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.border, width: 1),
        ),
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
