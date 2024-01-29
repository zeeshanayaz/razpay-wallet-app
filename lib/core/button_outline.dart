import 'package:flutter/material.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/utils/device.dart';

class CustomButtonOut extends StatelessWidget {
  final String? text;
  final Widget? child;
  final double? hPadding;
  final double? vPadding;
  final double? size;
  final double? borderRadius;
  final Color? bgColor;
  final Color? textColor;
  final Function() onPressed;

  const CustomButtonOut({
    Key? key,
    this.text,
    this.child,
    this.hPadding,
    this.vPadding,
    this.size,
    this.borderRadius,
    this.bgColor,
    this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size ?? width(context),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: hPadding ?? 10,
          vertical: vPadding ?? 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 15)),
          border: Border.all(
            color: bgColor ?? primary,
            width: 1.5,
          ),
        ),
        child: Center(
          child: child ??
              Text(
                text ?? 'Click Here',
                textAlign: TextAlign.center,
                style: textStyle16.copyWith(
                  color: textColor ?? primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
        ),
      ),
    );
  }
}
