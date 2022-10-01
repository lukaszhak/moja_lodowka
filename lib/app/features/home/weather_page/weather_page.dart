import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sprawdź dzisiejszą pogodę'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _DisplayWeatherWidget(),
          _SearchWidget(),
          SizedBox(
            height: 120,
          ),
        ],
      )),
    );
  }
}

class _DisplayWeatherWidget extends StatelessWidget {
  const _DisplayWeatherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Myszkow',
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          '5.5',
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'Rainy',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: 100,
        ),
      ],
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
                  hintText: 'Miasto',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Sprawdź'))
        ],
      ),
    );
  }
}
