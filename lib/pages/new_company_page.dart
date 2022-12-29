import 'package:flutter/material.dart';
import 'package:flutter_final_test/widget/new_company_widget.dart';

class NewCompany extends StatefulWidget {
  const NewCompany({super.key});

  @override
  State<NewCompany> createState() => _NewCompanyState();
}

class _NewCompanyState extends State<NewCompany> {
  final name = TextEditingController();
  final industry = TextEditingController();
  final description = TextEditingController();

  var nameCompany = '';
  var industryCompany = '';
  var descriptionCompany = '';
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Додати нову компанію'),
      ),
      body: Column(
        children: [
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
                  controller: name,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Вкажить назву компанії",
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
                  controller: industry,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Вкажить сферу діяльності",
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              height: 200,
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
                    hintText: "Додайте інформацію о компанії",
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (name.text != '' &&
                    industry.text != '' &&
                    description.text != '') {
                  flag = true;
                  nameCompany = name.text.toString();
                  descriptionCompany = description.text.toString();
                  industryCompany = industry.text.toString();

                  name.clear();
                  industry.clear();
                  description.clear();
                  FocusScope.of(context).requestFocus(FocusNode());
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('додати компанію')),
          Container(
            height: 10,
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (flag == true) {
                flag = false;

                return NewCompanyWidget(
                    name: nameCompany,
                    description: descriptionCompany,
                    industry: industryCompany);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
