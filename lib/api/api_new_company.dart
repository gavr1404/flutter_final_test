import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

newCompanyApi(name, industry, description) async {
  var url = Uri.http('3.75.134.87', '/flutter/v1/companies');

  Map body = {"name": name, "description": description, "industry": industry};

  var jsonPost = convert.jsonEncode(body);
  var post = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: jsonPost);

  if (post.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(post.body) as Map<String, dynamic>;

    var result = jsonResponse['id'];

    return result;
  }
  return 'failed to add company';
}
