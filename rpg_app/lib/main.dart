import 'package:flutter/material.dart';
import 'package:rpg_app/provider/personagens.dart';
import 'package:rpg_app/routes/approutes.dart';
import 'package:rpg_app/view/personagemListPage.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/view/registerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Personagens(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (_) => PersonagemListPage(),
          AppRoutes.PERSONAGEM_FORM: (_) => RegisterPage()
        },
      ),
    );
  }
}
