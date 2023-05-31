import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/weather_model/weather_model.dart';
import 'package:moja_lodowka/domain/repositories/weather_repository/weather_repository.dart';
import 'package:moja_lodowka/features/home/pages/weather_page/cubit/weather_page_cubit.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late WeatherPageCubit sut;
  late MockWeatherRepository repository;

  setUp(() {
    repository = MockWeatherRepository();
    sut = WeatherPageCubit(repository);
  });

  group('getWeatherModel', () {
    group('success', () {
      setUp(() {
        when(() => repository.getWeatherModel(city: 'city1')).thenAnswer(
            (_) async => const WeatherModel(
                temperature: 10, city: 'city1', condition: 'condition1'));
      });

      blocTest<WeatherPageCubit, WeatherPageState>(
          'emits Status.loading then Status.success with results',
          build: () => sut,
          act: (cubit) => cubit.getWeatherModel(city: 'city1'),
          expect: () => [
                WeatherPageState(status: Status.loading),
                WeatherPageState(
                  status: Status.success,
                  model: const WeatherModel(
                      temperature: 10, city: 'city1', condition: 'condition1'),
                ),
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getWeatherModel(city: 'city1'))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<WeatherPageCubit, WeatherPageState>(
          'emits Status.loading then Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.getWeatherModel(city: 'city1'),
          expect: () => [
                WeatherPageState(status: Status.loading),
                WeatherPageState(
                    status: Status.error,
                    errorMessage: 'Exception: test-exception-error')
              ]);
    });
  });
}
