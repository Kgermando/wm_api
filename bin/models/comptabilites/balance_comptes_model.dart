class BalanceModel {
  late int? id;
  late String comptes;
  late String debit;
  late String credit;
  late String solde;
  late String signature;
  late DateTime created;

  BalanceModel(
      {this.id,
      required this.comptes,
      required this.debit,
      required this.credit,
      required this.solde,
      required this.signature,
      required this.created});

  factory BalanceModel.fromSQL(List<dynamic> row) {
    return BalanceModel(
        id: row[0],
        comptes: row[1],
        debit: row[2],
        credit: row[3],
        solde: row[4],
        signature: row[5],
        created: row[6]);
  }

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      id: json['id'],
      comptes: json['comptes'],
      debit: json['debit'],
      credit: json['credit'],
      solde: json['solde'],
      signature: json['signature'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comptes': comptes,
      'debit': debit,
      'credit': credit,
      'solde': solde,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}



class BalanceSumModel { 
  late String comptes;
  late String debit;
  late String credit; 

  BalanceSumModel({ 
      required this.comptes,
      required this.debit,
      required this.credit 
    }
  );

  factory BalanceSumModel.fromSQL(List<dynamic> row) {
    return BalanceSumModel(
      comptes: row[0],
      debit: row[1],
      credit: row[2]
    );
  }


  factory BalanceSumModel.fromJson(Map<String, dynamic> json) {
    return BalanceSumModel( 
      comptes: json['comptes'],
      debit: json['sum'],
      credit: json['sum'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return { 
      'comptes': comptes,
      'debit': debit,
      'credit': credit 
    };
  }
}
