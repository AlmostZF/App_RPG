class Power {
  final String id;
  final String nome;
  final String tempoconjuracao;
  final String alcance;
  final String duracao;
  final String mana;
  final String dano;
  final String componente;
  final String nivel;

  const Power({
    required this.id,
    required this.nome,
    required this.tempoconjuracao,
    required this.alcance,
    required this.duracao,
    required this.mana,
    required this.dano,
    required this.componente,
    required this.nivel,
  });

  factory Power.fromJson(Map<String, dynamic> json) => Power(
        id: json['id'],
        nome: json['nome'],
        tempoconjuracao: json['tempoconjuracao'],
        alcance: json['alcance'],
        duracao: json['duracao'],
        nivel: json['nivel'],
        mana: json['mana'],
        dano: json['dano'],
        componente: json['componente'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['tempoconjuracao'] = tempoconjuracao;
    data['alcance'] = alcance;
    data['duracao'] = duracao;
    data['nivel'] = nivel;
    data['mana'] = mana;
    data['dano'] = dano;
    data['componente'] = componente;

    return data;
  }
}
