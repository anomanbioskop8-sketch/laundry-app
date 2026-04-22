class AppStatusColorScheme {
  static AppStatusColors light(ColorScheme scheme) {
    return AppStatusColors(
      success: Colors.green,
      warning: Colors.orange,
      error: scheme.error,
      info: Colors.blue,

      pending: Colors.orange,
      process: Colors.blue,
      done: Colors.green,
      cancel: Colors.red,
    );
  }

  static AppStatusColors dark(ColorScheme scheme) {
    return AppStatusColors(
      success: Colors.greenAccent,
      warning: Colors.orangeAccent,
      error: scheme.error,
      info: Colors.lightBlueAccent,

      pending: Colors.orangeAccent,
      process: Colors.lightBlueAccent,
      done: Colors.greenAccent,
      cancel: Colors.redAccent,
    );
  }
}
