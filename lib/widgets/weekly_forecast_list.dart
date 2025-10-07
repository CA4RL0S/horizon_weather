import 'package:flutter/material.dart';
import 'package:horizons_weather/models/daily_forecast.dart';
import 'package:horizons_weather/services/server.dart';

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now(); 
    final TextTheme textTheme = Theme.of(context).textTheme;
    final List<DailyForecast> forecasts = Server.getDailyForecastList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final DailyForecast dailyForecast = forecasts[index];
          final String imageUrl = 'https://picsum.photos/id/${1000 + index}/60/90';

          return Card(
            margin: const EdgeInsets.all(8.0),
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(color: Colors.grey, child: Icon(Icons.broken_image));
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          dailyForecast.getDate(currentDate.day).toString(), 
                          style: textTheme.headlineLarge?.copyWith(color: Colors.white, shadows: [
                            Shadow(
                              blurRadius: 3.0,
                              color: Colors.black.withOpacity(0.7),
                              offset: Offset(1.0, 1.0),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      dailyForecast.getWeekday(currentDate.weekday), 
                      style: textTheme.headlineSmall,
                    ),
                    subtitle: Text(dailyForecast.description), 
                    trailing: Text(
                      '${dailyForecast.highTemp}°F | ${dailyForecast.lowTemp}°F',
                      style: textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: forecasts.length,
      ),
    );
  }
}