import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textcolor;
  final String buttonText;
  final buttonTapped;
  const MyButton({
    super.key,
    required this.color,
    required this.textcolor,
    required this.buttonText,
    this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 100.0,
            margin: const EdgeInsets.only(bottom: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade700,
                  offset: const Offset(30.0, 30.0),
                  blurRadius: 40.0,
                )
              ],
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textcolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
