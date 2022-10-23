import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/domain/models/weather_model/weather_model.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_remote_data_source.g.dart';

@injectable 
@RestApi()
abstract class WeatherRemoteRetrofitDataSource {
  @factoryMethod
  factory WeatherRemoteRetrofitDataSource(
    Dio dio,
  ) = _WeatherRemoteRetrofitDataSource;

  @GET(
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/{city}?unitGroup=metric&key=WCPLFA6FEK4E4CY7CCDRVBLAL&contentType=json")
  Future<WeatherModel> getWeatherData(@Path('city') String city);
}
