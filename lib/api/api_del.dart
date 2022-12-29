import 'package:http/http.dart' as http;

// видалення компанії та вакансії - примусово вводити id

deleteCompany() {
  var id = '75';
  // var url = Uri.http('3.75.134.87', '/flutter/v1/companies/$id'); // delete company
  var url = Uri.http('3.75.134.87', '/flutter/v1/jobs/$id'); // delete job

  var delete = http.delete(url);
  print(delete);
  return 'ok';
}
