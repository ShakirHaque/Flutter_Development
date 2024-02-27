import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

void main() async {
  await dotenv.load();
  runApp(MyApp());
}

class Weather {
  final String city;
  final String description;
  final double temperature;

  Weather({required this.city, required this.description, required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'].toDouble(),
    );
  }
}

class WeatherService {
  final String apiKey = dotenv.env['API_KEY'] ?? ""; // Load API key from .env

  Future<Weather> getWeather(String city) async {
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

class MyApp extends StatelessWidget {
  final WeatherService weatherService = WeatherService();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: cityController,
                decoration: InputDecoration(labelText: 'Enter City'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  Weather weather = await weatherService.getWeather(cityController.text);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Weather in ${weather.city}'),
                        content: Text(
                            'Description: ${weather.description}\nTemperature: ${weather.temperature}°C'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Get Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
