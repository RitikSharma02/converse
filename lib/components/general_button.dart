import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    required this.onPressed,
    required this.text,
    required this.color,
    super.key,
  });

  final Color color;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Material(
        elevation: 5.0,
        // const Color(0xFF332EE2)
        color: color,
        borderRadius: BorderRadius.circular(14.0),
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          minWidth: 200.0,
          height: 58.0,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
      ),
    );
  }
}
