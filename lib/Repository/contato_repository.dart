import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/contato.dart';

class ContatoRepository {
  var _dio = new Dio();
  ContatoRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        "8JYUlvYbwbB0GvKmGLR4cT86Jyb00ze6cSAI2wnh";
    _dio.options.headers["accept"] = "application/json";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        " lRANodzpWovvMuBSBKWn3kCFMaiDBJFkwrXlNWnJ";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
  }

  Future<List<ContatoModel>> getContato() async {
    var result = await _dio.get("/Contatos");

    //print(result.data);
    try {
      if (result.statusCode == 200) {
        print(ContatoModel.fromJson(result.data).toJson());
        var resultado = jsonDecode(result.data);

        return (resultado as List)
            .map((e) => ContatoModel.fromJson(e))
            .toList();
      } else {
        throw Exception("Erro na solicitação");
      }
    } catch (e) {
      print("ocorreu um exception${e}");
      throw Exception("Erro na solicitação");
    }
  }

  Future<void> create(ContatoModel contatomodel) async {
     await _dio.post('/CreateContato',data: contatomodel);
  }
}
