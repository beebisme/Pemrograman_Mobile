import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final GestureTapCallback onPressed;

  const PrimaryButton(
    this.buttonText, {
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: 50,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: HexColor("000000"),
            backgroundColor: HexColor("#ffffff"),
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
