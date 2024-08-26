/// This file contains the configuration settings for different environments.
///
/// The [Environments] class defines constants for different environment names such as 'prod', 'stage', and 'local'.
///
class Environments {
  static const String stage = 'stage'; // Keeping only 'stage' for reference
}

/// The [ConfigEnvironments] class provides methods to retrieve the current environment URL.
/// It no longer switches between different environments and always returns the same URL.
///
class ConfigEnvironments {
  // Current environment is set to 'stage', but we can simplify as we're using only one URL

  // Single URL for the 'stage' environment
  static const String _url = 'https://org404040.stage.brexa.ai/';

  static String get getEnvironmentUrl {
    return _url;
  }
}
