import 'package:flutter/material.dart';

class TodayWeatherBox extends StatelessWidget {
  final String temp;
  final IconData icon;
  final String time;

  const TodayWeatherBox(
      {Key? key, required this.temp, required this.icon, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(color: Color.fromRGBO(118, 89, 237, 1), width: 0.5)),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(temp),
            Icon(
              icon,
              color: Colors.red,
            ),
            SizedBox(height: 2),
            Text(time),
          ]),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(temp),
            Icon(
              icon,
              color: Colors.red,
            ),
            SizedBox(height: 2),
            Text(time),
          ]),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(temp),
            Icon(
              icon,
              color: Colors.red,
            ),
            SizedBox(height: 2),
            Text(time),
          ]),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(temp),
            Icon(
              icon,
              color: Colors.red,
            ),
            SizedBox(height: 2),
            Text(time),
          ]),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(temp),
            Icon(
              icon,
              color: Colors.red,
            ),
            SizedBox(height: 2),
            Text(time),
          ]),
        ],
      ),
    );
  }
}
