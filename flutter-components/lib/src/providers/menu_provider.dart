import 'package:flutter/services.dart';

import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    //dataLoad();
  }

  Future<List<dynamic>> dataLoad() async {
    final res = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(res);
    options = dataMap['routes'];

    return options;
  }
}

final menuProvider = new _MenuProvider();
