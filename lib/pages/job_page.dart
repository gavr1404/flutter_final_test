import 'package:flutter/material.dart';
import 'package:flutter_final_test/pages/find_page.dart';
import 'package:flutter_final_test/widget/list_view_job_company.dart';
import 'package:flutter_final_test/widget/name_company.dart';

class JobPage extends StatelessWidget {
  const JobPage(
      {super.key,
      required this.id,
      required this.companyId,
      required this.title,
      required this.description,
      required this.city});
  final int id;
  final int companyId;
  final String title;
  final String description;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вакансія - $title'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              'City - $city',
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
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: NameCompamy(idCompany: companyId),
            ),
            const Center(
              child: Text(
                'Перелік всіх вакансій цієї компанії',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
            ),
            OpenJobCompany(id: companyId),
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
      ),
    );
  }
}
