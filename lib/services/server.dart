import 'package:horizons_weather/models/daily_forecast.dart';

class Server {
  static List<DailyForecast> getDailyForecastList() {
    final DateTime now = DateTime.now();
    final List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final List<String> descriptions = [
      'Partly cloudy in the morning, with sun appearing in the afternoon.',
      'Partly sunny.',
      'Chance of rain throughout the day.',
      'Mostly clear with a cool breeze.',
      'Sunny and warm.',
      'Overcast with light showers.',
      'Cloudy with a chance of thunderstorms.',
    ];

    return List.generate(7, (index) {
      final DateTime forecastDate = now.add(Duration(days: index));
      return DailyForecast(
        description: descriptions[index % descriptions.length], 
        highTemp: 70 + index,
        lowTemp: 50 + index,
        day: forecastDate.day, 
        weekday: weekdays[forecastDate.weekday - 1],
      );
    });
  }

  static Future<void> getMore() async {
    await Future.delayed(const Duration(seconds: 2));
    print('More data loaded!');
  }
}