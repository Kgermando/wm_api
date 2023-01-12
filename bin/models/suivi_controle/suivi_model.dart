class SuiviModel {
  late int? id;
  late String nomSocial; // Nom de l'entreprise
  late String travailEffectue;
  late String accuseeReception;
  late String signature;
  late DateTime created;


  SuiviModel(
     {this.id,
      required this.nomSocial,
      required this.travailEffectue,
      required this.accuseeReception,
      required this.signature,
      required this.created
    }
  );
  factory SuiviModel.fromSQL(List<dynamic> row) {
    return SuiviModel(
     id: row[0],
      nomSocial: row[1],
      travailEffectue: row[2],
      accuseeReception: row[3],
      signature: row[4],
      created: row[5]
    );
  }
  
   factory SuiviModel.fromJson(Map<String, dynamic> json) {
    return SuiviModel(
     id: json['id'],
      nomSocial: json['nomSocial'],
      travailEffectue: json['travailEffectue'],
      accuseeReception: json['accuseeReception'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomSocial': nomSocial,
      'travailEffectue': travailEffectue,
      'accuseeReception': accuseeReception,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}