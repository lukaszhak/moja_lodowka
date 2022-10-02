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
              title: const Text('Sprawdź dzisiejszą pogodę'),
            ),
            body: Center(child: Builder(builder: (context) {
              if (state.status == Status.loading) {
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Ładowanie, proszę czekać'),
                    ],
                  ),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (weatherModel != null)
                    _DisplayWeatherWidget(
                      weatherModel: weatherModel,
                    ),
                  _SearchWidget(),
                  const SizedBox(
                    height: 120,
                  ),
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
            Text(
              weatherModel.city,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              weatherModel.temperature.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              weatherModel.condition,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 100,
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
              onPressed: () {
                context.read<WeatherPageCubit>().getWeatherModel(city: _controller.text);
              },
              child: const Text('Sprawdź'))
        ],
      ),
    );
  }
}
