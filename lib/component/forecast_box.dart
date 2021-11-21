import 'package:flutter/material.dart';

class Forecast extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color textColor;
  final Color iconColor;

  const Forecast({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.textColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
        Icon(
          icon,
          color: iconColor,
        )
      ]),
    );
  }
}
