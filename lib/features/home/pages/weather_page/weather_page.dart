import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/weather_page/cubit/weather_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moja_lodowka/features/home/pages/weather_page/widgets/display_weather_widget.dart';
import 'package:moja_lodowka/features/home/pages/weather_page/widgets/search_widget.dart';

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
            body: Center(
              child: Builder(
                builder: (context) {
                  if (state.status == Status.loading) {
                    return Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          opacity: 0.5,
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
                        opacity: 0.5,
                        image: AssetImage('images/weather.jpg'),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (weatherModel != null)
                          DisplayWeatherWidget(
                            weatherModel: weatherModel,
                          ),
                        SearchWidget(),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
