import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/model/power_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/view/battle_screen.dart';
import 'package:rpg_app/view/modal_poder.dart';

class PowerCircle extends StatelessWidget {
  final Power power;
  const PowerCircle(this.power);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        power.id == "16645214"
            ? Navigator.of(context).pushNamed(AppRoutes.modalForm)
            : Navigator.of(context).pushNamed(
                AppRoutes.modalForm,
                arguments: power,
              );
      },
      child: CircleAvatar(
        child: ClipOval(
          child: Text("${power.nome}"),
        ),
      ),
    );
  }
}
