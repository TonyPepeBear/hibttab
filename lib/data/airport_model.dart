class AirportModel {
  String id;
  String ident;
  String type;
  String name;
  String lat;
  String lon;
  String ft;
  String country;
  String region;
  String homeLink;
  String wikiLink;

  AirportModel(this.id, this.ident, this.type, this.name, this.lat, this.lon,
      this.ft, this.country, this.region, this.homeLink, this.wikiLink);

  @override
  String toString() {
    return "id: $id, ident:$ident";
  }
}
