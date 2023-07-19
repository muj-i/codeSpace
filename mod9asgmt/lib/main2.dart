import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String _location = '';
  String _temperature = '';
  String _weatherDescription = '';
  String _weatherImage = '';
  bool _isLoading = false;
  bool _hasError = false;
  List<Map<String, String>> _recentSearches = [];

  bool isNight(DateTime sunrise, DateTime sunset) {
    final now = DateTime.now();
    return now.isBefore(sunrise) || now.isAfter(sunset);
  }

  BoxDecoration getBackgroundDecoration(bool isNight) {
    if (isNight) {
      return BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/night.png'), // Set your desired night background image
          fit: BoxFit.cover,
        ),
      );
    } else {
      return BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/day_background.png'), // Set your desired day background image
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Future<DateTime> fetchSunrise(String latitude, String longitude) async {
    final response = await http.get(Uri.parse(
        'https://api.sunrise-sunset.org/json?lat=$latitude&lng=$longitude&date=today'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];
      final sunriseString = results['sunrise'];
      final sunsetString = results['sunset'];

      return DateTime.parse(sunriseString).toLocal();
    } else {
      throw Exception('Failed to fetch sunrise time');
    }
  }

  Future<DateTime> fetchSunset(String latitude, String longitude) async {
    final response = await http.get(Uri.parse(
        'https://api.sunrise-sunset.org/json?lat=$latitude&lng=$longitude&date=today'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];
      final sunsetString = results['sunset'];

      return DateTime.parse(sunsetString).toLocal();
    } else {
      throw Exception('Failed to fetch sunset time');
    }
  }

  Future<bool> isLocationNight(String latitude, String longitude) async {
    final sunrise = await fetchSunrise(latitude, longitude);
    final sunset = await fetchSunset(latitude, longitude);

    return isNight(sunrise, sunset);
  }

  void fetchWeatherData(String location) async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final apiKey = 'b56885ee979cee677331c9f68db18319';
      final apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final main = data['main'];
        final weather = data['weather'][0];
        final coord = data['coord'];
        final latitude = coord['lat'].toString();
        final longitude = coord['lon'].toString();

        final isNight = await isLocationNight(latitude, longitude);

        setState(() {
          _location = data['name'];
          _temperature = (main['temp']).toStringAsFixed(1);
          _weatherDescription = weather['description'];
          _weatherImage = weather['icon'];
          _isLoading = false;

          _recentSearches.add({
            'location': _location,
            'temperature': _temperature,
            'weatherImage': _weatherImage,
            'isNight': isNight.toString(),
          });
        });
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  Widget buildRecentSearches() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
      ),
      itemCount: _recentSearches.length,
      itemBuilder: (context, index) {
        final searchResult = _recentSearches[index];
        final location = searchResult['location'];
        final temperature = searchResult['temperature'];
        final weatherImage = searchResult['weatherImage'];
        final isNight = searchResult['isNight'] == 'true';

        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(location!),
              SizedBox(height: 8.0),
              Image.network(
                'https://openweathermap.org/img/w/$weatherImage.png',
                width: 50.0,
                height: 50.0,
              ),
              SizedBox(height: 8.0),
              Text('$temperature°C'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Container(
          decoration: getBackgroundDecoration(_location.isNotEmpty && _recentSearches.isNotEmpty
              ? _recentSearches.last['isNight'] == 'true'
              : false),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter a location',
                  ),
                  onSubmitted: (value) {
                    fetchWeatherData(value);
                  },
                ),
                SizedBox(height: 16.0),
                if (_isLoading)
                  CircularProgressIndicator()
                else if (_hasError)
                  Text('Failed to fetch weather data.')
                else if (_location.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        _location,
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(height: 16.0),
                      Image.network(
                        'https://openweathermap.org/img/w/$_weatherImage.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Temperature: $_temperature°C',
                       style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Weather: $_weatherDescription',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                SizedBox(height: 16.0),
                Text(
                  'Recent Searches',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: buildRecentSearches(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
