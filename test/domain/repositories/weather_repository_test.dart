import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_lodowka/data/remote_data_sources/weather_remote_data_source/weather_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/weather_model/weather_model.dart';
import 'package:moja_lodowka/domain/repositories/weather_repository/weather_repository.dart';

class MockWeatherDataSource extends Mock
    implements WeatherRemoteRetrofitDataSource {}

void main() {
  late WeatherRepository sut;
  late MockWeatherDataSource dataSource;

  setUp(() {
    dataSource = MockWeatherDataSource();
    sut = WeatherRepository(dataSource);
  });

  group('getWeatherModel', () {
    test('should call dataSource.getWeatherData() method', () async {
      // 1
      when(() => dataSource.getWeatherData('city')).thenAnswer((_) async =>
          const WeatherModel(
              temperature: 10, city: 'city', condition: 'condition'));
      // 2
      await sut.getWeatherModel(city: 'city');
      // 3
      verify(() => dataSource.getWeatherData('city')).called(1);
    });

    test('should get weather data for specified city', () async {
      // 1
      when(() => dataSource.getWeatherData('city')).thenAnswer((_) async =>
          const WeatherModel(
              temperature: 10, city: 'city', condition: 'condition'));
      // 2
      final results = await sut.getWeatherModel(city: 'city');
      // 3
      expect(
          results,
          const WeatherModel(
              temperature: 10, city: 'city', condition: 'condition'));
    });
  });
}
