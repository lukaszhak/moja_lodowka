import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/domain/models/weather_model/weather_model.dart';
import 'package:moja_lodowka/features/home/pages/weather_page/cubit/weather_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeatherPageCubit>(),
      child: BlocConsumer<WeatherPageCubit, WeatherPageState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ??
                AppLocalizations.of(context)!.errorOccurred;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final weatherModel = state.model;
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 50,
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              title: Text(AppLocalizations.of(context)!.checkWeather),
            ),
            body: Center(child: Builder(builder: (context) {
              if (state.status == Status.loading) {
                return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.6,
                      image: AssetImage('images/weather.jpg'),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.loading,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    opacity: 0.6,
                    image: AssetImage('images/weather.jpg'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (weatherModel != null)
                      _DisplayWeatherWidget(
                        weatherModel: weatherModel,
                      ),
                    _SearchWidget(),
                  ],
                ),
              );
            })),
          );
        },
      ),
    );
  }
}

class _DisplayWeatherWidget extends StatelessWidget {
  const _DisplayWeatherWidget({
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
                Row(
                  children: [
                    Text(
                      weatherModel.temperature.toString(),
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
                      '°C',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
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

class _SearchWidget extends StatelessWidget {
  _SearchWidget({
    Key? key,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.city,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              ),
              onPressed: () {
                context
                    .read<WeatherPageCubit>()
                    .getWeatherModel(city: _controller.text);
              },
              child: Text(AppLocalizations.of(context)!.check))
        ],
      ),
    );
  }
}
