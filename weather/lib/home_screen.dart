import 'package:flutter/material.dart';
import 'package:weather/cureent_weather.dart';
import 'package:weather/weather_api_client.dart';
import 'package:weather/weather_model.dart';

class CurrentWeatherHomeScreen extends StatefulWidget {
  const CurrentWeatherHomeScreen({super.key});

  @override
  State<CurrentWeatherHomeScreen> createState() =>
      _CurrentWeatherHomeScreenState();
}

class _CurrentWeatherHomeScreenState extends State<CurrentWeatherHomeScreen> {
  weatherApiClient client = weatherApiClient();
  Weather data = Weather();
 

  Future<void> getData() async {
    data = (await client.getCurrentWeather('Khulna'))!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf9f9f9),
        appBar: AppBar(
          backgroundColor: Color(0xFFf9f9f9),
          elevation: 0,
          title: Text(
            'Weather',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  currentWeather(Icons.wb_sunny_rounded, "${data.temp}",
                      "${data.cityName}"),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Additional Information',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              throw Exception('Failed to fetch weather data');
            }

            // return Container();
          },
        ));
  }
}
