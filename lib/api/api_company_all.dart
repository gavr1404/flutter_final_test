import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

dataCompanyAll() async {
  var url = Uri.http('3.75.134.87', '/flutter/v1/companies');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var resultCompanyAll = jsonResponse['result'] as List;

    return resultCompanyAll;
  } else {
    var serverError = 'serverError';
    return serverError;
  }
}
