import 'package:dio/dio.dart';

class WeatherDataSource {
  Future<Map<String, dynamic>?> getWeatherData({required String city}) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/current.json?key=67f1bdd89b1e487b8b6164908220110&q=$city&aqi=no');
      return response.data;
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Wystąpił błąd');
    }
  }
}
