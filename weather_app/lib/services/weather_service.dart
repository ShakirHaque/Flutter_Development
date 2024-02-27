import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;
  WeatherService(this.apiKey);
  Future<Weather> getWeather(String cityName)async {
    final response = await http.get(Uri.parse('url'))
  }
}
