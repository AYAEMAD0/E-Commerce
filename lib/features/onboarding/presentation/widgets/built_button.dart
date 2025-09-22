import 'package:flutter/material.dart';
import '../../../../core/theme/styles.dart';

class BuiltButton extends StatelessWidget {
  const BuiltButton({super.key,required this.text,this.alignment=Alignment.bottomRight});
  final String text;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment!,
      child: Text(text, style: TextStyles.font18PrimarySemiBold),
    );
  }
}
