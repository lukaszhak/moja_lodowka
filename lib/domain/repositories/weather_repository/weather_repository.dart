

import 'package:moja_lodowka/data/remote_data_sources/weather_remote_data_source/weather_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/weather_model/weather_model.dart';

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
