import 'package:flutter/material.dart';
import 'package:horizons_weather/widgets/weekly_forecast_list.dart';
import 'package:horizons_weather/services/server.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            stretch: true,
            onStretchTrigger: () async {
              print('Load more data!');
              await Server.getMore();
            },
            backgroundColor: Colors.teal[800],
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              title: const Text('Horizons'),
              background: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: <Color>[
                      Colors.teal[800]!,
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Image.network(
                  'https://picsum.photos/id/1043/800/400', 
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.red, 
                      alignment: Alignment.center,
                      child: const Text(
                        'Error al cargar imagen',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const WeeklyForecastList(),
        ],
      ),
    );
  }
}