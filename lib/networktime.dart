
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:networktime/app_network_model.dart';


class Networktime {

  Networktime._();

  static NetworkModel? _networkModel;

  // IT'LL HELP TO INITIALIZE THE NETWORK MODEL FOR FIND IP, TIMEZONE
  void initState() {
    _fetchNetworkTime(isUTC: false);
  }

  static Future<DateTime?> now({bool utc = false}) async => await _fetchNetworkTime(isUTC: utc);

  static String? ip() => _networkModel?.client_ip;

  static String? timeZone() => _networkModel?.timezone;

  static int? weekNumber() => _networkModel?.week_number;

  static Future<DateTime?> _fetchNetworkTime({bool isUTC = false}) async {
    try {
      var url = Uri.https("worldtimeapi.org", "/api/ip");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        _networkModel = NetworkModel.fromJson(jsonDecode(response.body));
        print("RESPONSE:\t${_networkModel?.datetime}");
        var data = DateTime.tryParse((isUTC) ? "${_networkModel?.utc_datetime}" : "${_networkModel?.datetime}");
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
