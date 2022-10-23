

import 'package:moja_lodowka/data/remote_data_sources/weather_remote_data_source/weather_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/weather_model/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherDataSource);
  final WeatherRemoteRetrofitDataSource _weatherDataSource;

  Future<WeatherModel?> getWeatherModel({required String city}) async {
    return _weatherDataSource.getWeatherData(city);
  }
}
