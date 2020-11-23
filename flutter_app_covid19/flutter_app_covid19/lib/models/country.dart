class Country {
  String country;
  int cases;
  int deaths;

  Country({this.country, this.cases, this.deaths});

  Country.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    cases = json['cases'];
    deaths = json['deaths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    return data;
  }
}