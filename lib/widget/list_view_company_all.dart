import 'package:flutter/material.dart';
import 'package:flutter_final_test/pages/company_page.dart';
import 'package:flutter_final_test/api/api_company_all.dart';

class OpenListCompany extends StatelessWidget {
  const OpenListCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: dataCompanyAll(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
                child: SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10.0,
                backgroundColor: Colors.cyanAccent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ));
          }
          if (snapshot.data.toString() == 'serverError') {
            return const Center(child: Text('Server Error...'));
          }
          final result = snapshot.data as List;

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: result.length,
            itemBuilder: (BuildContext context, int index) {
              var company = result[index];
              var name = company['name'];
              var industry = company['industry'];
              var description = company['description'];
              int id = company['id'];
              return Card(
                color: Colors.blue[300],
                child: ListTile(
                  title: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompanyPage(
                                    id: id,
                                    name: name,
                                    description: description,
                                    industry: industry,
                                  )));
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Company - $name',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              width: 20,
                            ),
                            Flexible(
                              child: Text(
                                'Industry - $industry',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 10,
                        ),
                        Text(
                          'Description - $description',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
