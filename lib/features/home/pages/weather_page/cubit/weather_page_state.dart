part of 'weather_page_cubit.dart';

@freezed
class WeatherPageState with _$WeatherPageState {
  factory WeatherPageState({
    WeatherModel? model,
    required Status status,
    String? errorMessage,
  }) = _WeatherPageState;
}
