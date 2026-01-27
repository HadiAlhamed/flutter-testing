class TimeHelper {
  static String getTimeOfTheDay({DateTime? datetime}) {
    final now = datetime ?? DateTime.now().toLocal();
    if (now.hour >= 0 && now.hour < 6) {
      return "Night";
    } else if (now.hour >= 6 && now.hour < 12) {
      return "Morning";
    } else if (now.hour >= 12 && now.hour < 18) {
      return "Afternoon";
    } else {
      return "Evening";
    }
  }
}
