class AgentRoleModel {
  late int? id;
  late int reference;
  late String departement;
  late String agent;
  late String role;

  AgentRoleModel(
      {this.id,
      required this.reference,
      required this.departement,
      required this.agent,
      required this.role});

  factory AgentRoleModel.fromSQL(List<dynamic> row) {
    return AgentRoleModel(
        id: row[0],
        reference: row[1],
        departement: row[2],
        agent: row[3],
        role: row[4]);
  }

  factory AgentRoleModel.fromJson(Map<String, dynamic> json) {
    return AgentRoleModel(
        id: json['id'],
        reference: json['reference'],
        departement: json['departement'],
        agent: json['agent'],
        role: json['role']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'departement': departement,
      'agent': agent,
      'role': role
    };
  }
}
