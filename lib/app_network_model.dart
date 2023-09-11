class NetworkModel {
  String? abbreviation;
  String? client_ip;
  String? datetime;
  int? day_of_week;
  int? day_of_year;
  bool? dst;
  int? raw_offset;
  String? timezone;
  int? unixtime;
  String? utc_datetime;
  String? utc_offset;
  int? week_number;

  NetworkModel({this.abbreviation,
      this.client_ip,
      this.datetime,
      this.day_of_week,
      this.day_of_year,
      this.dst,
      this.raw_offset,
      this.timezone,
      this.unixtime,
      this.utc_datetime,
      this.utc_offset,
      this.week_number});

  factory NetworkModel.fromJson(Map<String, dynamic> json) => NetworkModel(
    abbreviation: json['abbreviation'],
    client_ip: json['client_ip'],
    datetime: json['datetime'],
    day_of_week: json['day_of_week'],
    day_of_year: json['day_of_year'],
    dst: json['dst'],
    raw_offset: json['raw_offset'],
    utc_datetime: json['utc_datetime'],
    utc_offset: json['utc_offset'],
    week_number: json['week_number'],
  );
}