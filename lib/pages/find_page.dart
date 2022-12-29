import 'package:flutter/material.dart';
import 'package:flutter_final_test/api/api_del.dart';
import 'package:flutter_final_test/pages/new_company_page.dart';
import 'package:flutter_final_test/pages/new_job_page.dart';

import 'package:flutter_final_test/widget/list_view_company_all.dart';
import 'package:flutter_final_test/widget/list_view_job_all.dart';

class FindData extends StatefulWidget {
  const FindData({super.key});

  @override
  State<FindData> createState() => _FindDataState();
}

class _FindDataState extends State<FindData> {
  var flag = 'job';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Результати пошуку вакансій')),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      flag = 'job';
                    });
                  },
                  child: const Text('пошук по\n вакансії')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      flag = 'company';
                    });
                  },
                  child: const Text('пошук по\n компанії')),
              Container(),
            ],
          ),
          viewNow(flag),
          Container(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewJob()));
                  },
                  child: const Text('додати вакансію')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewCompany()));
                  },
                  child: const Text('додати компанію')),
              Container(),

              // delete company and job  file ---\lib\api\api_del.dart

              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => deleteCompany()));
              //     },
              //     child: const Text('видалити')),
            ],
          ),
          Container(height: 10),
        ],
      ),
    );
  }
}

viewNow(String flag) {
  if (flag == 'job') {
    return const OpenListJob();
  } else {
    return const OpenListCompany();
  }
}
