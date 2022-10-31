class Person {
  final String id;
  final String nome;
  final String jogador; //Mudar para apelido ?
  final String raca;
  final String classe;
  final String nivel;
  final String historia;
  final String ideais;
  final String forca;
  final String destreza;
  final String constituicao;
  final String inteligencia;
  final String sabedoria;
  final String carisma;
  final String vida;
  final String mana;
  final String avatarUrl;

  const Person({
    required this.id,
    required this.nome,
    required this.jogador,
    required this.raca,
    required this.classe,
    required this.nivel,
    required this.historia,
    required this.ideais,
    required this.forca,
    required this.destreza,
    required this.constituicao,
    required this.inteligencia,
    required this.sabedoria,
    required this.carisma,
    required this.vida,
    required this.mana,
    required this.avatarUrl,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
      id: json['id'],
      nome: json['nome'],
      jogador: json['jogador'],
      raca: json['raca'],
      classe: json['classe'],
      nivel: json['nivel'],
      historia: json['historia'],
      ideais: json['ideais'],
      forca: json['forca'],
      destreza: json['destreza'],
      constituicao: json['constituicao'],
      inteligencia: json['inteligencia'],
      sabedoria: json['sabedoria'],
      carisma: json['carisma'],
      vida: json['vida'],
      mana: json['mana'],
      avatarUrl: json['avatarUrl']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['raca'] = raca;
    data['jogador'] = jogador;
    data['classe'] = classe;
    data['nivel'] = nivel;
    data['historia'] = historia;
    data['ideais'] = ideais;
    data['forca'] = forca;
    data['destreza'] = destreza;
    data['constituicao'] = constituicao;
    data['inteligencia'] = inteligencia;
    data['sabedoria'] = sabedoria;
    data['carisma'] = carisma;
    data['vida'] = vida;
    data['mana'] = mana;
    data['avatarUrl'] = avatarUrl;
    return data;
  }
}


