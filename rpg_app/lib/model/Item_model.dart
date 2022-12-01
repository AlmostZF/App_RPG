class Item {
  final String id;
  final String nome;
  final String peso;
  final String alcance;
  final String dano;
  final String resistencia;
  final String preco;
  final String itemUrl;

  const Item ({
    required this.id,
    required this.nome,
    required this.peso,
    required this.alcance,
    required this.dano,
    required this.resistencia,
    required this.preco,
    required this.itemUrl
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'],
        nome: json['nome'],
        peso: json['peso'],
        alcance: json['alcance'],
        preco: json['preco'],
        dano: json['dano'],
        resistencia: json['resistencia'],
        itemUrl: json['itemUrl']
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['peso'] = peso;
    data['alcance'] = alcance;
    data['preco'] = preco;
    data['dano'] = dano;
    data['resistencia'] = resistencia;
    data['itemUrl'] = itemUrl;

    return data;
  }
}
