

import 'package:moja_lodowka/app/features/home/pages/weather_page/data_source/weather_data_source.dart';
import 'package:moja_lodowka/app/features/home/pages/weather_page/model/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherDataSource);
  final WeatherDataSource _weatherDataSource;

  Future<WeatherModel?> getWeatherModel({required String city}) async {
    final json = await _weatherDataSource.getWeatherData(city: city);

    if (json == null) {
      return null;
    }

    return WeatherModel.fromJson(json);
  }
}
