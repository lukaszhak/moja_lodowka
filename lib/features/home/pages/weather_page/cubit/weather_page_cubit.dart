import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/weather_model/weather_model.dart';
import 'package:moja_lodowka/domain/repositories/weather_repository/weather_repository.dart';

part 'weather_page_state.dart';

class WeatherPageCubit extends Cubit<WeatherPageState> {
  WeatherPageCubit(this._weatherRepository) : super(const WeatherPageState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel({required String city}) async {
    emit(
      const WeatherPageState(status: Status.loading),
    );
    try {
      final weatherModel = await _weatherRepository.getWeatherModel(city: city);
      emit(
        WeatherPageState(model: weatherModel, status: Status.success),
      );
    } catch (error) {
      emit(
        WeatherPageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
