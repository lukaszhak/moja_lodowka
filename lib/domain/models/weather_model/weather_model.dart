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
      : temperature = json['days'][0]['temp'] + 0.0,
        city = json['address'],
        condition = json['days'][0]['conditions'];
}
