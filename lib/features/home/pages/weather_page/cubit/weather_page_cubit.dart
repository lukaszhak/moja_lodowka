import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/weather_model/weather_model.dart';
import 'package:moja_lodowka/domain/repositories/weather_repository/weather_repository.dart';

part 'weather_page_state.dart';
part 'weather_page_cubit.freezed.dart';

@injectable
class WeatherPageCubit extends Cubit<WeatherPageState> {
  WeatherPageCubit(this._weatherRepository)
      : super(WeatherPageState(
          status: Status.initial,
        ));

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel({required String city}) async {
    emit(
      WeatherPageState(
        status: Status.loading,
      ),
    );
    try {
      final weatherModel = await _weatherRepository.getWeatherModel(city: city);
      emit(
        WeatherPageState(
          model: weatherModel,
          status: Status.success,
        ),
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
