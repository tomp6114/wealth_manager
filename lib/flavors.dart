enum Flavor { dev, prod }

class F {
  static late Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Wealth Dev';
      case Flavor.prod:
        return 'Wealth Manager';
    }
  }
}
