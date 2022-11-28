class Campaign {
  final String id;
  final String nome;
  final String descricao;
  final String pAtivos;

  const Campaign({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.pAtivos,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        id: json['id'],
        nome: json['nome'],
        descricao: json['descricao'],
        pAtivos: json['p_ativos'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['pativos'] = pAtivos;

    return data;
  }
}
