import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/difficulty.dart';
import 'package:flutter_application_1/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController DefficultyController = TextEditingController();
  TextEditingController ImageController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Novo Contato'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 3),
                color: Color.fromARGB(31, 86, 125, 233),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //imagem
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            ImageController.text,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Container(
                                child: Image.asset('assets/images/nophoto.png'),
                              );
                            },
                          )),
                    ),
                  ),

                  //url
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' Insira um URL de imagem';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {
                          ImageController.text;
                        });
                      },
                      controller: ImageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Url Imagens',
                        fillColor: const Color.fromARGB(179, 250, 250, 250),
                        filled: true,
                      ),
                    ),
                  ),
                  //nome do Contato
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Inserir nome do Contato';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  //input telefone
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return ' Inseria um Numero Valido';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: DefficultyController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Telefone',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),

                  //button
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        TaskInherited.of(context).newTesk(
                            nameController.text,
                            ImageController.text,
                            int.parse(DefficultyController.text));

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            dismissDirection: DismissDirection.up,
                            backgroundColor: Colors.green,
                            content: Text(
                              'Salvado com Sucesso !!',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Save',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
