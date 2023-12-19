enum Flavor { debug, release, profile }

BuildFlavor get env => _env;
BuildFlavor _env = BuildFlavor._init(
  flavor: Flavor.debug,
  baseUrl: 'baseUrl',
  appName: 'LoveBox-Dev',
  encKey: '',
  vector: '',
);

class BuildFlavor {
  final String baseUrl;
  final String appName;
  final Flavor flavor;
  final String encKey;
  final String vector;

  BuildFlavor._init({
    required this.flavor,
    required this.baseUrl,
    required this.appName,
    required this.encKey,
    required this.vector,
  });

  static void init({
    required Flavor flavor,
    required String baseUrl,
    required String appName,
    required String encKey,
    required String vector,
  }) =>
      _env = BuildFlavor._init(
        flavor: flavor,
        baseUrl: baseUrl,
        appName: appName,
        encKey: encKey,
        vector: vector,
      );
}