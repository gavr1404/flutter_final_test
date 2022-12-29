import 'package:flutter/material.dart';
import 'package:flutter_final_test/api/api_company_all.dart';
import 'package:flutter_final_test/pages/company_page.dart';

class NameCompamy extends StatelessWidget {
  const NameCompamy({super.key, required this.idCompany});
  final int idCompany;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataCompanyAll(),
      builder: (context, snapshot) {
        var nameCampany = '';
        var description = '';
        var industry = '';
        if (snapshot.data == null) {
          return const Text('.....');
        }
        if (snapshot.data.toString() == 'serverError') {
          return const Text('Server Error...');
        }
        var result = snapshot.data as List;

        for (int i = 0; i < result.length; i++) {
          var company = result[i] as Map;
          if (company['id'] == idCompany) {
            nameCampany = company['name'];
            description = company['description'];
            industry = company['industry'];
          }
        }
        return TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CompanyPage(
                          id: idCompany,
                          name: nameCampany,
                          description: description,
                          industry: industry,
                        )));
          },
          child: Text(
            'Company - $nameCampany',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        );
      },
    );
  }
}
