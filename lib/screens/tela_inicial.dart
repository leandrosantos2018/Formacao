import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/contato.dart';
import 'package:flutter_application_1/Repository/contato_repository.dart';
import 'package:flutter_application_1/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  ContatoRepository contatoRepository = ContatoRepository();

  var dataList = <ContatoModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CarragarDados();
  }

  CarragarDados() async {
    dataList = await contatoRepository.getContato();

    setState(() {});

    //print("Erro ao Buscar Dados ");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contatos'),
          leading: const Icon(Icons.person),
        ),
        body: null //ListView.builder(
        //   itemCount: dataList.length,
        //   itemBuilder: (_, int index) {
        //     var contato = dataList.map((e) => e);

        //     print(contato);

        //     print(dataList.length);
        //     return dataList.length == 0
        //         ? Center(child: CircularProgressIndicator())
        //         : ListTile(
        //             title: Text(contato != null
        //                 ? contato.results![index].nome ?? ""
        //                 : ""),
        //             subtitle: Text(contato != null
        //                 ? contato.results![index].nome?.toString() ?? ""
        //                 : ""),
        //           );
        //   });
        );
    floatingActionButton:
    FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FormScreen(),
          ),
        );
      },
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
    );
  }
}
