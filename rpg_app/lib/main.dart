import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rpg_app/controller/campaign_controller.dart';
import 'package:rpg_app/controller/item_controller.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/controller/power_controller.dart';
import 'package:rpg_app/model/campaign_model.dart';
import 'package:rpg_app/model/Item_model.dart';
import 'package:rpg_app/model/power_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/view/invetory_screen.dart';
import 'package:rpg_app/view/master_screen.dart';
import 'package:rpg_app/view/modal_Item.dart';
import 'package:rpg_app/view/modal_poder.dart';
import 'package:rpg_app/view/campaigns_screen.dart';
import 'package:rpg_app/view/homePage.dart';
import 'package:rpg_app/view/persons_screen.dart';
import 'package:rpg_app/view/register_campaign_screen.dart';
import 'package:rpg_app/view/register_screen.dart';
import 'package:rpg_app/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ),
        ChangeNotifierProvider(
          create: (ctx) => Powers(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Campaigns(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Items(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: secondColorMaterial,
            scaffoldBackgroundColor: backgroundColor,
            hintColor: otherColor),
        initialRoute: AppRoutes.splashScreen,
        routes: {
          AppRoutes.personScreen: (_) => const PersonScreen(),
          AppRoutes.splashScreen: (_) => const SplashScreen(),
          AppRoutes.home: (_) => const HomePage(),
          AppRoutes.modalItem:(_) => const ModalItem(Item(id:"", nome: "", peso: "", alcance: "", dano: "", resistencia: "", preco: "", itemUrl: "")),
          AppRoutes.persomForm: (_) => const RegisterScreen(),
          AppRoutes.campaignForm: (_) => const RegisterCampaignScreen(),
          AppRoutes.roomsScreen: (_) => const CampaignsScreen(),
          AppRoutes.masterScreen: (_) => const MasterScreen(Campaign(
                descricao: "",
                id: "",
                nome: "",
                pAtivos: "",
              )),
          AppRoutes.modalForm: (_) => const ModalPoder(Power(
                alcance: "",
                componente: "",
                dano: "",
                duracao: "",
                id: "",
                mana: "",
                nivel: "",
                nome: "",
                tempoconjuracao: "",
                poderUrl:"",
              )),
            AppRoutes.invetory: (_) => Invetory(Items())
        },
      ),
    );
  }
}
