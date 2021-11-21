import 'package:flutter/material.dart';

class WeatherBox extends StatelessWidget {
  final String title;
  final String image;
  final String date;
  final String temp;
  final String location;
  final String time;

  const WeatherBox({
    Key? key,
    required this.title,
    required this.image,
    required this.date,
    required this.temp,
    required this.location,
    required this.time,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        color: Color.fromRGBO(118, 80, 236, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(image),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Text(
                  date,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            temp,
            style: TextStyle(
              color: Colors.white,
              fontSize: 65,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            location + "." + time,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
