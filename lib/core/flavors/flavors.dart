enum Flavor { dev, prod }

class AppFlavor {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Homekru Owner Dev';
      case Flavor.prod:
        return 'Homekru Owner';
    }
  }
}
