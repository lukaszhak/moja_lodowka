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
                  AppLocalizations.of(context)!.selectedCity,
                  style: const TextStyle(fontSize: 22),
                ),
                Text(
                  weatherModel.city,
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppLocalizations.of(context)!.temp,
                  style: const TextStyle(fontSize: 22),
                ),
                Text(
                  '${weatherModel.temperature} °C',
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.conditions,
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Flexible(
                    child: Text(
                      weatherModel.condition,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}