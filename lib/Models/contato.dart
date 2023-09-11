class ContatoModel {
  List<Results>? results;

  ContatoModel({this.results});

  ContatoModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? objectId;
  int? idContato;
  String? nome;
  int? telefone;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.objectId,
      this.idContato,
      this.nome,
      this.telefone,
      this.createdAt,
      this.updatedAt});

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    idContato = json['idContato'];
    nome = json['Nome'];
    telefone = json['Telefone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['idContato'] = this.idContato;
    data['Nome'] = this.nome;
    data['Telefone'] = this.telefone;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}