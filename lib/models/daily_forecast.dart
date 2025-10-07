class DailyForecast {
  final String description;
  final int highTemp;
  final int lowTemp;
  final int day; 
  final String weekday; 

  DailyForecast({
    required this.description,
    required this.highTemp,
    required this.lowTemp,
    required this.day,
    required this.weekday, 
  });

  String getDate(int currentDay) {
    return day.toString(); 
  }

  String getWeekday(int currentWeekday) {
    return weekday; 
  }
}