import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

dataJobAll() async {
  var url = Uri.http('3.75.134.87', '/flutter/v1/jobs');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var resultJobAll = jsonResponse['result'] as List;

    return resultJobAll;
  } else {
    var serverError = 'serverError';
    return serverError;
  }
}
