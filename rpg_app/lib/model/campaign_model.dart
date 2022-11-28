class Campaign {
  final String id;
  final String nome;
  final String descricao;

  const Campaign({
    required this.id,
    required this.nome,
    required this.descricao,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        id: json['id'],
        nome: json['nome'],
        descricao: json['descricao'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['descricao'] = descricao;

    return data;
  }
}
