import 'package:flutter/material.dart';
import 'package:flutter_final_test/api/api_new_job.dart';

class NewJobCreated extends StatelessWidget {
  const NewJobCreated({
    super.key,
    required this.idCompany,
    required this.titleJob,
    required this.descriptionJob,
    required this.cityJob,
  });
  final String idCompany;
  final String titleJob;
  final String descriptionJob;
  final String cityJob;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: newJobApi(idCompany, titleJob, descriptionJob, cityJob),
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
          if (snapshot.data.toString() == 'failed to add job') {
            return const Expanded(
              child: SimpleDialog(
                children: [
                  Center(
                    child: Text('failed to add job'),
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
                    "Вітаю! Вакансію додано.Id - $result",
                    style: const TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
