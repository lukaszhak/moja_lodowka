import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/domain/models/weather_model/weather_model.dart';
import 'package:moja_lodowka/features/home/pages/weather_page/cubit/weather_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplayWeatherWidget extends StatelessWidget {
  const DisplayWeatherWidget({
    required this.weatherModel,
    Key? key,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherPageCubit, WeatherPageState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  weatherModel.city,
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppLocalizations.of(context)!.temp,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${weatherModel.temperature} °C',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
