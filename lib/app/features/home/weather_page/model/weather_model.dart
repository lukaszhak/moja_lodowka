class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.city,
    required this.condition,
  });
  final double temperature;
  final String city;
  final String condition;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : temperature = json['current']['temp_c'] + 0.0,
        city = json['location']['name'],
        condition = json['current']['condition']['text'];
}
