import 'package:flutter/material.dart';
import 'package:flutter_final_test/api/api_job_all.dart';
import 'package:flutter_final_test/pages/job_page.dart';

class OpenListJob extends StatelessWidget {
  const OpenListJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: dataJobAll(),
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
              var jobs = result[index];
              var companyId = jobs['companyId'];

              var title = jobs['title'];
              var description = jobs['description'];
              var city = jobs['city'];
              var id = jobs['id'];
              return Card(
                color: Colors.blue[300],
                child: ListTile(
                  title: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobPage(
                                  id: id,
                                  companyId: companyId,
                                  title: title,
                                  description: description,
                                  city: city)));
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                '$title',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'city - $city',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
