import 'dart:convert';

import 'package:http/http.dart' as http;
import 'weather_model.dart';

class weatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=b56885ee979cee677331c9f68db18319&units=metric');
    var body = jsonDecode((await http.get(endpoint)).body);
print(Weather.fromJson(body).cityName); 
return Weather.fromJson(body);  }
}
