import 'package:dio/dio.dart';

class WeatherDataSource {
  Future<Map<String, dynamic>?> getWeatherData({required String city}) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$city?unitGroup=metric&key=WCPLFA6FEK4E4CY7CCDRVBLAL&contentType=json');
      return response.data;
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Wystąpił błąd');
    }
  }
}
