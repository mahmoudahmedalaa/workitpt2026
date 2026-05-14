class AddressComponent {
  String? name;
  String? shortName;

  AddressComponent({this.name, this.shortName});

  static AddressComponent fromJson(json) =>
      AddressComponent(name: json['long_name'], shortName: json['short_name']);
}
