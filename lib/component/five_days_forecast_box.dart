import 'package:flutter/material.dart';

class NewForecastBox extends StatelessWidget {
  final String date;
  final String temp;
  final IconData icon;

  const NewForecastBox({
    Key? key,
    required this.date,
    required this.temp,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromRGBO(118, 89, 237, 1), width: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                date,
                style: TextStyle(),
              ),
              Icon(
                icon,
                color: Colors.red,
              ),
              Text(temp),
            ],
          ),
          Divider(
            color: Color.fromRGBO(
              118,
              89,
              237,
              1,
            ),
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                date,
                style: TextStyle(),
              ),
              Icon(
                icon,
                color: Colors.red,
              ),
              Text(temp),
            ],
          ),
          Divider(
            color: Color.fromRGBO(
              118,
              89,
              237,
              1,
            ),
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                date,
                style: TextStyle(),
              ),
              Icon(
                icon,
                color: Colors.red,
              ),
              Text(temp),
            ],
          ),
          Divider(
            color: Color.fromRGBO(
              118,
              89,
              237,
              1,
            ),
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                date,
                style: TextStyle(),
              ),
              Icon(
                icon,
                color: Colors.red,
              ),
              Text(temp),
            ],
          ),
          Divider(
            color: Color.fromRGBO(
              118,
              89,
              237,
              1,
            ),
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                date,
                style: TextStyle(),
              ),
              Icon(
                icon,
                color: Colors.red,
              ),
              Text(temp),
            ],
          ),
        ],
      ),
    );
  }
}
