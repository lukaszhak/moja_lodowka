import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/features/home/weather_page/model/weather_model.dart';
import 'package:moja_lodowka/app/features/home/weather_page/repository/weather_repository.dart';

part 'weather_page_state.dart';

class WeatherPageCubit extends Cubit<WeatherPageState> {
  WeatherPageCubit(this._weatherRepository) : super(WeatherPageState());

  final WeatherRepository _weatherRepository;
}
