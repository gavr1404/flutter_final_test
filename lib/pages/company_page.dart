import 'package:flutter/material.dart';
import 'package:flutter_final_test/pages/find_page.dart';
import 'package:flutter_final_test/widget/list_view_job_company.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage(
      {super.key,
      required this.id,
      required this.name,
      required this.description,
      required this.industry});
  final int id;
  final String name;
  final String description;
  final String industry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Компанія - $name'),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Text(
                'Industry - $industry',
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                ),
              ),
              Center(
                child: Text(
                  'Description - $description',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                height: 12,
              ),
              const Center(
                child: Text(
                  'Перелік всіх вакансій цієї компанії',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ),
              OpenJobCompany(id: id),
              Container(height: 15),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FindData()));
          },
          child: const Icon(Icons.home),
        ));
  }
}
