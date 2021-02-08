class CountryModel {
  final String id;
  final String name;
  final String shortName;
  final String phoneCode;
  CountryModel({
    this.id,
    this.name,
    this.shortName,
    this.phoneCode,
  });
}

class StateModel {
  final String id;
  final String name;
  StateModel({
    this.id,
    this.name,
  });
}

class CityModel {
  final String id;
  final String name;
  CityModel({
    this.id,
    this.name,
  });
}
