import 'package:flutter/material.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/view/battle_screen.dart';
import 'package:rpg_app/view/homePage.dart';
import 'package:rpg_app/view/persons_screen.dart';
import 'package:rpg_app/view/register_screen.dart';

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
          create: (ctx) => Persons(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF1C0D2E),
          hintColor: Colors.white,
        ),
        routes: {
          AppRoutes.home: (_) => const HomePage(),
          //AppRoutes.battleScreen: (_) => const BattleScreen(),
          AppRoutes.persomForm: (_) => const RegisterScreen(),
          AppRoutes.personScreen: (_) => const PersonScreen(),
        },
      ),
    );
  }
}
