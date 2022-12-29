import 'package:flutter/material.dart';
import 'package:flutter_final_test/api/api_company_all.dart';
import 'package:flutter_final_test/pages/find_page.dart';
import 'package:flutter_final_test/widget/new_job_widget.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class NewJob extends StatefulWidget {
  const NewJob({super.key});

  @override
  State<NewJob> createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  final title = TextEditingController();
  final description = TextEditingController();
  final city = TextEditingController();

  String idCompany = '';
  List<dynamic> nameCompamy = [];
  String titleJob = '';
  String descriptionJob = '';
  String cityJob = '';
  bool flag = false;
  String nameCompanyId = '';

  @override
  void initState() {
    dataCompanyAll().then((resultCompanyAll) {
      setState(() {
        if (resultCompanyAll is List) nameCompamy = resultCompanyAll;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Додати нову вакансію'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 10,
            ),

            //dropDownWidget ///////////////////
            FormHelper.dropDownWidget(
              context,
              'оберить компанію',
              nameCompanyId,
              nameCompamy,
              (onCangedVal) {
                nameCompanyId = onCangedVal;
                idCompany = onCangedVal;
              },
              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Виберить компанію';
                }
                return null;
              },
              borderFocusColor: Colors.blueAccent,
              // borderColor: Colors.blueAccent,
              borderRadius: 10,
              optionValue: 'id',
              optionLabel: 'name',
            ),
            /////////////////////////////////////

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: title,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Назва вакансії",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: city,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Місто",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    maxLines: 7,
                    keyboardType: TextInputType.text,
                    controller: description,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Додайте інформацію о вакансії",
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (idCompany != '' &&
                      title.text != '' &&
                      description.text != '' &&
                      city.text != '') {
                    flag = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                    titleJob = title.text.toString();
                    descriptionJob = description.text.toString();
                    cityJob = city.text.toString();

                    title.clear();
                    city.clear();
                    description.clear();
                    setState(() {
                      flag = true;
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) {
                        flag = false;
                        return SimpleDialog(
                          backgroundColor: Colors.blue[50],
                          children: const [
                            Center(
                              child: Text(
                                "Заповнить всі поля ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('додати вакансію')),
            Container(
              height: 10,
            ),

            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (flag == true) {
                  flag = false;
                  return NewJobCreated(
                      idCompany: idCompany.toString(),
                      titleJob: titleJob.toString(),
                      descriptionJob: descriptionJob.toString(),
                      cityJob: cityJob.toString());
                }
                return Container();
              },
            ),
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
