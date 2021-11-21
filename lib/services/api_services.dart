import 'dart:convert';

import 'package:clearsky/models/weathAlt.dart';

import 'package:http/http.dart' as http;

// var apiLink =
//     "https://api.openweathermap.org/data/2.5/weather?q=lagos&appid=562a8b29fb29577b6047a1eee7b5d660";

class WeatherApi {
  Future<WeatherAlt> getCurrentWeather(String city) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=562a8b29fb29577b6047a1eee7b5d660");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    WeatherAlt weatherBody = WeatherAlt.fromJson(body);
    print(weatherBody.main.temp);
    return weatherBody;
  }
}
