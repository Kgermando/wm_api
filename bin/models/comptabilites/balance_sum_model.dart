class BalanceSumModel { 
  late String comptes;
  late double debit;
  late double credit; 

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
