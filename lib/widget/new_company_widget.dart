import 'package:flutter/material.dart';
import 'package:flutter_final_test/api/api_new_company.dart';
import 'package:flutter_final_test/pages/new_job_page.dart';

class NewCompanyWidget extends StatelessWidget {
  const NewCompanyWidget({
    super.key,
    required this.name,
    required this.description,
    required this.industry,
  });
  final String name;
  final String description;
  final String industry;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: newCompanyApi(name, industry, description),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  strokeWidth: 6.0,
                  backgroundColor: Colors.cyanAccent,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
            );
          }

          if (snapshot.data.toString() == 'failed to add company') {
            return const Expanded(
              child: SimpleDialog(
                children: [
                  Center(
                    child: Text('failed to add company'),
                  )
                ],
              ),
            );
          }

          final result = snapshot.data.toString();
          return Expanded(
            child: SimpleDialog(
              children: [
                Center(
                  child: Text(
                    "Вітаю! Компанію додано.Id - $result",
                    style: const TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewJob()));
                      },
                      child: const Text('Додати вакансію')),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
