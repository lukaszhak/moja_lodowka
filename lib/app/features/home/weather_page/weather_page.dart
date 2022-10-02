import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/features/home/weather_page/cubit/weather_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/weather_page/data_source/weather_data_source.dart';
import 'package:moja_lodowka/app/features/home/weather_page/model/weather_model.dart';
import 'package:moja_lodowka/app/features/home/weather_page/repository/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherPageCubit(WeatherRepository(WeatherDataSource())),
      child: BlocConsumer<WeatherPageCubit, WeatherPageState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Wystąpił błąd';
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
              backgroundColor: const Color.fromARGB(255, 0, 54, 58),
              title: const Text('Sprawdź dzisiejszą pogodę'),
            ),
            body: Center(child: Builder(builder: (context) {
              if (state.status == Status.loading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Ładowanie, proszę czekać'),
                    ],
                  ),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (weatherModel != null)
                    _DisplayWeatherWidget(
                      weatherModel: weatherModel,
                    ),
                  _SearchWidget(),
                ],
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Wybrane Miasto:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  weatherModel.city,
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Temperatura:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(weatherModel.temperature.toString(),
                        style: const TextStyle(fontSize: 22)),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '°C',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Warunki pogodowe:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  weatherModel.condition,
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
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
              decoration: const InputDecoration(
                  hintText: 'Miasto',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 0, 54, 58),
              ),
              onPressed: () {
                context
                    .read<WeatherPageCubit>()
                    .getWeatherModel(city: _controller.text);
              },
              child: const Text('Sprawdź'))
        ],
      ),
    );
  }
}
