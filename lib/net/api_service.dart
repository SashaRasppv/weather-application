import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_application/models/weather_models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // For URI: api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
      'units': 'imperial'
    };

    try {
      final uri = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameters);

      final response = await http.get(uri);

      print(response.body);
      final json = jsonDecode(response.body);
      return WeatherResponse.fromJson(json);
    } catch (e) {
      return WeatherResponse(
          cityName: 'Not exist CIty',
          tempInfo: TemperatureInfo(temperature: 0.0),
          weatherInfo: WeatherInfo(description: ''));
    }
  }
}
