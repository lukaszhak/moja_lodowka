part of 'weather_page_cubit.dart';

@immutable
class WeatherPageState {
  const WeatherPageState({
    this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final WeatherModel? model;
  final Status status;
  final String? errorMessage;
}
